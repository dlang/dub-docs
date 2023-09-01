# Build types

DUB combines build options and requirements from two sources when building:

- [Configuration](./configurations.md), through the `--config=...` switch
- Build type, through the `--build=...` switch

While technically the two things are often very similar, semantically it makes sense to split them into two distinct categories. While configurations represent possibly completely different compilation units and adjust what things should go into the final target, build types rather tweak all configurations in a generic way, such as "debug" mode builds, "release" mode builds or coverage mode builds.

By default DUB ships with a variety of default `--build=...` types which are also summarized on the [recipe guide](../dub-guide/recipe.md).

Using [`dub build --print-builds`](../cli-reference/dub-build.md) it's possible to list the available build types and which one is the default.

## Syntax

=== "dub.sdl"

    ```sdl
    buildType "[name]" {
        [build settings]
    }
    ```

    The `buildType` directive may be repeated any number of times with unique names.

=== "dub.json"

    ```json
    {
        "buildTypes": {
            "[name]": {
                <build settings>
            }
        }
    }
    ```

    The `buildTypes` key may contain any number of uniquely named build types.

All [build settings](./build_settings.md) are allowed inside each build type block. This differs from configuration that they don't have the extra `name` field or `platform` field.

## Default Examples

These are the default build type definitions. (you can simply copy these into your [recipe](../dub-guide/recipe.md) file to override them)

