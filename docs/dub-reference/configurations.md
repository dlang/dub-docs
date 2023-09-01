# Configurations

DUB combines build options and requirements from two sources when building:

- Configuration, through the `--config=...` switch
- [Build type](./buildtypes.md), through the `--build=...` switch

While technically the two things are often very similar, semantically it makes sense to split them into two distinct categories. While build types often generically apply to any configuration and adjust how it is run, configurations rather represent different possible options and configurations of your project that may be chosen between.

Using [`dub build --print-configs`](../cli-reference/dub-build.md) it's possible to list the available configurations and which one is the default.

## Default configuration

When **no configurations** are defined in the package recipe, a default configuration is generated:

- if the package target type is set explicitly to `"executable"`, a default configuration `--config=application` will be generated and used by default. If the main source file is not set in the recipe, it is [defaulted](./defaults.md).
- if the package target type is set explicitly to `"none"`, no configurations will be generated
- if the package target type is `"autodetect"` (default or set explicitly) then:
    - if a [default main file](./defaults.md) exists, the target type is set to `"executable"`, the [mainSourceFile](./build_settings.md#mainsourcefile) is set to that path and the `--config=application` configuration as described above is added
    - additionally in either way there will be a `--config=library` configuration that is the same as the recipe, not setting any main source file.

In the usual case with a minimal dub recipe and an app.d file this means the configurations `--config=application` and `--config=library` will be available, allowing the package to both be used as application (when just running `dub build` or `dub run` in the folder) or as automatically a library when depending on it, excluding the app.d file.

Otherwise **if there are configurations defined** in the recipe, no default configurations will be created and the **first available** (matching platform) configuration will be picked for building.

So for regular builds this matching order is used:

1. if the `--config` CLI flag is set, that configuration is used
2. if configurations are defined in the recipe:
    1. the first configuration is picked
3. if no configurations are defined in the recipe:
    1. if target type is `"executable"`, the auto-generated `--config=application` is picked
    2. if target type is `"autodetect"` or unset:
        1. if a [default main file](./defaults.md) exists, the auto-generated `--config=application` is picked
        2. if no default main file exists, the auto-generated `--config=library` is picked

If no configuration is found (default on targetType "none"), the test is skipped for the package.

---

When testing a package ([dub-test(1)](../cli-reference/dub-test.md)) the following steps are checked in order, with the first matching one being the used configuration.

1. if the `--config` CLI flag is set, that configuration is used
2. if the `--main-file` CLI flag is set, the first configuration that is not `targetType "executable"` is picked
3. if a `"unittest"` configuration is defined, it is used
4. if it exists, the first configuration that is not `targetType "executable"` is picked
5. if it exists, the first configuration is picked

If no configuration is found (default on targetType "none"), the test is skipped for the package.
