# Sub-Packages

!!! note "Work-in-Progress Documentation"

    The content on this page is not yet fully finished.

    Tracking issue: <https://github.com/dlang/dub-docs/issues/71>

## Introduction

DUB has support for sub-packages, a mechanic used to define additional optional
recipes within the main recipe file. They can be built and tested separately.

The main distinction to configurations is the intent of use. For example,
while configurations are typically used to separate server and client code,
sub-packages can be used to create and manage dependencies used by
these server and client example configurations.

Another distinction with configurations, if at least one configuration is defined,
the first configuration is taken as default. This does not happen with sub-packages.

Each sub-package can have its own set of configurations and build options.

## Usage

The syntax used to reference sub-packages in commands is often `<package>:<sub-package>` or just `:<sub-package>`:
- To only add this sub-package from a package as a dependency, execute `dub add <packagename>:<sub-package>`
- To build a sub-package, execute `dub build :<sub-package>`
- To build and run a sub-package, execute `dub run :<sub-package>`
- To test a sub-package, execute `dub test :<sub-package>`

When the package name is omitted, the current working package name is assumed.

The default `targetType` for sub-packages is `library`.

## Declaration

To be useful, a sub-package needs, at minimum, a name, import paths,
and source paths (or source files).

Sub-packages can be declared entirely within the main recipe, or by a
reference to a name of a folder containing the sub-package recipe file.

## Example

This minimal working example assumes this file structure:
- `dub.sdl` (or `dub.json`): Main recipe.
- `source/` folder with the following:
  - `app.d`: Main source. Needs to import our sub-package library as `import example.example;`.
- `example/` folder with the following:
  - `dub.sdl` (or `dub.json`): Library recipe.
  - `example.d`: Library source. Module needs to be declared as `module example.example;`.

The main recipe file can reference the sub-package.

=== "dub.sdl"

    ```sdl
    name "dubtest"
    dependency ":example" version="*"
    subPackage "example"
    ```

=== "dub.json"

    ```json
    {
        "name": "dubtest",
        "dependencies": { ":example": ">=0.0.0" },
        "subPackages": [ "example" ]
    }
    ```

The sub-package recipe file contains sources and additional configuration.

=== "example/dub.sdl"

    name "example"
    sourcePaths "."
    importPaths "."

=== "example/dub.json"

    {
        "name": "example",
        "importPaths": [ "." ],
        "sourcePaths": [ "." ]
    }

The `example` sub-package can now be tested with `dub test :example` from the
main folder directly.

!!! note

    This example makes DUB compile test binaries into the `example/` folder.
