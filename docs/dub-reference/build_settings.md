# Build settings

Build settings influence the command line options passed to the compiler and linker. All settings are optional.

Most (but not all) settings support [platform specifications](./platform_specifications.md) to only apply the settings on certain targets.

Additionally it is possible to use environment variables inside of build setting values using dollar notation. Any variable not matching a predefined name will be taken from the program environment. To denote a literal dollar sign, use `$$`. Refer to [the specification](../dub-reference/environment_variables.md) for more details.

## `dependencies`

=== "dub.sdl"

    ```sdl
    ...
    dependency "vibe-d" version="~>0.9.5"

    dependency "localdep" path="../localdep" optional=true default=true
    dependency "remote" repository="git+https://example.org/remote.git" version="a1b2c3d4"
    dependency "modified" version="~>1.2.3" {
        dflags "--special-flag" "-O4"
    }
    ```

    Arguments: `"name" ...`

    Adds one dependency for every used `dependency` directive to the project.

=== "dub.json"

    ```json
    ...
    "dependencies": {
        "vibe-d": "~>0.9.5",

        "localdep": {
            "path": "../localdep",
            "optional": true,
            "default": true
        },
        "remote": {
            "repository": "git+https://example.org/remote.git",
            "version": "a1b2c3d4"
        },
        "modified": {
            "version": "~>1.2.3",
            "dflags": ["--special-flag", "-O4"]
        }
    }
    ```

    Type: `T[string]`

    List of project dependencies given as pairs of `"<name>" : <version-spec>`

This setting does not support platform specifications.

### Version specifications

=== "dub.sdl"

    A dependency can contain a number of attributes that are used for versioning:

    - `version="<version-specified>"` - The version specification as used for the simple form.<br/>
      Specifies a version range to fetch from the registry or local providers<br/>
      or for dependencies with the `repository` attribute set, this specifies the exact commit hash. (commitish)
    - `path="<path-to-package>"` - Use a folder to source a package from.<br/>
      References a package in a specific path. This can be used in situations where a specific copy of a package needs to be used. Examples of this include packages that are included as GIT submodules, or packages in sub folders of the main package, for example when splitting up module functionality.
    - `optional=true` - Indicates an optional dependency.<br/>
      With this set to `true`, the dependency will only be used if explicitly selected in [dub.selections.json](../dub-guide/selections.md). If omitted, this attribute defaults to `false`.<br/>
    - `default=true` - Choose an optional dependency by default.<br/>
      With this set to `true`, the dependency will be chosen by default if no dub.selections.json exists yet. If omitted, this attribute defaults to `false`. Note that this only has an effect if `optional` is also set to `true`.
    - `repository="git+https://example.org/repository.git"` - clone a git repository as dependency.<br/>
      This also requires the `version` attribute to be set to the git commit hash (7 to 40 hex characters).<br/>
      Supported since DUB v1.23.0
    - Since DUB v1.24.0, build settings fields (as described in this document) can also be applied to dependencies through the dependency directive.<br/>
      Note that as of v1.24.0 only `dflags` is supported.

=== "dub.json"

    A dependency version specification can either be a simple string for the version or a more complex variant, allowing more control.

    - Simple variant:<br/>
      `"<name>": "<version-specifier>"`<br/>
      This is the usual way to specify a dependency.
    - Complex variant:
      ` "<name>" : { "<attribute>": "<value>"[, ...] }`<br/>
      The following attributes can be used to control how a dependency is resolved and further processed:
        - `"version": "<version-specified>"` - The version specification as used for the simple form.<br/>
          Specifies a version range to fetch from the registry or local providers<br/>
          or for dependencies with the `repository` attribute set, this specifies the exact commit hash. (commitish)
        - `"path": "<path-to-package>"` - Use a folder to source a package from.<br/>
          References a package in a specific path. This can be used in situations where a specific copy of a package needs to be used. Examples of this include packages that are included as GIT submodules, or packages in sub folders of the main package, for example when splitting up module functionality.
        - `"optional": true` - Indicates an optional dependency.<br/>
          With this set to `true`, the dependency will only be used if explicitly selected in [dub.selections.json](../dub-guide/selections.md). If omitted, this attribute defaults to `false`.
        - `"default": true` - Choose an optional dependency by default.<br/>
          With this set to `true`, the dependency will be chosen by default if no dub.selections.json exists yet. If omitted, this attribute defaults to `false`. Note that this only has an effect if the `"optional"` attribute is also set to `true`.
        - `"repository": "git+https://example.org/repository.git"` - clone a git repository as dependency.<br/>
          This also requires the `version` attribute to be set to the git commit hash (7 to 40 hex characters).<br/>
          Supported since DUB v1.23.0
        - Since DUB v1.24.0, build settings fields (as described in this document) can also be applied to dependencies through the `"dependencies": {}` attributes.<br/>
          Note that as of v1.24.0 only `dflags` is supported.

