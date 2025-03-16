# Sub-Packages

!!! note "Work-in-Progress Documentation"

    The content on this page is not yet fully finished.

    Tracking issue: <https://github.com/dlang/dub-docs/issues/71>

## Introduction

DUB has support for sub-packages. They can be used to separate code from
your root package into reusable, smaller components as dedicated packages.

Sub-packages can be declared individually within the same project,
rather than needing to maintain and publish multiple packages on a registry.
All sub-packages share the same versioning as the root package, acting
like regular individual packages on their own.

For example, it is generally a good idea to use sub-packages to separate
client and server code, or into different components
(e.g., a specific protocol like `vibe-d:http`, etc.).

Since sub-packages act just like a regular package, they can have separate
package settings, like dedicated compiler setting, build types, and configurations.

!!! note

    Currently, sub-packages are not expected to be discovered by searches
    made in the main DUB registry.

## Usage

The syntax used to reference sub-packages in commands is often `<package>:<sub-package>` or just `:<sub-package>`.

- To only add a specific sub-package from a package as a dependency, execute `dub add <packagename>:<sub-package>`
- To build a sub-package, execute `dub build :<sub-package>`
- To build and run a sub-package, execute `dub run :<sub-package>`
- To test a sub-package, execute `dub test :<sub-package>`

When the package name is omitted, the current working package name is assumed (e.g., `<package>`).

Because sub-packages act as any other package, the default `targetType` is `autodetect`.

When a sub-package is built, additional "Have" versions are defined.
For example, with a root package named `package` with a `mylibrary` sub-package,
a `Have_package_mylibrary` version will be automatically defined by DUB,
and will be visible for when the sub-package is used as dependency.

Specified build types and configurations (e.g., via the command-line
interface) are applied to the sub-package, and are taken from the sub-package recipe.
If a build type exists in both packages, both will be applied.

For example, executing `dub build :mylibrary -c experimental`,
the `experimental` configuration must exist in the sub-package recipe.

Following the same example, configurations can also be referenced via recipes:

=== "dub.sdl"

    ```sdl
    subConfiguration ":mylibrary" "experimental"
    ```

=== "dub.json"

    ```json
    {
        "subConfigurations": {
            ":mylibrary": "experimental"
        }
    }
    ```

## Declaration

Sub-packages can be declared entirely within the main recipe, or by a
reference to a name of a folder containing the sub-package recipe file.

If you have a subcomponent called "mylibrary", it can simply be referenced by name.

To be useful, a sub-package needs, at minimum, a name.

=== "dub.sdl"

    ```sdl
    subPackage "mylibrary"
    ```

=== "dub.json"

    ```json
    {
        "subPackages": [ "mylibrary" ]
    }
    ```

!!! note

    While the root recipe can contain sub-package configurations, it is
    preferenced to leave configurations in the sub-package recipe file,
    for ease of management.

## Example

This example features a main application with a sub-package library used as a dependency.

It assumes this file structure:

- `dub.sdl` (or `dub.json`): Main recipe.
- `source/` folder with (main package):
    - `app.d`: Main source. Needs to import our sub-package library as `import mylibrary;`.
- `mylibrary/` folder with (sub-package):
    - `dub.sdl` (or `dub.json`): Library recipe.
    - `source/` folder with:
        - `mylibrary.d`: Library source. Module needs to be declared as `module mylibrary;`.

The main recipe file can reference the sub-package.

=== "dub.sdl"

    ```sdl
    name "dubtest"
    dependency ":mylibrary" version="*"
    subPackage "mylibrary"
    ```

=== "dub.json"

    ```json
    {
        "name": "dubtest",
        "dependencies": { ":mylibrary": "*" },
        "subPackages": [ "mylibrary" ]
    }
    ```

The sub-package recipe file can have its own set of dedicated configurations,
but only needs a name to be usable.

=== "mylibrary/dub.sdl"

    ```sdl
    name "mylibrary"
    ```

=== "mylibrary/dub.json"

    ```json
    {
        "name": "mylibrary"
    }
    ```

The `mylibrary` sub-package can now be tested with `dub test :mylibrary` from the
main folder directly.

!!! note

    This makes DUB compile test binaries in the `mylibrary/` folder, since
    sub-packages are packages on their own.
