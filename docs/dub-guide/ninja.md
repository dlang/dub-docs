# Ninja generator

DUB can generate a `build.ninja` file instead of building a project directly. This allows [Ninja](https://ninja-build.org/) to drive compilation, giving incremental rebuilds, dependency tracking at the import level, and parallel compilation across independent modules.

```sh
dub generate ninja
ninja
```

The generated `build.ninja` regenerates itself automatically whenever `dub.json`, `dub.selections.json`, or the project's source file list changes, so `dub generate ninja` normally only needs to be run once.

Sub-packages and static libraries are supported: each package compiles as its own set of Ninja targets, so a change to one package only triggers a rebuild of that package and whatever depends on it.

DMD, LDC, and GDC are all supported, using the same compiler flag translation DUB already applies for direct builds.

For the full set of options and generated output details, see the [DUB Reference](../dub-reference/ninja.md).