The default build types usually only override [buildOptions](./build_settings.md#buildoptions) and [dflags](./build_settings.md#dflags), but all other build settings are supported here too.

=== "dub.sdl"

    ```sdl
    buildType "plain" {}
    buildType "debug" {
        buildOptions "debugMode" "debugInfo"
    }
    buildType "release" {
        buildOptions "releaseMode" "optimize" "inline"
    }
    buildType "release-debug" {
        buildOptions "releaseMode" "optimize" "inline" "debugInfo"
    }
    buildType "release-nobounds" {
        buildOptions "releaseMode" "optimize" "inline" "noBoundsCheck"
    }
    buildType "unittest" {
        buildOptions "unittests" "debugMode" "debugInfo"
    }
    buildType "docs" {
        buildOptions "syntaxOnly"
        dflags "-Dddocs"
    }
    buildType "ddox" {
        buildOptions "syntaxOnly"
        dflags "-Xfdocs.json" "-Df__dummy.html"
    }
    buildType "profile" {
        buildOptions "profile" "optimize" "inline" "debugInfo"
    }
    buildType "profile-gc" {
        buildOptions "profileGC" "debugInfo"
    }
    buildType "cov" {
        buildOptions "coverage" "debugInfo"
    }
    buildType "cov-ctfe" {
        buildOptions "coverageCTFE" "debugInfo"
    }
    buildType "unittest-cov" {
        buildOptions "unittests" "coverage" "debugMode" "debugInfo"
    }
    buildType "unittest-cov-ctfe" {
        buildOptions "unittests" "coverageCTFE" "debugMode" "debugInfo"
    }
    buildType "syntax" {
        buildOptions "syntaxOnly"
    }
    ```

=== "dub.json"

    ```json
    {
        "buildTypes": {
            "plain": {},
            "debug": {
                "buildOptions": ["debugMode", "debugInfo"]
            },
            "release": {
                "buildOptions": ["releaseMode", "optimize", "inline"]
            },
            "release-debug": {
                "buildOptions": ["releaseMode", "optimize", "inline", "debugInfo"]
            },
            "release-nobounds": {
                "buildOptions": ["releaseMode", "optimize", "inline", "noBoundsCheck"]
            },
            "unittest": {
                "buildOptions": ["unittests", "debugMode", "debugInfo"]
            },
            "docs": {
                "buildOptions": ["syntaxOnly"],
                "dflags": ["-Dddocs"]
            },
            "ddox": {
                "buildOptions": ["syntaxOnly"],
                "dflags": ["-Xfdocs.json", "-Df__dummy.html"]
            },
            "profile": {
                "buildOptions": ["profile", "optimize", "inline", "debugInfo"]
            },
            "profile-gc": {
                "buildOptions": ["profileGC", "debugInfo"]
            },
            "cov": {
                "buildOptions": ["coverage", "debugInfo"]
            },
            "cov-ctfe": {
                "buildOptions": ["coverageCTFE", "debugInfo"]
            },
            "unittest-cov": {
                "buildOptions": ["unittests", "coverage", "debugMode", "debugInfo"]
            },
            "unittest-cov-ctfe": {
                "buildOptions": ["unittests", "coverageCTFE", "debugMode", "debugInfo"]
            },
            "syntax": {
                "buildOptions": ["syntaxOnly"]
            }
        }
    }
    ```

### `--build=plain`

The `plain` build type can be used to run the compiler without any special building flags. This can be useful if you have a custom compiler or configured it externally (e.g. through [ldc2.conf](https://wiki.dlang.org/Using_LDC)) and don't want to have any extra arguments applied to it.

Note that buildOptions and buildRequirements that are otherwise set by configurations or by default still apply. (most concretely this means the `-w` warnings as errors flag is set by the default buildRequirements)

### `--build=debug`

This is the default build mode when not specifying any other build type from the command line.

This is a sane default for debugging builds, but the resulting executable can be quite slow in some places. When deploying to production you may want to consider using `--build=release` or `--build=release-debug` instead.

### `--build=release`

Compiles the application with optimization and inlining enabled and enabling release mode. (disabling assertions and bounds checks)

When deploying your application to other places (publishing them to the internet, running them on a server, etc.) you will probably want to use `--build=release` or its closely related alternatives.

Code safety may be compromised if you otherwise get range errors in your debug builds as they may not be thrown here and undefined behavior, such as reading/writing out of bounds, may result. Code inside `@safe` blocks is not affected by this however.

If your users experience unexpected exceptions and you wish to have readable stack traces you can refer to your code with, use the `--build=release-debug` build mode to also generate debug information for your debugger and exceptions.

### `--build=release-debug`

Compiles the application with optimization and inlining enabled and enabling release mode plus also omitting debug information. (disabling assertions and bounds checks)

This is the same as `--build=release` but also includes symbolic information for your debugger. The symbolic information might not be as accurate as debug information, depending on what the optimizer did and how the compiler further processes it, but for debugging hard to reason about issues, that only appear in release mode, this can be useful.

### `--build=release-nobounds`

Compiles the application with optimization and inlining enabled and enabling release mode and never doing bounds checks. (disabling assertions and completely disables bounds checks)

This is equivalent to `--build=release` with the addition that bounds checks are also not performed in `@safe` code, further reducing code safety while possibly increasing runtime performance.

It's recommended to avoid this build type and instead change the algorithms that are affected by this the most to do a single bounds check before many array accesses and operate on the `ptr` field following that. This results in the same performance improvements while not harming safety.

### `--build=docs`

This is a special build mode generating a static documentation page using the compiler's built-in [documentation generator](https://dlang.org/spec/ddoc.html).

The generated documentation is simple HTML files that can be viewed using a web browser, however they usually do not link to each other or offer any kind of navigation to go to other modules from any one module. For this you may want to use `--build=ddox` or other popular documentation generators such as [adrdox](https://github.com/adamdruppe/adrdox) instead.

### `--build=ddox`

This is a special build mode generating slightly more fancy documentation pages, based on the compiler's built-in [documentation generator](https://dlang.org/spec/ddoc.html).

When running `dub run --build=ddox` a local ddox server will be started up to serve documentation from its HTTP service.

When just building using `dub build --build=ddox` the documentation will be written to disk as static HTML files.

Alternatively to ddox you might want to consider using alternative documentation generators not based on the compiler's built-in documentation generator, such as [adrdox](https://github.com/adamdruppe/adrdox) instead. Such generators usually offer a little more insight into the actual function definition and overloads and can render more functional and interactive pages.

### `--build=profile`

This will compile the executable with profiling instructions added by the compiler. In DMD's case that is the `-profile` flag.

At least using DMD and LDC this will emit a `trace.log` file in the current working directory that shows how often each function in your code was called and how long it was stuck in each function. You can use this as a start to find which functions to optimize.

``` title="trace.log"
------------------
            2   _D3std5stdio__T7writelnTAyaZQnFNfQjZv
_D3std5stdio4File17LockingTextWriter__T3putTAyaZQjMFNfMQlZv     2       29188   14552
            1   _D3std5stdio__T13trustedFwriteTaZQsFNbNiNePOS4core4stdcQBx8_IO_FILExAaZm
------------------
            1   _D3std5stdio__T7writelnTAyaZQnFNfQjZv
_D3std5stdio4File17LockingTextWriter__T3putTaZQhMFNfaZv 1       27708   27708
------------------
            1   _D3std5stdio4File17LockingTextWriter__T3putTAyaZQjMFNfMQlZv
_D3std5stdio__T13trustedFwriteTaZQsFNbNiNePOS4core4stdcQBx8_IO_FILExAaZm        1       14636   14636
------------------
            2   _Dmain
_D3std5stdio__T7writelnTAyaZQnFNfQjZv   2       122977  66081
            2   _D3std5stdio4File17LockingTextWriter__T3putTAyaZQjMFNfMQlZv
            1   _D3std5stdio4File17LockingTextWriter__T3putTaZQhMFNfaZv
------------------
_Dmain  0       123571  594
            2   _D3std5stdio__T7writelnTAyaZQnFNfQjZv

======== Timer frequency unknown, Times are in Megaticks ========

  Num          Tree        Func        Per
  Calls        Time        Time        Call

      2           0           0           0     @safe void std.stdio.writeln!(immutable(char)[]).writeln(immutable(char)[])
      1           0           0           0     @safe void std.stdio.File.LockingTextWriter.put!(char).put(char)
      1           0           0           0     nothrow @nogc @trusted ulong std.stdio.trustedFwrite!(char).trustedFwrite(shared(core.stdc.stdio._IO_FILE)*, const(char[]))
      2           0           0           0     @safe void std.stdio.File.LockingTextWriter.put!(immutable(char)[]).put(scope immutable(char)[])
      1           0           0           0     _Dmain

```

### `--build=profile-gc`

This will record each [GC allocation](https://dlang.org/spec/garbage.html) to a `profilegc.log` file so you can know where a lot of allocations are done on the same code block, which might possibly be better be off pre-allocated to improve on performance.

``` title="profilegc.log"
bytes allocated, allocations, type, function, file:line
          13824             108 d2d.rendering.mesh.Mesh d2d.rendering.rectangleshape.RectangleShape.create ../../.dub/packages/d2dgame-3.0.0-beta.3/d2dgame/source/d2d/rendering/rectangleshape.d:72
           9328              53 d2d.rendering.rectangleshape.RectangleShape d2d.rendering.rectangleshape.RectangleShape.create ../../.dub/packages/d2dgame-3.0.0-beta.3/d2dgame/source/d2d/rendering/rectangleshape.d:115
           6912             108 const(const(gl3n.linalg.Vector!(float, 3).Vector)[]) d2d.rendering.rectangleshape.RectangleShape.create ../../.dub/packages/d2dgame-3.0.0-beta.3/d2dgame/source/d2d/rendering/rectangleshape.d:73
           6912             108 d2d.rendering.mesh.RenderableMesh d2d.rendering.mesh.Mesh.create ../../.dub/packages/d2dgame-3.0.0-beta.3/d2dgame/source/d2d/rendering/mesh.d:166
           6912             108 gl3n.linalg.Vector!(float, 3).Vector[] d2d.rendering.mesh.Mesh.addVertices ../../.dub/packages/d2dgame-3.0.0-beta.3/d2dgame/source/d2d/rendering/mesh.d:103
           6912              54 d2d.rendering.mesh.Mesh d2d.rendering.rectangleshape.RectangleShape.this ../../.dub/packages/d2dgame-3.0.0-beta.3/d2dgame/source/d2d/rendering/rectangleshape.d:31
           5184             108 const(const(gl3n.linalg.Vector!(float, 2).Vector)[]) d2d.rendering.rectangleshape.RectangleShape.create ../../.dub/packages/d2dgame-3.0.0-beta.3/d2dgame/source/d2d/rendering/rectangleshape.d:74
           5184             108 gl3n.linalg.Vector!(float, 2).Vector[] d2d.rendering.mesh.Mesh.addTexCoords ../../.dub/packages/d2dgame-3.0.0-beta.3/d2dgame/source/d2d/rendering/mesh.d:127
           3456             108 const(const(uint)[]) d2d.rendering.rectangleshape.RectangleShape.create ../../.dub/packages/d2dgame-3.0.0-beta.3/d2dgame/source/d2d/rendering/rectangleshape.d:75
           3456             108 uint[] d2d.rendering.mesh.Mesh.addIndices ../../.dub/packages/d2dgame-3.0.0-beta.3/d2dgame/source/d2d/rendering/mesh.d:115
            544              34 char[] std.array.arrayAllocImpl!(false, char[], ulong).arrayAllocImpl /usr/include/dlang/dmd/std/array.d:1112
            512               4 void[] std.array.Appender!(string[]).Appender.ensureAddable.__lambda9 /usr/include/dlang/dmd/std/array.d:3576
            368               1 std.getopt.Option[] std.getopt.getoptImpl!().getoptImpl /usr/include/dlang/dmd/std/getopt.d:798
```

This is useful to see how much the GC is used in actual app execution.

### `--build=cov`

At least when built with DMD, the resulting executable will write to `*.lst` files, corresponding to the input source code, how often each source line was run. These lst files don't offer the most exact call tracing (finest resolution is a line of code), but they can easily be viewed using any text editor to see if code has actually been run or if code has been run a lot of times and might need optimization.

Functions that are only called at compile time in CTFE won't have any calls logged to them. To have them also being logged, use `--build=cov-ctfe`.

``` title="source-app.lst"
       |import std.stdio;
       |
       |void main()
       |{
      1|        writeln("Edit source/app.d to start your project.");
       |}
       |
       |void foo()
       |{
0000000|        writeln("I'm foo!");
       |}
source/app.d is 50% covered
```

On each line that is reachable the amount how often that line was called will be printed. On lines that are reachable, but were never called, (e.g. not covered by tests or program logic) leading `0000000` will be printed to indicate that these lines need testing.

When testing with `dub test`, use the `--build=unittest-cov` build type instead.

This is useful to combine with `dub test --build=unittest-cov` to see if unittests actually test all of the code, but also inside regular `dub run --build=cov` to see if there is dead code during execution.

### `--build=cov-ctfe`

This works the same as `--build=cov`, but also records the lines that are run only at compile time using CTFE. This does not include templates.

When testing with `dub test`, use the `--build=unittest-cov-ctfe` build type instead.

When also testing CTFE code you may want to use `dub test --build=unittest-cov-ctfe` instead of the cov build type. The CTFE addition will add new reachable code that is covered or uncovered.

### `--build=unittest-cov`

This is the same as `--build=cov`, but enables unittests. Use this with

```
dub test --build=unittest-cov
```

to ensure the tests are run properly.

### `--build=unittest-cov-ctfe`

This is the same as `--build=cov-ctfe`, but enables unittests. Use this with

```
dub test --build=unittest-cov-ctfe
```

to ensure the tests are run properly.

### `--build=syntax`

This builds the code without actually emitting or running any object files, executables or library files. This is useful in projects that compile quickly to find errors in syntax or semantics using the compiler.
