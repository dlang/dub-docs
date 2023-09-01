# The Recipe (dub.json / dub.sdl)

## Formats

TODO: [JSON](https://www.json.org/json-en.html) and [SDLang](https://sdlang.org) format.

You can convert between the available formats using [`dub convert`](../cli-reference/dub-convert.md).

## Reference

### Package settings

Package settings affect the entire package and mostly contain metadata such as
package name, description, homepage, authors, license, etc.

For members that can only be put on the top-level scope of the dub.json /
dub.sdl, see [Package settings](./package_settings.md)

### Build settings

Build settings influence the command line options passed to the compiler and linker. Many settings support [platform specifications](./platform_specifications.md) to only apply the settings on certain targets. Most settings can also be overridden per configuration or build-type.

For available members, see [Build settings](./build_settings.md)

#### Environment variables

It is possible to use environment variables inside of build setting values using dollar notation. Refer to [Environment Variables](./environment_variables.md) for more details.

### Build types

Can specify a set of build setting overrides using `--build=XYZ`. Some default build types exist.

For available members and default build types, see [Build types](./buildtypes.md)

### Configurations

Can specify a set of build setting overrides using `--config=XYZ`. If no configurations are specified, some auto-generated ones exist.

For available members and auto-generated fallback configurations, see [Configurations](./configurations.md)
