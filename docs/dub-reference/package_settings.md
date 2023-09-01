# Package settings

Package settings are settings that can only be configured once, at the top-level of the package recipe.

## `name`

!!! tip

    `name` is the only required field in any dub package recipe for building.

    Note that for publishing packages you still have to add a few other fields, see below.

Name of the package, used to uniquely identify the package. Must be comprised of only lower case ASCII alpha-numeric characters, "-" or "_".

Allowed name regex:

```regex
# allowed name regex:
[a-z_-]+
```

Technically uppercase characters are parsed, but not valid for publishing and will simply be lowercased immediately after parsing.

=== "dub.sdl"

    ```sdl
    name "openssl"
    ```

    Arguments: `"<name>"`

=== "dub.json"

    ```json
    "name": "openssl"
    ```

    Type: `string`

!!! success "Naming and description convention"
    Keep the description concise and avoid including unspecific information such as the fact that the package is written in D, also in the package name - since _all_ DUB packages are written in D, it's usually better to avoid mentioning D explicitly, unless the package is for example a high-level wrapper around a C/C++ library.

## `description`

Brief description of the package.

Descriptions longer than 100 bytes will be cut off at 98 bytes when displayed in the registry package list.

=== "dub.sdl"

    ```sdl
    ...
    description "A little web service of mine."
    ```

    Arguments: `"<text>"`

=== "dub.json"

    ```json
    ...
    "description": "A little web service of mine."
    ```

    Type: `string`

## `toolchainRequirements`

The package can specify version requirements for the toolchain. Each requirement is specified with the [version dependency syntax](./dependencies.md). For compilers, the keyword `no` can be specified instead of a version requirement to disallow the use of a specific compiler for the package. The following requirements are allowed:

| Identifier | Description |
| ---------- | ----------- |
| `"dub"`    | DUB version requirement |
|`"frontend"`| D frontend version requirement (equivalent to DMD version, applies to all compilers) |
| `"dmd"`    | DMD version requirement |
| `"ldc"`    | LDC version requirement |
| `"gdc"`    | GDC version requirement |

=== "dub.sdl"

    Example 1: package that needs at least dub v1.14 and uses D features introduced in frontend 2.068 (since DMD version 2.068) and other features that will be deprecated in frontend 2.087

    ```sdl
    toolchainRequirements dub=">=1.14.0" frontend=">=2.068 <2.087"
    ```

    Example 2: package that needs to be compiled with LDC from version 1.11

    ```sdl
    toolchainRequirements dmd="no" gdc="no" ldc=">=1.11.0"
    ```

    Arguments: `<requirement1> [<requirement2> [...]]`

=== "dub.json"

    Example 1: package that needs at least dub v1.14 and uses D features introduced in frontend 2.068 (since DMD version 2.068) and other features that will be deprecated in frontend 2.087

    ```json
    {
        "toolchainRequirements": {
            "dub": ">=1.14.0",
            "frontend": ">=2.068 <2.087"
        }
    }
    ```

    Example 2: package that needs to be compiled with LDC from version 1.11

    ```json
    {
        "toolchainRequirements": {
            "dmd": "no",
            "gdc": "no",
            "ldc": ">=1.11"
        }
    }
    ```

    Type: `string[string]`

## `homepage`

URL of the project website

=== "dub.sdl"

    ```sdl
    ...
    homepage "http://myproject.example.com"
    ```

    Arguments: `"<url>"`

=== "dub.json"

    ```json
    ...
    "homepage": "http://myproject.example.com"
    ```

    Type: `string`

## `authors`

List of project authors (the suggested format is either `"Peter Parker"` or `"Peter Parker <pparker@example.com>"`)

=== "dub.sdl"

    ```sdl
    ...
    authors "Peter Parker <pparker@example.com>"
    ```

    Arguments: `"<author1>" ["<author2>" [...]]`

=== "dub.json"

    ```json
    ...
    "authors": ["Peter Parker <pparker@example.com>"]
    ```

    Type: `string[]`

## `copyright`

Copyright declaration string

=== "dub.sdl"

    ```sdl
    ...
    copyright "Copyright © 2023, John Doe"
    ```

    Arguments: `"<text>"`

=== "dub.json"

    ```json
    ...
    "copyright": "Copyright © 2023, John Doe"
    ```

    Type: `string`

## `license`

License(s) under which the project can be used.

=== "dub.sdl"

    ```sdl
    ...
    license "GPL-2.0"
    ```

    Arguments: `"<license spec>"`

=== "dub.json"

    ```json
    ...
    "license": "GPL-2.0"
    ```

    Type: `string`

