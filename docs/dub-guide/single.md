# Single-file packages

!!! note "Work-in-Progress Documentation"

    The content on this page is not yet fully finished.

    Tracking issue: <https://github.com/WebFreak001/dub-docs-v2/issues/7>

For small or script-like applications, DUB supports a special mode where the whole package is contained in a single .d file. The package recipe description can be embedded into code comments within the file:

=== "hello.d"

    ```d
    #!/usr/bin/env dub
    /+ dub.sdl:
        name "hello"
    +/
    void main() {
        import std.stdio : writeln;
        writeln("Hello, World!");
    }
    ```

!!! cli "Console example"
    <pre>
    $ chmod +x hello.d
    $ ./hello.d
    Hello, World!<br/>
    <span class="col_transparent"># these are the same and will NOT show dub output:</span>
    $ ./hello.d
    $ dub ./hello.d
    <span class="col_transparent"># these are the same, but WILL show dub output:</span>
    $ dub --single ./hello.d
    $ dub run --single ./hello.d
    </pre>

This application can be executed by running `dub run --single hello.d`, or just compiled with `dub build --single hello.d`.

In addition to the normal method of passing commandline arguments, you can use the shorthand `dub hello.d <arguments to hello>`. This shorthand and the optional shebang allow you to run applications via `./hello <arguments>` from your shell if you set the executable bit of the file.

!!! bug "Startup delay"

    Directly calling `./hello.d` or using `dub hello.d` does not cache the built executable and will rebuild on every invocation. This may be fine for smaller scripts, but will add noticable start-up delay, especially when put behind something like keyboard shortcuts.

    For repeatedly used CLI tools, prefer using `dub build --single hello.d`, which generates `hello` / `hello.exe`, which can be run immediately without compilation startup delay.

    This may be fixed in the future, utilizing the temporary directory of the OS. See [DUB#2672](https://github.com/dlang/dub/issues/2672)

Single-file packages cannot be used to create library packages.

## Differences between `dub hello.d` and `dub --single hello.d`

When the `--single` flag is explicitly set, DUB will use the regular CLI parsing, so you need to specify custom arguments afterwards using `--` such as `dub --single hello.d -- my args here`. This however also means that you can use all the dub commands and arguments to change how the build is done.

Without that flag, DUB has a special CLI parsing mode which will just pass-through all the arguments and not attempt to parse any of them itself. This means you don't have to pass a `--`, but also that you can't pass any DUB arguments to modify compilation or execution.

DUB uses the special parsing mode if any of those is the case:

- the first argument is `-`
    - in which case the source code is read from stdin, temporarily saved and executed
- the first argument ends with `.d`
- the first argument is not a built-in command name, does not start with `-` and exists on file
- the first argument is not a built-in command name, does not start with `-` and exists on file with a `.d` suffix
    - to support `dub hello` when hello.d is in the current folder - note this has some issues, see [DUB#2681](https://github.com/dlang/dub/issues/2681)

Internal transformation in case of special parsing mode:

```
dub -
->
dub run -q --temp-build --single /tmp/app_[random UUID].d --
```

```
dub foo.d bar baz
->
dub run -q --temp-build --single foo.d -- bar baz
```
