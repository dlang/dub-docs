# Dependencies

!!! note "Work-in-Progress Documentation"

    The content on this page is not yet fully finished.

    Tracking issue: <https://github.com/dlang/dub-docs/issues/64>

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

!!! note

    For public projects, avoid leaving your package root, so that users can build your package without needing to manage external dependencies.

Inside sub-packages you can refer to the parent package using `path=".."` (or elsewhere, depending on folder structure), to avoid DUB accidentally looking up a different package location whenever you run DUB from inside the sub-package folder.

### `repository`
#### Git repositories

### `dflags`
## `dub.selections.json`
## `dub add-path`

CLI docs: [`dub add-path`](../cli-reference/dub-add-path.md)

## `dub add-local`

CLI docs: [`dub add-local`](../cli-reference/dub-add-local.md)

## Dependency/version resolution
## Per-configuration dependencies

## `Have_xyz`

!!! note "Work-in-Progress Documentation"

    The content on this section is not yet fully finished.

    Tracking issue: <https://github.com/dlang/dub-docs/issues/55>

Projects can have additional special dependencies for specific configurations.

```json
"configurations": [
	{
		"name": "myconfig",
		"dependencies": {
			"mydep": { "version": "*" }
		}
	}
]
```

DUB provides version identifier of dependencies for conditional compilation with [version conditions](https://dlang.org/spec/version.html#version). `Have_<dependency>` version identifier can be used for conditional compilation.

!!! note

    Special characters other than identifier characters (`[a-z, A-Z, 0-9, _]`) in dependency name are replaced with an underscore (`_`) character in their version identifier.

```d
version (Have_mydep) {
    // dependency "mydep" is being included
    import mydep;
}
version (Have_vibe_d_http) {
    // dependency "vibe-d:http" is being included
}
```

Note that your package has to somehow depend on the package for it to get these `Have_*` version identifiers. If you want to query for it without pulling in a new dependency, use optional dependencies:

```json
"dependencies": {
    "vibe-d:http": { "optional": true, "version": "*" }
}
```
