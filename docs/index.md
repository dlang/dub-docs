DUB is the official package manager for [the D programming language](https://dlang.org), providing simple and configurable cross-platform builds. DUB is well integrated in various IDEs and can also generate configuration for third party build systems and IDEs.

Use the [DUB registry website](https://code.dlang.org) to discover packages and publish your own.

The [CLI](cli-reference/dub.md) can be used to

- download programs and dependencies ([dub fetch](cli-reference/dub-fetch.md), [dub upgrade](cli-reference/dub-upgrade.md))
- create projects ([dub init](cli-reference/dub-init.md), [dub add](cli-reference/dub-add.md))
- compile projects and external programs ([dub build](cli-reference/dub-build.md), [dub run](cli-reference/dub-run.md))
- test projects ([dub test](cli-reference/dub-test.md))

DUB is bundled with most D compilers' distributions. However, it's also possible to install it separately.
See [Installing DUB](getting-started/install.md) for details.

<!-- old docs anchors for index page, all link to first steps -->
<a id="own-projects"></a>
<a id="adding-deps"></a>
<a id="foreign-projects"></a>
<a id="advanced-usage"></a>

## DUB Basics

DUB is a build tool similar to other modern languages build tools like Javascript's [npm](https://www.npmjs.com/)
and Rust's [cargo](https://crates.io/).

A [recipe file](dub-guide/recipe.md) called `dub.sdl` (or `dub.json`) is used to configure a DUB project.

> [SDL](https://sdlang.org/) is a "Simple Declarative Language" that uses a familiar C syntax.
> Whether to use SDL or JSON for the DUB file is a [matter of taste](https://forum.dlang.org/thread/fehzcwpabruiyhpwiywj@forum.dlang.org).

User/System-wide default settings can be specified in a [settings file](dub-reference/settings.md).

A recipe file may look like this:

```sdl
name "myproject"
description "A minimal D application."
authors "My Name"
copyright "Copyright © 2024, My Name"
license "Boost"

dependency "libasync" version="~>0.9.5"

configuration "library" {
    targetPath "target/lib"
}

configuration "unittest" {
    dependency "tested" version="~>0.9.5"
    dependency "dshould" version="~>1.7.1"
    targetPath "target/test"
}
```

[DUB Configurations](dub-reference/configurations.md) are used to create different variations of a project.

In the above example, all configurations include a dependency on `libasync` because that's declared at the top-level,
but only the `unittest` configuration includes the dependencies `tested` and `dshould`.

To build a project, run [`dub build`](cli-reference/dub-build/) (or just `dub`).

As a project is built, DUB automatically resolves, downloads and builds its dependencies as needed.

The resolved dependency versions are stored in a file next to the recipe file, called [dub.selections.json](dub-guide/selections.md),
which is similar to a lock file.

When running `dub test`, all [Unit Tests](https://tour.dlang.org/tour/en/gems/unittesting) found in
[sourcePaths](dub-reference/build_settings.md#sourcepaths) are executed using the `unittest` configuration by default.

To specify a configuration explicitly when building, use the `--config` option:

```
dub build --config=library
```

DUB also uses the concept of [build types](dub-reference/buildtypes.md) to define what to build. Many build types are
pre-defined, but the most common ones are `debug` and `release`.

Hence, to build the release version of a library, the following command could be used:

```
dub build --config=library --build=release
```

Finally, to run the application, use `dub run`.

Check [Building](dub-guide/building.md) for more details.

## Next Steps

[First Steps](getting-started/first-steps.md) completes this overview of the basic DUB workflow.

The [DUB Guide](dub-guide/recipe.md) goes into more details about building, testing, configuring dependencies and registries,
shared libraries, publishing packages and more.

More experienced users can use the [DUB Reference](dub-reference/recipe.md) and [CLI Reference](cli-reference/dub/)
for a comprehensive list of the available options.