The license setting should only contain one of the standard license identifiers if possible. At a later point in time, DUB may use this information to validate proper licensing in dependency hierarchies and output warnings when licenses don't match up. Multiple licenses can be separated using the term "or" and for versioned licenses, the postfix "or later" is allowed to also include any later version of the same license.

The standard license identifiers are: `public domain`, `AFL-3.0` (Academic Free License 3.0), `AGPL-3.0` (Affero GNU Public License 3.0), `Apache-2.0`, `APSL-2.0` (Apple Public Source License), `Artistic-2.0`, `BSL-1.0` (Boost Software License), `BSD 2-clause`, `BSD 3-clause`, `EPL-1.0` (Eclipse Public License), `GPL-2.0`, `GPL-3.0`, `ISC`, `LGPL-2.1`, `LGPL-3.0`, `MIT`, `MPL-2.0` (Mozilla Public License 2.0), `MS-PL` (Microsoft Public License), `MS-RL` (Microsoft Reciprocal License), `NCSA` (University of Illinois/NCSA Open Source License), `OpenSSL` (OpenSSL License), `SSLeay` (SSLeay License), `Zlib` (zlib/libpng License)

!!! tip "SPDX licenses"

    The license string is going to change to the similar, but not fully compatible SPDX license identifier standard in the future. This is likely before any license validation is implemented, so it's suggested that newer packages start using the SPDX license specification already instead of the legacy DUB-specific license names.

    See <https://spdx.org/licenses/> for more information.

Any other value is considered to be a proprietary license, which is assumed to be incompatible with any other license. If you think there is a license that should be included in this list, please file a quick bug report. Please also note that pure D bindings of C/C++ libraries should specify the same license as the original library, although a stricter but compatible license can be used, too.

Some example license specifications:

```json
"GPL-3.0"
"GPL-2.0 or later"
"GPL-2.0 or later or proprietary"
"GPL-2.0 or LGPL-3.0"
"LGPL-2.1 or proprietary"
```

## `subPackages`

=== "dub.sdl"

    Defines a sub-package using either a path to a sub directory, or in-place - see the [sub package page](../dub-reference/subpackages.md) for more information

    ```sdl
    ...
    subPackage "./component1/"
    subPackage "./component2/"
    ```

    Arguments: `"<path>" or { ... }`

=== "dub.json"

    Defines an array of sub-packages defined in the same directory as the root project, where each entry is either a path of a sub folder or an object of the same format as a dub.json file - see the [sub package page](../dub-reference/subpackages.md) for more information

    ```json
    ...
    "subPackages": [
        "./component1/",
        "./component2/"
    ]
    ```

    Type: `T[]`

## `configurations`

=== "dub.sdl"

    Speficies a build configuration (chosen on the command line using `--config=...`) - see the [configurations page](../dub-reference/configurations.md) for more details.

    ```sdl
    ...
    configuration "configname" {
        ... // build settings
    }
    ```

    Arguments: `"<name>" { ... }`

=== "dub.json"

    Speficies an optional list of build configurations (chosen on the command line using `--config=...`) - see the [configurations page](../dub-reference/configurations.md) for more details.

    ```json
    ...
    "configurations": [
        {
            "name": "configname",
            ... // build settings
        }
    ]
    ```

    Type: `T[]`

## `buildTypes`

=== "dub.sdl"

    Defines an additional custom build type or overrides one of the default ones (chosen on the command line using --build=...) - see the [build types page](../dub-reference/buildtypes.md) for an example

    ```sdl
    ...
    buildType "buildname" {
        ... // build settings
    }
    ```

    Arguments: `"<name>" { ... }`

=== "dub.json"

    Defines additional custom build types or overrides the default ones (chosen on the command line using --build=...) - see the [build types page](../dub-reference/buildtypes.md) for an example

    ```json
    ...
    "buildTypes": {
        "buildname": {
            ... // build settings
        }
    }
    ```

    Type: `T[string]`

## `x:ddoxFilterArgs`

Specifies a list of command line flags usable for controlling filter behavior for --build=ddox **[experimental]**

=== "dub.sdl"

    ```sdl
    ...
    -ddoxFilterArgs \
        "--unittest-examples" \
        "--min-protection=Protected"
    ```

    Arguments: `"<arg1>" ["<arg2>" [...]]`

=== "dub.json"

    ```json
    ...
    "x:ddoxFilterArgs": [
        "--unittest-examples",
        "--min-protection=Protected"
    ]
    ```

    Type: `string[]`
