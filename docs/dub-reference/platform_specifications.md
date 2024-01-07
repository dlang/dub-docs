# Platform Specifications

!!! note "Work-in-Progress Documentation"

    The content on this page is not yet fully finished.

    Tracking issue: <https://github.com/dlang/dub-docs/issues/68>

Platform specifications are triplets of the form `<system>-<architecture>-<compiler>`, where each part is optional (as long as at least one is provided)
and can be described as follows:

* `<system>` - the Operating System (e.g. `osx`, `windows`, `linux`).
* `<architecture>` - the hardware architecture (e.g. `x86_64`, `aarch64`, `arm64`).
* `<compiler>` - the compiler (e.g. `dmd`, `ldc`, `gdc`).

Platform specifications can be provided for many [build settings](build_settings.md) in order to indicate in which platforms their values should apply.

For example, to only enable a linker flag `-ld_classic` when on Mac OSX and architecture `x86_64`:

=== "dub.sdl"

    ```sdl
    lflags "-ld_classic" platform="osx-x86_64"
    ```

=== "dub.json"

    ```json
    {
        "lflags-osx-x86_64": ["-ld_classic"],
    }
    ```

> Notice that in the JSON format, the platform specification follows a single dash (`-`) after the setting name.

For the full set of platform systems and architectures, see the [D language reference](http://dlang.org/version.html#PredefinedVersions).
Notice that the version names should be converted to lower case. Hence, instead of `iOS`, use `ios`, for example.
