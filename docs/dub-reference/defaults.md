# Recipe defaults

When not filling in optional information in the DUB [recipe](./recipe.md), a few things will be assumed.

## Default string import paths

If no [`stringImportPaths`](./build_settings.md#stringimportpaths) are defined in the default (global) build settings, DUB will see if the following folders exist:

- `views/`

if this folder exists it is defaulted as the global `stringImportPaths` value.

## Default source paths + import paths

If no [`sourcePaths`](./build_settings.md#sourcepaths) or if no [`importPaths`](./build_settings.md#importpaths) are defined in the default (global) build settings, DUB will see if the following folders exist:

- `source/`
- `src/`

whichever exists is added to whatever was not defined in the recipe. Both `source` and `src` may be added if both exist.

## Default main file

DUB will check if a potential main file exists in all source folders:

1. `$SOURCE_PATH[i]/app.d`
2. `$SOURCE_PATH[i]/main.d`
3. `$SOURCE_PATH[i]/$PACKAGE_NAME/main.d`
4. `$SOURCE_PATH[i]/$PACKAGE_NAME/app.d`

Whenever a file is found, it will abort for the current source path, but will continue checking the later source paths, which may still override the main file.

If such a file exists, special logic will be applied to the default configuration generation. If there are already explicitly set configurations, this will have no effect.

## Default configurations

If no configurations are defined, the configurations `application` and `library` may be defined, depending on the selected or detected [`targetType`](./build_settings.md#targettype).

See [configurations](./configurations.md#default-configuration).
