# Building

!!! note "Work-in-Progress Documentation"

    The content on this page is not yet fully finished.

    Tracking issue: <https://github.com/WebFreak001/dub-docs-v2/issues/4>

For the command to build your application, see [`dub build`](../cli-reference/dub-build.md) and [`dub run`](../cli-reference/dub-run.md)

```
dub build
```

If you have multiple [configurations](../dub-reference/configurations.md) defined in your recipe, you might need to specify which configuration to build:

```
dub build --config=server
```

Or if you want to build a [sub-package](../dub-reference/subpackages.md), you can do so from the root package as well:

```
dub build :mysubpackage
```

## Running

For all of the samples above, you can swap out `dub build` with [`dub run`](../cli-reference/dub-run.md) to both **build and run** your application in a single command line call.

This only works for packages that have an `executable` [target type](../dub-reference/target_types.md), which may be [automatically inferred](../dub-reference/configurations.md#default-configuration) by `autodetect`.

```
dub run
dub run --config=server
dub run :mysubpackage
```

### Passing arguments to the application

For any of the above `dub run` calls you can also specify your own command line arguments by separating DUB's arguments from your own using `--` between them:

```
dub run -- my app args
dub run --config=server -- --config=ignored-by-dub
dub run :mysubpackage -- works universally
```