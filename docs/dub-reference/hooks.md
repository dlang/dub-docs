# Build Hooks & Build Lifecycle

!!! note "Work-in-Progress Documentation"

    The content on this page is not yet fully finished.

    Tracking issue: <https://github.com/WebFreak001/dub-docs-v2/issues/14>

## Recipe Build Commands

Order of build commands in the general case:

1. [`preGenerateCommands`](./build_settings.md#pregeneratecommands)
    * dub.json/dub.sdl _may_ be reevaluated - currently only folders are re-listed for settings such as sourceFiles, the recipe is not reparsed, so nothing else is updated yet (see [DUB#2666](https://github.com/dlang/dub/issues/2666))
    * reevaluation of the recipe will not happen if a dependency touches any other already-loaded recipe
2. if re-build is triggered:
    1. [`preBuildCommands`](./build_settings.md#prebuildcommands)
    2. _compiler running_
    3. [`postBuildCommands`](./build_settings.md#postbuildcommands)
3. [`postGenerateCommands`](./build_settings.md#postgeneratecommands)
4. if run or test is triggered:
    1. [`preRunCommands`](./build_settings.md#preruncommands)
    2. _app or test running_
    3. [`postRunCommands`](./build_settings.md#postruncommands)

## Injecting compilation files into dependent projects

### `targetType "sourceLibrary"`

!!! tip "Recipe details"

    This section details values for a DUB recipe setting.

    For syntax, see [build settings](./build_settings.md#targettype)

This target type does not generate a binary, but rather forces dub to add all source files directly to the same compiler invocation as the dependent project.

This means all the D files within this project act like they have been copy-pasted into the dependent project, with sourceFiles matching them.

!!! warning

    Project defined compiler flags and build settings may not apply to these files, caution is needed and application tests and unittests should be written to ensure correctness.

You may want to use this in a variety of cases:

* small libraries may work better this way, especially if they are entirely templates (generated object files will be empty in that case)
* you need access to the project that depends on this project
    * this may be used to implement patterns such as [Inversion of Control](https://en.wikipedia.org/wiki/Inversion_of_control) on a per-file basis
    * however this may also cause anti-patterns, making dependencies hard to understand and reason about

### `injectSourceFiles`

!!! tip "Recipe details"

    This section details values for a DUB recipe setting.

    For syntax, see [build settings](./build_settings.md#injectsourcefiles)

WIP synposis: check build settings for example - this works like `targetType "sourceLibrary"`, but only for specific files. The primary reason why this was added by the original PR author was for dynamic libraries to register themselves automatically in some loader in the host application. Use-cases extend beyond that however.

TODO: need to document how this works with dependencies of dependencies

TODO: need to document if there is any use-case paired with `targetType "sourceLibrary"`