#### Version specifiers

Version specifiers define a range of acceptable versions. They can be specified in any of the following ways:

* Restrict to a certain minor version: `"~>2.2.13"`, equivalent to `">=2.2.13 <2.3.0"`
* Restrict to a certain major version: `"~>2.2"`, equivalent to `">=2.2.0 <3.0.0"`
* Require a certain version: `"==1.3.0"`
* Require a minimum version: `">=1.3.0"`
* Require a version range: `">=1.3.0 <=1.3.4"`
* Match any released version (equivalent to `">=0.0.0"`): `"*"`
* Use a GIT branch (discouraged, use repository + version instead): `"~master"`

Numbered versions are formatted and compared according to the [SemVer specification](http://semver.org/). The recommended way to specify versions is using the `~>` operator as a way to balance between flexible upgrades and reducing the risk of code breakage.

Whenever you refer to (sub) packages within the same repository, use the "any version" version specifier: `"*"`

!!! hint
    Dependency resolution and further notes are also summarized on the [dependencies](./dependencies.md) specification page.

## `systemDependencies`

=== "dub.sdl"

    ```sdl
    ...
    systemDependencies "OpenSSL (1.1.0 or later, 1.0.0i also supported)"
    ```

    Arguments: `"<text>"`

=== "dub.json"

    ```json
    ...
    "systemDependencies": "OpenSSL (1.1.0 or later, 1.0.0i also supported)"
    ```

    Type: `string`

A textual description of the required system dependencies (external C libraries) required by the package. As of DUB v(unreleased / unimplemented) this will be visible on the registry and will be displayed in case of linker errors.

This value is purely informational and does not affect building.

This setting does not support platform specifications.

## `targetType`

=== "dub.sdl"

    ```sdl
    ...
    targetType "executable"
    ```

    Arguments: `"<type>"` (see below)

=== "dub.json"

    ```json
    ...
    "targetType": "executable"
    ```

    Type: `string` (see below)

Specifies a specific target type.

This setting does not support platform specifications.

The following values are recognized for the `targetType` setting:

| Value          | Description |
| -------------- | ----------- |
| `"autodetect"` | Automatically detects the target type. This is the default global value and causes dub to try and generate "application" and "library" [configurations](./configurations.md). Use of other values limits the auto-generated configurations to either of the two. This value is not allowed inside of a configuration block. |
| `"none"`       | Does not build anything and doesn't generate an output file. This is useful for packages that are supposed to drag in other packages or sub packages using "dependency" directives. |
| `"executable"` | Generates an executable binary. (e.g. `.exe` on Windows) |
| `"library"`    | Specifies that the package is to be used as a library, without limiting the actual type of library. This should be the default for most libraries. |
| `"sourceLibrary"` | This target type does not generate a binary, but rather forces dub to add all source files directly to the same compiler invocation as the dependent project. For details, see [Build Hooks](./hooks.md#targettype-sourcelibrary) |
| `"staticLibrary"` | Forces output as a static library container. (e.g. `.lib` / `.a` file) |
| `"dynamicLibrary"` | Forces output as a dynamic/shared library. (e.g. `.dll` / `.dylib` / `.so`) |

For more information about the target types, refer to the [specification](./target_types.md).

## `targetName`

=== "dub.sdl"

    ```sdl
    ...
    targetName "cloudapp"
    ```

    Arguments: `"<name>"`

=== "dub.json"

    ```json
    ...
    "targetName": "cloudapp"
    ```

    Type: `string`

Sets the base name of the output file; type and platform specific pre- and suffixes are added automatically.

Defaults to the [package `name`](./package_settings.md).

This setting does not support platform specifications.

Examples:

```
targetName "cloudapp"
targetType "library"
= cloudapp.lib on Windows
= libcloudapp.a on Linux
```

```
targetName "cloudapp"
targetType "executable"
= cloudapp.exe on Windows
= cloudapp on Linux
```

For more information how built executables and objects are named see the [target types specification](./target_types.md).

## `targetPath`

=== "dub.sdl"

    ```sdl
    ...
    targetPath "bin"
    ```

    Arguments: `"<path>"`

=== "dub.json"

    ```json
    ...
    "targetPath": "bin"
    ```

    Type: `string`

The destination path of the output binary.

This setting does not support platform specifications.

For more information how built executables and objects are named see the [target types specification](./target_types.md).

## `workingDirectory`

=== "dub.sdl"

    ```sdl
    ...
    workingDirectory "bin"
    ```

    Arguments: `"<path>"`

=== "dub.json"

    ```json
    ...
    "workingDirectory": "bin"
    ```

    Type: `string`


A fixed working directory from which the generated executable will be run.

This setting does not support platform specifications.

## `subConfigurations`

=== "dub.sdl"

    ```sdl
    ...
    subConfiguration "avrd" "atmega1284p"
    subConfiguration "vibe-d/tls" "botan"
    subConfiguration ":subpackage" "FromRoot"
    ```

    Arguments: `"<dependency>" "<configuration>"`

    Locks the dependency (first argument) to a specific configuration (second argument); see also the [configurations specification](./configurations.md).

=== "dub.json"

    ```json
    ...
    "subConfigurations": {
        "avrd": "atmega1284p",
        "vibe-d/tls": "botan",
        ":subpackage": "FromRoot"
    }
    ```

    Type: `string[string]`

    Locks the dependencies to specific configurations; a map from package name to configuration name, see also the [configurations specification](./configurations.md).

This setting does not support platform specifications.

## `buildRequirements`

=== "dub.sdl"

    ```sdl
    ...
    buildRequirements "allowWarnings" "requireContracts"
    ```

    Arguments: `"<requirement1>" ["requirement2" [...]]`

=== "dub.json"

    ```json
    ...
    "buildRequirements": ["allowWarnings", "requireContracts"]
    ```

    Type: `string[]`

List of required settings for the build process.

The following values are recognized for each value in the setting array:

| Value | Description |
| ----- | ----------- |
| `"allowWarnings"` | Warnings do not abort compilation |
| `"silenceWarnings"` | Don't show warnings |
| `"disallowDeprecations"` | Using deprecated features aborts compilation |
| `"silenceDeprecations"` | Don't show deprecation warnings |
| `"disallowInlining"` | Avoid function inlining, even in release builds |
| `"disallowOptimization"` | Avoid optimizations, even in release builds |
| `"requireBoundsCheck"` | Always perform bounds checks |
| `"requireContracts"` | Leave assertions and contracts enabled in release builds |
| `"noDefaultFlags"` | Does not emit build type specific flags (e.g. -debug, -cov or -unittest).<br/>**Note that this flag should never be used for released packages and is indended purely as a development/debugging tool.** Using "-build=plain" may also be a more appropriate alternative. |

## `buildOptions`

=== "dub.sdl"

    ```sdl
    ...
    buildOptions "allowWarnings" "requireContracts"
    ```

    Arguments: `"<requirement1>" ["requirement2" [...]]`

=== "dub.json"

    ```json
    ...
    "buildOptions": ["allowWarnings", "requireContracts"]
    ```

    Type: `string[]`

List of build option identifiers. (corresponding to compiler flags)

This setting provides a compiler agnostic way to specify common compiler options/flags.

!!! note
    many of these options are implicitly managed by the [`buildRequirements`](#buildrequirements) setting and most others usually only occur in [buildType](./buildtypes.md) blocks.

The following values are supported:

| Value | Description | Corresponding<br/>DMD flag | Corresponding<br/>LDC flag | Corresponding<br/>GDC flag |
| ----- | ----------- | -------------------------- | -------------------------- | -------------------------- |
| `"debugMode"` | Compile in debug mode (enables contracts) | `-debug` | `-d-debug` | `-fdebug` |
| `"releaseMode"` | Compile in release mode (disables assertions and bounds checks) | `-release` | `-release` | `-frelease` |
| `"coverage"` | Enable code coverage analysis to be written when the app has finished running | `-cov` | `-cov` | `-fprofile-arcs -ftest-coverage` |
| `"coverageCTFE"` | Enable code coverage analysis (including code executed at compile-time via CTFE) | `-cov=ctfe` | `-cov=ctfe` | n/a |
| `"debugInfo"` | Enable symbolic debug information (e.g. so that GDB can show function names, parameters and show linked source code) | `-g` | `-g` | `-g` |
| `"debugInfoC"` | Enable symbolic debug information in C compatible form | `-g` | `-gc` | `-g` |
| `"alwaysStackFrame"` | Always generate a stack frame | `-gs` | `-disable-fp-elim` | n/a |
| `"stackStomping"` | Perform stack stomping | `-gx` | n/a | n/a |
| `"inline"` | Perform function inlining | `-inline` | `-enable-inlining` `-Hkeep-all-bodies` | `-finline-functions` |
| `"noBoundsCheck"` | Disable all bounds checking | `-noboundscheck` | `-boundscheck=off` | `-fno-bounds-check` |
| `"optimize"` | Enable optimizations | `-O` | `-O3` | `-O2` |
| `"profile"` | Emit profiling code | `-profile` | `-fdmd-trace-functions` | `-pg` |
| `"profileGC"` | Emit GC profiling information | `-profile=gc` | n/a | /na |
| `"unittests"` | Compile unit tests | `-unittest` | `-unittest` | `-funittest` |
| `"verbose"` | Verbose compiler output | `-v` | `-v` | `-v` |
| `"ignoreUnknownPragmas"` | Ignores unknown pragmas during compilation | `-ignore` | `-ignore` | `-fignore-unknown-pragmas` |
| `"syntaxOnly"` | Don't generate object files | `-o-` | `-o-` | `-fsyntax-only` |
| `"warnings"` | Enable warnings, enabled by default (use "buildRequirements" to control this setting) | `-wi` | `-wi` | `-Wall` |
| `"warningsAsErrors"` | Treat warnings as errors (use "buildRequirements" to control this setting) | `-w` | `-w` | `-Werror -Wall` |
| `"ignoreDeprecations"` | Do not warn about using deprecated features (use "buildRequirements" to control this setting) | `-d` | `-d` | `-Wno-deprecated` |
| `"deprecationWarnings"` | Warn about using deprecated features, enabled by default (use "buildRequirements" to control this setting) | `-dw` | `-dw` | `-Wdeprecated` |
| `"deprecationErrors"` | Stop compilation upon usage of deprecated features (use "buildRequirements" to control this setting) | `-de` | `-de` | `-Werror -Wdeprecated` |
| `"betterC"` | Compile in betterC mode | `-betterC` | `-betterC` | `-fno-druntime` |
| `"lowmem"` | Enable the garbage collector for the compiler(dmd/ldc), reducing the compiler memory requirements but increasing compile times. | `-lowmem` | `-lowmem` | n/a |

## `libs`

=== "dub.sdl"

    ```sdl
    ...
    libs "mycommons"
    libs "advapi32" "wldap32" platform="windows"
    libs "ldap" "lber" platform="posix"
    ```

    Arguments: `"<lib1>" ["<lib2>" [...]]`

=== "dub.json"

    ```json
    ...
    "libs": ["mycommons"],
    "libs-windows": ["advapi32", "wldap32"],
    "libs-posix": ["ldap", "lber"]
    ```

    Type: `string[]`

A list of external library names - depending on the compiler, these will be converted to the proper linker flag (e.g. "ssl" might get translated to "-L-lssl").

On Posix platforms dub will try to find the correct linker flags by first checking if they exist using `pkg-config --exists <lib>` and then inject their corresponding linker flags reported by pkg-config instead of the guessed compiler specific library argument.

See also: [platform specifications](./platform_specifications.md)

## `sourceFiles`

=== "dub.sdl"

    ```sdl
    ...
    sourceFiles "doc2.d" "latex.d" "cgi.d" "comment.d" "css/*.d"
    ```

    Arguments: `"<glob1>" ["glob2" [...]]`

=== "dub.json"

    ```json
    ...
    "sourceFiles": ["doc2.d", "latex.d", "cgi.d", "comment.d", "css/*.d"]
    ```

    Type: `string[]`

Additional files passed to the compiler - can be useful to add certain configuration or platform dependent source files that are not contained in the general source folder.

Supports [glob matching](http://dlang.org/phobos/std_path.html#.globMatch) patterns to match multiple files at once.

## `sourcePaths`

=== "dub.sdl"

    ```sdl
    ...
    sourcePaths "source"
    ```

    Arguments: `"<path1>" ["path2" [...]]`

=== "dub.json"

    ```json
    ...
    "sourcePaths": ["source"]
    ```

    Type: `string[]`

Allows to customize the path where to look for source files (any folder "source" or "src" is automatically used as a source path if no sourcePaths setting is specified)

!!! hint "Relationship with import paths"
    Note that you usually also need to define "importPaths" as "sourcePaths" don't influence those and are required to make source files able to import each other.

A source file as found through `sourceFiles` and `sourcePaths` is what is being passed to the compiler to compile into object code and eventually also link into an executable or library. Without being added to import files it may not be possible to import these source files from each other.

## `excludedSourceFiles`

=== "dub.sdl"

    ```sdl
    ...
    excludedSourceFiles "source/server/*.d" "source/main.d"
    ```

    Arguments: `"<glob1>" ["glob2" [...]]`

=== "dub.json"

    ```json
    ...
    "excludedSourceFiles": ["source/server/*.d", "source/main.d"]
    ```

    Type: `string[]`

Files that should be removed for the set of already added source files (takes precedence over "sourceFiles" and "sourcePaths")

Supports [glob matching](http://dlang.org/phobos/std_path.html#.globMatch) patterns to match multiple files at once.

## `mainSourceFile`

=== "dub.sdl"

    ```sdl
    ...
    mainSourceFile "source/vibe/appmain.d"
    ```

    Arguments: `"<path>"`

=== "dub.json"

    ```json
    ...
    "mainSourceFile": "source/vibe/appmain.d"
    ```

    Type: `string`

Determines the file that contains the main() function. This setting can be used by dub to exclude this file in situations where a different main function is defined (e.g. for "dub test").

This setting does not support platform specifications.

## `copyFiles`

=== "dub.sdl"

    ```sdl
    ...
    copyFiles "LICENSE_MYDEP.txt"
    copyFiles "libs/win64/*.dll" platform="windows-x86_64"
    copyFiles "libs/win32/*.dll" platform="windows-x86"
    ```

    Arguments: `"<glob1>" ["<glob2>" [...]]`

=== "dub.json"

    ```json
    ...
    "copyFiles": "LICENSE_MYDEP.txt",
    "copyFiles-windows-x86_64": [ "libs/win64/*.dll"],
    "copyFiles-windows-x86": [ "libs/win32/*.dll"],
    ```

    Type: `string[]`

A list of globs matching files or directories to be copied to targetPath.

Matching directories are copied recursively, i.e. `"copyFiles": ["path/to/dir"]"` recursively copies dir, while `"copyFiles": ["path/to/dir/*"]"` only copies files within dir.

Supports [glob matching](http://dlang.org/phobos/std_path.html#.globMatch) patterns to match multiple files at once.

## `extraDependencyFiles`

=== "dub.sdl"

    ```sdl
    ...
    extraDependencyFiles "libs/*"
    ```

    Arguments: `"<glob1>" ["<glob2>" [...]]`

=== "dub.json"

    ```json
    ...
    "extraDependencyFiles": ["libs/*"]
    ```

    Type: `string[]`

A list of globs matching files to be checked for rebuilding the dub project.

Usually this setting is not required as all source files, import files and string import files are already checked for updates. However this may be useful when working on repeatedly updating static libraries that are compiled into your project.

Supports [glob matching](http://dlang.org/phobos/std_path.html#.globMatch) patterns to match multiple files at once.

## `versions`

=== "dub.sdl"

    ```sdl
    ...
    versions "NoNetwork" "DemoMode"
    ```

    Arguments: `"<version1>" ["<version2>" [...]]`

=== "dub.json"

    ```json
    ...
    "versions": ["NoNetwork", "DemoMode"]
    ```

    Type: `string[]`

A list of D's custom [conditional compilation versions](https://dlang.org/spec/version.html#version) to be defined during compilation.

In the source code they can then be queried like this:

```d
void draw()
{
    version (DemoMode)
    {
        drawText("DEMO MODE");
    }
}
```

Note: (optional) dependencies being present already have the [`Have_*` version](./dependencies.md) defined.

## `debugVersions`

=== "dub.sdl"

    ```sdl
    ...
    debugVersions "SQLTests"
    ```

    Arguments: `"<version1>" ["<version2>" [...]]`

=== "dub.json"

    ```json
    ...
    "debugVersions": ["SQLTests"]
    ```

    Type: `string[]`

A list of D's custom [debug condition](https://dlang.org/spec/version.html#debug) identifiers to be defined during compilation

Similar to `versions` in the source code they can then be queried like this:

```d
// avoids tainting dependees' unittests with sourceLibrary dependencies
debug (SQLTests)
{
    unittest
    {
        assert(everythingWorks());
    }
}
```

## `importPaths`

=== "dub.sdl"

    ```sdl
    ...
    importPaths "source" "extern"
    ```

    Arguments: `"<path1>" ["path2" [...]]`

=== "dub.json"

    ```json
    ...
    "importPaths": ["source", "extern"]
    ```

    Type: `string[]`

Additional import paths to search for D modules (the source/ folder is used by default as a source folder, if it exists)

It's recommended to put all source paths into the import paths so that sources can import each other.

Additional import paths can be defined for example for used library code that is linked in externally. If using code from only imported paths, but not linking in the object files that contain the actual definitions, linker errors may occur.

This corresponds to adding `-I` flags in DMD.

## `stringImportPaths`

=== "dub.sdl"

    ```sdl
    ...
    importPaths "views"
    ```

    Arguments: `"<path1>" ["path2" [...]]`

=== "dub.json"

    ```json
    ...
    "importPaths": ["views"]
    ```

    Type: `string[]`

Additional import paths to search for string imports (the `views/` folder is used by default as a string import folder, if it exists)

These folders are where [`import("filename.ext")` statements](https://dlang.org/spec/expression.html#import_expressions) are going to look for their passed in files.

This corresponds to adding `-J` flags in DMD.

Example usage in D code:

=== "example.d"

    ```d
    // loading files to be embedded into the executable:
    static immutable string[] mirrors = import("mirrors.txt").split("\n");

    // embedded binary file into the executable: (e.g. load GTK resources, load embedded DLL, etc.)
    static immutable ubyte[] resources = cast(immutable(ubyte)[])import("resources.gresource");
    ```

=== "views/mirrors.txt"

    ```
    https://example.org
    https://example.com
    ```

=== "views/resources.gresource"

    `<binary content>`

## `preGenerateCommands`

=== "dub.sdl"

    ```sdl
    ...
    // rebuild on special condition
    preGenerateCommands `if [ -f some_condition ]; then touch source/app.d; fi`
    ```

    Arguments: `"<command1>" ["command2" [...]]`

=== "dub.json"

    ```json
    ...
    "preGenerateCommands": ["if [ -f some_condition ]; then touch source/app.d; fi"]
    ```

    Type: `string[]`

A list of shell commands that is always executed before project generation is started.

These commands are run on `dub build`, `dub run` and `dub generate`

!!! hint
    This command is also executed even if the package would not require recompilation or when generating e.g. makefiles.

    If you write to files that are observed by source files, import paths, string import paths or extraDependencyFiles, this package will rebuild.

    If you want to update source files on rebuild, you can use [`preBuildCommands`](#prebuildcommands).

For more information about the build cycle and injecting commands into the build process, see [hooks](./hooks.md).

## `postGenerateCommands`

=== "dub.sdl"

    ```sdl
    ...
    preGenerateCommands `echo "Thanks for using ACME Corps D extensions"`
    ```

    Arguments: `"<command1>" ["command2" [...]]`

=== "dub.json"

    ```json
    ...
    "preGenerateCommands": ["echo \"Thanks for using ACME Corps D extensions\""]
    ```

    Type: `string[]`

A list of shell commands that is always executed after project generation is finished

These commands are run on `dub build`, `dub run` and `dub generate`

For more information about the build cycle and injecting commands into the build process, see [hooks](./hooks.md).

## `preBuildCommands`

=== "dub.sdl"

    ```sdl
    ...
    preBuildCommands `$DUB --single update_git_version.d`
    ```

    Arguments: `"<command1>" ["command2" [...]]`

=== "dub.json"

    ```json
    ...
    "preBuildCommands": ["$DUB --single update_git_version.d"]
    ```

    Type: `string[]`


A list of shell commands that is executed before the package is built

These commands are run before the build process on `dub build` and `dub run` (if not already up-to-date)

For more information about the build cycle and injecting commands into the build process, see [hooks](./hooks.md).

## `postBuildCommands`

=== "dub.sdl"

    ```sdl
    ...
    postBuildCommands `gpg --sign my_executable`
    ```

    Arguments: `"<command1>" ["command2" [...]]`

=== "dub.json"

    ```json
    ...
    "postBuildCommands": ["gpg --sign my_executable"]
    ```

    Type: `string[]`

A list of shell commands that is executed after the package is built

These commands are run after the build process on `dub build` and `dub run` (if not already up-to-date)

For more information about the build cycle and injecting commands into the build process, see [hooks](./hooks.md).

## `preRunCommands`

=== "dub.sdl"

    ```sdl
    ...
    preRunCommands `echo "EXECUTABLE OUTPUT:"`
    ```

    Arguments: `"<command1>" ["command2" [...]]`

=== "dub.json"

    ```json
    ...
    "preRunCommands": ["echo \"EXECUTABLE OUTPUT:\""]
    ```

    Type: `string[]`

A list of shell commands that is executed always before the project is run

These commands are run on `dub run`

For more information about the build cycle and injecting commands into the build process, see [hooks](./hooks.md).

## `postRunCommands`

=== "dub.sdl"

    ```sdl
    ...
    preRunCommands `./cleanup.sh`
    ```

    Arguments: `"<command1>" ["command2" [...]]`

=== "dub.json"

    ```json
    ...
    "preRunCommands": ["./cleanup.sh"]
    ```

    Type: `string[]`

A list of shell commands that is executed always after the project is run

These commands are run on `dub run`

For more information about the build cycle and injecting commands into the build process, see [hooks](./hooks.md).

## `dflags`

=== "dub.sdl"

    ```sdl
    ...
    dflags `--relocation-model=rwpi` platform="ldc"
    ```

    Arguments: `"<flag1>" ["flag2" [...]]`

=== "dub.json"

    ```json
    ...
    "dflags-ldc": ["--relocation-model=rwpi"]
    ```

    Type: `string[]`

Additional flags passed to the D compiler

!!! note
    These flags are usually specific to the compiler in use, but a set of flags is automatically translated from DMD to the selected compiler

    Use [build options](#buildoptions) for a compiler-agnostic way of manipulating the build.

## `lflags`

=== "dub.sdl"

    ```sdl
    ...
    lflags `-L$PACKAGE_DIR/libs/`
    ```

    Arguments: `"<flag1>" ["flag2" [...]]`

=== "dub.json"

    ```json
    ...
    "lflags": ["-L$PACKAGE_DIR/libs/"]
    ```

    Type: `string[]`

Additional flags passed to the linker - note that these flags are usually specific to the linker in use

## `injectSourceFiles`

=== "dub.sdl"

    ```sdl
    ...
    injectSourceFiles `inject/*.d`
    ```

    Arguments: `"<glob1>" ["glob2" [...]]`

=== "dub.json"

    ```json
    ...
    "injectSourceFiles": ["inject/*.d"]
    ```

    Type: `string[]`

Source files that will be compiled into binaries that depend on this package, no matter what targetType the package has.

For details, see [Build Hooks](./hooks.md#injectsourcefiles)

!!! warning

    this should be under a permissive license (like Boost) or you risk infecting a users binary with an incompatible license.

Supports [glob matching](http://dlang.org/phobos/std_path.html#.globMatch) patterns to match multiple files at once.

Example:

=== "dep/dub.json"

    ```json
    {
        "name": "toload",
        "description": "Example to showcase injection of a source file from a dependency dependency.",
        "targetType": "library",
        "buildOptions": ["betterC"],
        "sourcePaths": ["source"],
        "importPaths": ["source"],
        "injectSourceFiles": ["ahook.d"]
    }
    ```

=== "dep/ahook.d"

    ```d
    module ahook;

    version(D_BetterC) {
        pragma(crt_constructor)
        extern(C) void someInitializer() {
            import core.stdc.stdio;
            printf("Hook ran!\n");
        }
    } else {
        shared static this() {
            import std.stdio;
            writeln("We have a runtime!!!!");
        }
    }
    ```

=== "dep/source/something.d"

    ```d
    module something;

    void doSomething() {
        import core.stdc.stdio;

        version(D_BetterC) {
            printf("druntime is not in the executable :(\n");
        } else {
            printf("druntime is in executable!\n");
        }
    }
    ```

=== "app/dub.json"

    ```json
    {
        "name": "runner",
        "description": "Example to showcase injection of a source file from a dependency runner.",
        "targetType": "executable",
        "dependencies": {
            "dep": "~>1.0.0"
        }
    }
    ```

=== "app/source/entry.d"

    ```d
    void main() {
        import something;
        doSomething();
    }
    ```

Injected source files will import files from the context of the project that depends on the dependency defining them.
