# Platform Specifications

!!! note "Work-in-Progress Documentation"

    The content on this page is not yet fully finished.

    Tracking issue: <https://github.com/dlang/dub-docs/issues/68>

Platform specifications are triplets of the form `<system>-<architecture>-<compiler>`, where each part is optional (as long as at least one is provided)
and can be described as follows:

* `<system>` - the Operating System (e.g. `osx`, `windows`, `linux`).
* `<architecture>` - the hardware architecture (e.g. `x86_64`, `aarch64`, `arm64` - see below).
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

For the full set of platform systems, see the [D language reference](http://dlang.org/version.html#PredefinedVersions).
Notice that the version names should be converted to lower case. Hence, instead of `iOS`, use `ios`, for example.

## CPU / Target Architectures

The following architectures are supported by DUB, e.g. for the `--arch` flag and are translated to the following underlying command line arguments:

|  Architecture  |     [DMD]     |        [LDC]       |    [GDC]    |
| -------------- | ------------- | ------------------ | ----------- |
| `x86_64`       | `-m64`        | `-march=x86-64`    | `-m64`      |
| `x86`          | `-m32`        | `-march=x86`       | `-m32`      |
| `x86_omf` (deprecated) | `-m32` | *unsupported*     |*unsupported*|
| `x86_mscoff` (deprecated) | `-m32` | `-march=x86`   |*unsupported*|
| `aarch64`      | *unsupported* | `-march=aarch64`   |*unsupported*|
| `powerpc64`    | *unsupported* | `-march=powerpc64` |*unsupported*|
| `arm`          | *unsupported* | *unsupported*      | `-marm`     |
| `arm_thumb`    | *unsupported* | *unsupported*      | `-mthumb`   |
| Others         | *unsupported* | `-march=TRIPLE`    |*unsupported*|

[DMD]: https://github.com/dlang/dub/blob/0030b9af02481fb518419bb4e13dd18731a9fd4f/source/dub/compilers/dmd.d#L131-L146
[LDC]: https://github.com/dlang/dub/blob/0030b9af02481fb518419bb4e13dd18731a9fd4f/source/dub/compilers/ldc.d#L83-L97
[GDC]: https://github.com/dlang/dub/blob/0030b9af02481fb518419bb4e13dd18731a9fd4f/source/dub/compilers/gdc.d#L71-L78

An *unsupported* platform will be rejected by DUB for the given compiler. Platform specifications may further be denied by the compiler depending on the host system and available configuration. (e.g. attempting to compile to aarch64 from a x86 host without having that module enabled or configured in the compiler)

Leaving out the architecture argument is special in DUB. It will first try and check the configuration to see if there is a default architecture that should be picked. If none is set, it will not pass any flag to the compiler and cause the compiler to determine what flags to use. This special state overriding the architecture to compiler-defined architecture can be forced using `--arch=` if there is default configuration changing the behavior.

Other architectures only work in LDC using [triples](https://wiki.dlang.org/Cross-compiling_with_LDC) and can be used e.g. for cross-compiling to other platforms. DUB recognizes the triples whenever a hyphen (`-`) is included in the architecture as one.
