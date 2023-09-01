# Dependencies

!!! note "Work-in-Progress Documentation"

    The content on this page is not yet fully finished.

    Tracking issue: <https://github.com/WebFreak001/dub-docs-v2/issues/12>

!!! tip "Recipe details"

    This page details values for a DUB recipe setting.

    For syntax, see [build settings](./build_settings.md#dependencies)

## Dependency syntax

### `version`

See [version specifiers](./build_settings.md#version-specifiers).

* `version="*"`
* `version="==a.b.c"`
* `version="~>a.b.c"`
* `version="~>a.b"`
* `version=">=a"`
* `version=">=a <b"`
* `version="<b"`

|                            | (no release) | v0.0.1 | v0.1.0 | v0.2.0 | v1.0.0 | v2.0.0 |
|----------------------------|--------------|--------|--------|--------|--------|--------|
| `version="*"`              | ✓            | ✓      | ✓      | ✓      | ✓      | ✓      |
| `version="==0.0.1"`        |              | ✓      |        |        |        |        |
| `version="~>0.1.0"`        |              |        | ✓      |        |        |        |
| `version="~>0.1"`          |              |        | ✓      | ✓      |        |        |
| `version=">=0.1.0"`        |              |        | ✓      | ✓      | ✓      | ✓      |
| `version=">=0.1.0 <1.0.0"` |              |        | ✓      | ✓      |        |        |
| `version="<2.0.0"`         |              | ✓      | ✓      | ✓      | ✓      |        |

### `version` + `optional`
### `version` + `optional` + `default=false`
### `path`

Note: this is best used in sub-packages, avoid going outside of repository bounds for public projects.

### `repository`
#### Git repositories

### `dflags`
## `dub.selections.json`
## `dub add-path`
## `dub add-local`
## Dependency/version resolution
## Per-configuration dependencies

## `Have_xyz`

!!! note "Work-in-Progress Documentation"

    The content on this section is not yet fully finished.

    Tracking issue: <https://github.com/WebFreak001/dub-docs-v2/issues/2>

Upstream documentation: <https://dub.pm/advanced_usage>
