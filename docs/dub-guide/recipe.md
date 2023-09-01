# dub.json / dub.sdl recipes

!!! note "Work-in-Progress Documentation"

    This page currently contains almost all metadata keys and could be interpreted as specification. This page is only intended to give a basic overview, so a lot of content here will be moved into the DUB Reference pages in the future.

    [Future home](../dub-reference/recipe.md)

For the detailed recipe specification, check out [Recipes](../dub-reference/recipe.md) in the DUB reference.

Every DUB package _should_ contain a recipe (`dub.sdl` or `dub.json`) file in its root folder. This file contains meta-information about the project and its dependencies. This information is used for building the project and for deploying it using the registry. The following sections give an overview of the recognized settings and their meaning. Unknown settings will emit a warning whenever building or otherwise using DUB.

DUB recipes come in two flavors: JSON and SDL.

[JSON](https://json.org) is a commonly-known, widely-used file format. A `dub.json` file is similar to the `package.json` file from NPM.

[SDL (SDLang)](https://sdlang.org) is a simple declarative language with lean syntax and an XML-like structure with tags, attributes and values. In contrast to the JSON based format, all the directives described in the following section can be used multiple times and will override or append values, depending on their meaning.

In all documents in the documentation you can switch between dub.json and dub.sdl by using the tabs like you can see in this typical example of a simple application that requires no platform specific setup:

=== "dub.sdl"

    ```sdl
    // dub.sdl can contain comments!
    name "myproject"
    description "A little web service of mine."
    authors "Peter Parker" "John Doe"
    homepage "http://myproject.example.com"
    license "GPL-2.0"
    dependency "vibe-d" version="~>0.9.5"
    ```

=== "dub.json"

    ```json
    {
        "name": "myproject",
        "description": "A little web service of mine.",
        "authors": ["Peter Parker", "John Doe"],
        "homepage": "http://myproject.example.com",
        "license": "GPL-2.0",
        "dependencies": {
            "vibe-d": "~>0.9.5"
        }
    }
    ```

Please keep the description concise (not more than 100 characters) and avoid including unspecific information such as the fact that the package is written in D. The same goes for the package name - since all DUB packages are written in D, it's usually better to avoid mentioning D explicitly, unless the package is for example a high-level wrapper around a C/C++ library.

!!! hint "Just an excerpt"
    These are just the boiled down documentation of the available fields, refer to the [recipe](../dub-reference/recipe.md) page in the DUB reference for details to any given field.

## Package settings

Package settings (top-level settings) such as name, description, homepage,
authors, copyright, etc. can be defined to configure e.g. default
[`targetName`](../dub-reference/build_settings.md#targetname).

See the [package settings reference](../dub-reference/package_settings.md) to
view all available top-level settings.

## Platform specific settings

Platform specific settings are supported through the use of field name suffixes. Suffixes are dash separated list of operating system/architecture/compiler identifiers, as defined in the [D language reference](http://dlang.org/version.html#PredefinedVersions), but converted to lower case. The order of these suffixes is `os-architecture-compiler`, where any of these parts can be left off. Additionally on Windows the architectures `x86_omf` and `x86_mscoff` can be used with dmd to differentiate between 32 bit object formats used with the `--arch` switch. Examples:

=== "dub.sdl"

    ```sdl
    // used on all platforms
    versions "PrintfDebugging"
    // only applies if compiled with DMD
    dflags "-vtls" platform="dmd"
    // only used when building for X86-64
    versions "UseAmd64Impl" platform="x86_64"
    // only used on Posix systems (Linux, OS X, FreeBSD etc.)
    libs "ssl" "crypto" platform="posix"
    // applies if compiled for Windows, X86-64 using DMD
    sourceFiles "lib/windows-x86_64/mylib.lib" platform="windows-x86_64-dmd"
    sourceFiles "lib/windows-x86_omf/mylib.lib" platform="windows-x86_omf-dmd"
    sourceFiles "lib/windows-x86_mscoff/mylib.lib" platform="windows-x86_mscoff-dmd"
    ```

=== "dub.json"

    ```json
    {
        "versions": ["PrintfDebugging"],
        "dflags-dmd": ["-vtls"],
        "versions-x86_64": ["UseAmd64Impl"],
        "libs-posix": ["ssl", "crypto"],
        "sourceFiles-windows-x86_64-dmd": ["libs/windows-x86_64/mylib.lib"],
        "sourceFiles-windows-x86_omf-dmd": ["libs/windows-x86_omf/mylib.lib"],
        "sourceFiles-windows-x86_mscoff-dmd": ["libs/windows-x86_mscoff/mylib.lib"],
    }
    ```

See also: [Platform specifications](../dub-reference/platform_specifications.md)

## Build settings

Build settings influence the command line options passed to the compiler and linker. All settings are optional.

=== "dub.sdl"

    | Name | Arguments | Description |
    |------|-----------|-------------|
    | dependency | `"<name>" ...` | Adds a single dependency of the given name, attributes are used to configure the version/path to use - see [dependencies](../dub-reference/dependencies.md) for more information - this setting does not support the platform attribute |
    | systemDependencies | `"<text>"` | A textual description of the required system dependencies (external C libraries) required by the package. This will be visible on the registry and will be displayed in case of linker errors - this setting does not support the platform attribute |
    | targetType | `"<type>"` | Specifies a specific [target type](../dub-reference/target_types.md) - this setting does not support the platform attribute |
    | targetName | `"<name>"` | Sets the base name of the output file; type and platform specific pre- and suffixes are added automatically - this setting does not support the platform attribute |
    | targetPath | `"<path>"` | The destination path of the output binary - this setting does not support the platform attribute |
    | workingDirectory | `"<path>"` | A fixed working directory from which the generated executable will be run - this setting does not support the platform attribute |
    | subConfigurations | `"<dependency>" "<configuration>"` | Locks a dependency (first argument) to a specific configuration (second argument); see also the [configurations section](#configurations) - this setting does not support the platform attribute |
    | buildRequirements | `"<requirement1>" ["<requirement2>" [...]]` | List of required settings for the build process. See the [build settings page](../dub-reference/build_settings.md#buildrequirements) for details. |
    | buildOptions | `"<option1>" ["<option2>" [...]]` | List of build option identifiers (corresponding to compiler flags) - see the [build settings page](../dub-reference/build_settings.md) for details. |
    | libs | `"<lib1>" ["<lib2>" [...]]` | A list of external library names - depending on the compiler, these will be converted to the proper linker flag (e.g. "ssl" might get translated to "-L-lssl"). On Posix platforms dub will try to find the correct linker flags by using [pkg-config](https://www.freedesktop.org/wiki/Software/pkg-config/) |
    | sourceFiles | `"<pattern1>" ["<pattern2>" [...]]` | Additional files passed to the compiler - can be useful to add certain configuration dependent source files that are not contained in the general source folder |
    | sourcePaths | `"<path1>" ["<path2>" [...]]` | Allows to customize the path where to look for source files (any folder "source" or "src" is automatically used as a source path if no sourcePaths setting is specified) - note that you usually also need to define "importPaths" as "sourcePaths" don't influence those |
    | excludedSourceFiles | `"<pattern1>" ["<pattern2>" [...]]` | Files that should be removed for the set of already added source files (takes precedence over "sourceFiles" and "sourcePaths") - [Glob matching](http://dlang.org/phobos/std_path.html#.globMatch) can be used to pattern match multiple files at once |
    | mainSourceFile | `"<path>"` | Determines the file that contains the main() function. This setting can be used by dub to exclude this file in situations where a different main function is defined (e.g. for "dub test") - this setting does not support the platform attribute |
    | copyFiles | `"<pattern1>" ["<pattern2>" [...]]` | A list of [globs](http://dlang.org/phobos/std_path.html#.globMatch) matching files or directories to be copied to targetPath. Matching directories are copied recursively, i.e. "copyFiles": ["path/to/dir"]" recursively copies dir, while "copyFiles": ["path/to/dir/*"]" only copies files within dir. |
    | extraDependencyFiles | `"<pattern1>" ["<pattern2>" [...]]` | A list of [globs](http://dlang.org/phobos/std_path.html#.globMatch) matching files to be checked for rebuilding the dub project. |
    | versions | `"<version1>" ["<version2>" [...]]` | A list of D versions to be defined during compilation |
    | debugVersions | `"<version1>" ["<version2>" [...]]` | A list of D debug identifiers to be defined during compilation |
    | importPaths | `"<path1>" ["<path2>" [...]]` | Additional import paths to search for D modules (the source/ folder is used by default as a source folder, if it exists) |
    | stringImportPaths | `"<path1>" ["<path2>" [...]]` | Additional import paths to search for string imports/views (the views/ folder is used by default as a string import folder, if it exists) |
    | preGenerateCommands | `"<cmd1>" ["<cmd2>" [...]]` | A list of shell commands that is always executed before project generation is started |
    | postGenerateCommands | `"<cmd1>" ["<cmd2>" [...]]` | A list of shell commands that is always executed after project generation is finished |
    | preBuildCommands | `"<cmd1>" ["<cmd2>" [...]]` | A list of shell commands that is executed before the package is built |
    | postBuildCommands | `"<cmd1>" ["<cmd2>" [...]]` | A list of shell commands that is executed after the package is built |
    | preRunCommands | `"<cmd1>" ["<cmd2>" [...]]` | A list of shell commands that is executed always before the project is run |
    | postRunCommands | `"<cmd1>" ["<cmd2>" [...]]` | A list of shell commands that is executed always after the project is run |
    | dflags | `"<flag1>" ["<flag2>" [...]]` | Additional flags passed to the D compiler - note that these flags are usually specific to the compiler in use, but a set of flags is automatically translated from DMD to the selected compiler |
    | lflags | `"<flag1>" ["<flag2>" [...]]` | Additional flags passed to the linker - note that these flags are usually specific to the linker in use |
    | injectSourceFiles | `"<pattern1>" ["<pattern2>" [...]]` | Source files that will be compiled into binaries that depend on this package. Warning: this should be under a permissive license (like Boost) or you risk infecting a users binary with an incompatible license. |


=== "dub.json"

    | Name | Type | Description |
    |------|------|-------------|
    | dependencies | `T[string]` | List of project dependencies given as pairs of `"<name>" : <version-spec>` - see [dependencies](../dub-reference/dependencies.md) for more information - this setting does not support platform suffixes |
    | systemDependencies | `string` | A textual description of the required system dependencies (external C libraries) required by the package. This will be visible on the registry and will be displayed in case of linker errors - this setting does not support platform suffixes |
    | targetType | `string` | Specifies a specific [target type](../dub-reference/target_types.md) - this setting does not support platform suffixes |
    | targetName | `string` | Sets the base name of the output file; type and platform specific pre- and suffixes are added automatically - this setting does not support platform suffixes |
    | targetPath | `string` | The destination path of the output binary - this setting does not support platform suffixes |
    | workingDirectory | `string` | A fixed working directory from which the generated executable will be run - this setting does not support platform suffixes |
    | subConfigurations | `string[string]` | Locks the dependencies to specific configurations; a map from package name to configuration name, see also the [configurations section](#configurations) - this setting does not support platform suffixes |
    | buildRequirements | `string[]` | List of required settings for the build process. See the [build settings page](../dub-reference/build_settings.md) for details. |
    | buildOptions | `string[]` | List of build option identifiers (corresponding to compiler flags) - see the [build settings page](../dub-reference/build_settings.md) for details. |
    | libs | `string[]` | A list of external library names - depending on the compiler, these will be converted to the proper linker flag (e.g. "ssl" might get translated to "-L-lssl"). On Posix platforms dub will try to find the correct linker flags by using [pkg-config](https://www.freedesktop.org/wiki/Software/pkg-config/) |
    | sourceFiles | `string[]` | Additional files passed to the compiler - can be useful to add certain configuration dependent source files that are not contained in the general source folder |
    | sourcePaths | `string[]` | Allows to customize the path where to look for source files (any folder "source" or "src" is automatically used as a source path if no sourcePaths setting is specified) - note that you usually also need to define "importPaths" as "sourcePaths" don't influence those |
    | excludedSourceFiles | `string[]` | Files that should be removed for the set of already added source files (takes precedence over "sourceFiles" and "sourcePaths") - [Glob matching](http://dlang.org/phobos/std_path.html#.globMatch) can be used to pattern match multiple files at once |
    | mainSourceFile | `string` | Determines the file that contains the main() function. This setting can be used by dub to exclude this file in situations where a different main function is defined (e.g. for "dub test") - this setting does not support platform suffixes |
    | copyFiles | `string[]` | A list of [globs](http://dlang.org/phobos/std_path.html#.globMatch) matching files or directories to be copied to targetPath. Matching directories are copied recursively, i.e. "copyFiles": ["path/to/dir"]" recursively copies dir, while "copyFiles": ["path/to/dir/*"]" only copies files within dir. |
    | extraDependencyFiles | `string[]` | A list of [globs](http://dlang.org/phobos/std_path.html#.globMatch) matching files to be checked for rebuilding the dub project. |
    | versions | `string[]` | A list of D versions to be defined during compilation |
    | debugVersions | `string[]` | A list of D debug identifiers to be defined during compilation |
    | importPaths | `string[]` | Additional import paths to search for D modules (the source/ folder is used by default as a source folder, if it exists) |
    | stringImportPaths | `string[]` | Additional import paths to search for string imports/views (the views/ folder is used by default as a string import folder, if it exists) |
    | preGenerateCommands | `string[]` | A list of shell commands that is always executed before project generation is started |
    | postGenerateCommands | `string[]` | A list of shell commands that is always executed after project generation is finished |
    | preBuildCommands | `string[]` | A list of shell commands that is executed before the package is built |
    | postBuildCommands | `string[]` | A list of shell commands that is executed after the package is built |
    | preRunCommands | `string[]` | A list of shell commands that is executed always before the project is run |
    | postRunCommands | `string[]` | A list of shell commands that is executed always after the project is run |
    | dflags | `string[]` | Additional flags passed to the D compiler - note that these flags are usually specific to the compiler in use, but a set of flags is automatically translated from DMD to the selected compiler |
    | lflags | `string[]` | Additional flags passed to the linker - note that these flags are usually specific to the linker in use |
    | injectSourceFiles | `string[]` | Source files that will be compiled into binaries that depend on this package. Warning: this should be under a permissive license (like Boost) or you risk infecting a users binary with an incompatible license. |

Additionally it is possible to use environment variables inside of build setting values using dollar notation. Any variable not matching a predefined name will be taken from the program environment. To denote a literal dollar sign, use `$$`. Refer to [the specification](../dub-reference/environment_variables.md) for more details.

## Sub packages

=== "dub.sdl"

    A package may contain an arbitrary number of additional publicly visible packages. These packages can be defined using `subPackage` directives in the main dub.sdl file.

    ```sdl title="/dub.sdl"
    name "mylib"
    targetType "none"
    dependency ":component1" version="*"
    dependency ":component2" version="*"
    subPackage "./component1/"
    subPackage "./component2/"
    ```

    ```sdl title="/component1/dub.sdl"
    name "component1"
    targetType "library"
    ```

=== "dub.json"

    A package may contain an arbitrary number of additional publicly visible packages. These packages can be defined in the `"subPackages"` section of the main dub.json file.

    ```json title="/dub.json"
    {
        "name": "mylib",
        "targetType": "none",
        "dependencies": {
            ":component1": "*",
            ":component2": "*"
        },
        "subPackages": [
            "./component1/",
            "./component2/"
        ]
    }
    ```

    ```json title="/component1/dub.json"
    {
        "name": "component1",
        "targetType": "library"
    }
    ```

The sub directories /component1 and /component2 then contain normal packages and can be referred to as "mylib:component1" and "mylib:component2" from outside projects. To refer to sub packages within the same repository use the `"*"` version specifier.

It is also possible to define the sub packages within the root package file, but note that it is generally discouraged to put the source code of multiple sub packages into the same source folder. Doing so can lead to hidden dependencies to sub packages that haven't been explicitly stated in the "dependencies" section. These hidden dependencies can then result in build errors in conjunction with certain build modes or dependency trees that may be hard to understand.

=== "dub.sdl"

    ```sdl
    name "mylib"
    targetType "none"
    dependency ":component1" version="*"
    subPackage {
        name "component1"
        targetType "library"
        sourcePaths "component1/source"
        importPaths "component1/source"
    }
    ```

=== "dub.json"

    ```json
    {
        "name": "mylib",
        "targetType": "none",
        "dependencies": {
            ":component1": "*",
            ":component2": "*"
        },
        "subPackages": [
            {
                "name": "component1",
                "targetType": "library",
                "sourcePaths": ["component1/source"],
                "importPaths": ["component1/source"]
            }
        ]
    }
    ```

To refer to sub packages, take the root package name (in this case `myapp`), a colon (`:`) and the sub package name. The resulting package name is in format

```
<mainpkg>:<subpkg>
```

thus being

```
mylib:component1
```

in this example. When referring to sub packages of the same main package, you can refer to them simply through `:<subpkg>`, so `:component1` in this example.

See also: [Sub packages](../dub-reference/subpackages.md) in the DUB reference.

## Configurations

Build configurations add or override build settings to the global ones. A build configuration can be selected through the `dub --config=<name>` command line switch for the package that is being built or through the `subConfigurations` property to choose a configuration for a dependency.

For more information about which configuration is picked and what defaults are used, refer to [the specification](../dub-reference/configurations.md) linked below.

The following example defines "metro-app" and "desktop-app" configurations that are only available on Windows and a "glut-app" configuration that is available on all platforms.

=== "dub.sdl"

    ```sdl
    ...
    name "somepackage"
    configuration "metro-app" {
        platforms "windows"
        targetType "executable"
        versions "MetroApp"
        libs "d3d11"
    }
    configuration "desktop-app" {
        platforms "windows"
        targetType "executable"
        versions "DesktopApp"
        libs "d3d9"
    }
    configuration "glut-app" {
        // works on any platform
        targetType "executable"
        versions "GlutApp"
    }
    ```

    In addition to the usual [build settings](#build-settings), the following settings are recognized inside of a configuration block:

    | Name | Arguments | Description |
    |------|-----------|-------------|
    | platforms | `"<spec1>" ["<spec2" [...]]` | A list of [platform specifiers](#platform-specific-settings) to limit on which platforms the configuration applies |

=== "dub.json"

    ```json
    {
        ...
        "name": "somepackage",
        "configurations": [
            {
                "name": "metro-app",
                "targetType": "executable",
                "platforms": ["windows"],
                "versions": ["MetroApp"],
                "libs": ["d3d11"]
            },
            {
                "name": "desktop-app",
                "targetType": "executable",
                "platforms": ["windows"],
                "versions": ["DesktopApp"],
                "libs": ["d3d9"]
            },
            {
                "name": "glut-app",
                "targetType": "executable",
                "versions": ["GlutApp"]
            }
        ]
    }
    ```

    In addition to the usual [build settings](#build-settings), the following settings are recognized inside of a configuration block:

    | Name | Type | Description |
    |------|------|-------------|
    | name [required] | `string` | Name of the configuration |
    | platforms | `string[]` | A list of [platform suffixes](#platform-specific-settings) (as used for the build settings) to limit on which platforms the configuration applies |

See also: [Configurations](../dub-reference/configurations.md)

## Build types

By default, a set of predefined build types is already provided by DUB and can be specified using `dub --build=<name>`:

=== "dub.sdl"

    | Name | Build options |
    | ---- | ------------- |
    | plain | (none) |
    | debug | `"debugMode" "debugInfo"` |
    | release | `"releaseMode" "optimize" "inline"` |
    | release-debug | `"releaseMode" "optimize" "inline" "debugInfo"` |
    | release-nobounds | `"releaseMode" "optimize" "inline" "noBoundsCheck"` |
    | unittest | `"unittests" "debugMode" "debugInfo"` |
    | docs | `"syntaxOnly"` plus `dflags "-Dddocs"` |
    | ddox | `"syntaxOnly"` plus `dflags "-Xfdocs.json" "-Df__dummy.html"` |
    | profile | `"profile" "optimize" "inline" "debugInfo"` |
    | profile-gc | `"profileGC" "debugInfo"` |
    | cov | `"coverage" "debugInfo"` |
    | cov-ctfe | `"coverageCTFE" "debugInfo"` |
    | unittest-cov | `"unittests" "coverage" "debugMode" "debugInfo"` |
    | unittest-cov-ctfe | `"unittests" "coverageCTFE" "debugMode" "debugInfo"` |
    | syntax | `"syntaxOnly"` |

    <!--
    NOTE when adding new default build types to the docs:
    the syntax in the SDL file has no commas and no brackets.
    -->

=== "dub.json"

    | Name | Build options |
    | ---- | ------------- |
    | plain | `[]` |
    | debug | `["debugMode", "debugInfo"]` |
    | release | `["releaseMode", "optimize", "inline"]` |
    | release-debug | `["releaseMode", "optimize", "inline", "debugInfo"]` |
    | release-nobounds | `["releaseMode", "optimize", "inline", "noBoundsCheck"]` |
    | unittest | `["unittests", "debugMode", "debugInfo"]` |
    | docs | `["syntaxOnly"]` plus `"dflags": ["-Dddocs"]` |
    | ddox | `["syntaxOnly"]` plus `"dflags": ["-Xfdocs.json", "-Df__dummy.html"]` |
    | profile | `["profile", "optimize", "inline", "debugInfo"]` |
    | profile-gc | `["profileGC", "debugInfo"]` |
    | cov | `["coverage", "debugInfo"]` |
    | cov-ctfe | `["coverageCTFE", "debugInfo"]` |
    | unittest-cov | `["unittests", "coverage", "debugMode", "debugInfo"]` |
    | unittest-cov-ctfe | `["unittests", "coverageCTFE", "debugMode", "debugInfo"]` |
    | syntax | `["syntaxOnly"]` |

For more information about the build settings refer to the [build settings specification](../dub-reference/build_settings.md).

The existing build types can be customized and new build types can be added using the global `buildType` directive (SDL) or adding an entry in `"buildTypes"` (JSON). Any of the low level build settings (excluding dependencies, targetType, targetName, targetPath, workingDirectory, subConfigurations) can be used inside those. The build settings specified here will later be modified/augmented by the package/configuration specific settings.

An example that overrides the "debug" build type and defines a new "debug-profile" type:

=== "dub.sdl"

    ```sdl
    name "my-package"
    buildType "debug" {
        buildOptions "debugMode" "debugInfo" "optimize"
    }
    buildType "debug-profile" {
        buildOptions "debugMode" "debugInfo" "profile"
    }
    ```

=== "dub.json"

    ```json
    {
        "name": "my-package",
        "buildTypes": {
            "debug": {
                "buildOptions": ["debugMode", "debugInfo", "optimize"]
            },
            "debug-profile": {
                "buildOptions": ["debugMode", "debugInfo", "profile"]
            }
        }
    }
    ```

See also: [Build types](../dub-reference/buildtypes.md) in the reference
