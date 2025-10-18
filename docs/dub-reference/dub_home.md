# `$DUB_HOME`

`$DUB_HOME` is an environment variable that can be used to override

1. change the default location for user settings ([`~/.dub/settings.json`](./settings.md))
2. change the path for the user-wide packages and cache (`~/.dub/packages`, `~/.dub/cache`)

## Behavior

If either `$DUB_HOME` or `$DPATH` is set as [environment variable](./environment_variables.md), DUB will use them as highest priority for overriding user-wide settings loading and cache locations.

If `$DPATH` is defined, `$DUB_HOME` defaults to `$DPATH/dub`.

It's possible to specify a custom `dubHome` in the system-wide settings to change both settings and cache behavior. In the per-user or per-package config it's possible to set the `dubHome` setting to override the cache behavior.

See also: [User Settings](./settings.md#dubhome).

## `$DPATH`

`$DPATH` is a proposed, general-purpose environment variable intended to provide a **shared user-wide base path** for all D-related tools and applications.

Under this scheme:

* `$DPATH` defines a top-level directory where D tools can store user data.
* DUB uses `$DPATH/dub` as its default if `$DUB_HOME` is not explicitly set.
* Future D tools (compilers, build systems, editors, etc.) could also use `$DPATH` to manage their global installations or configurations.

> **Note:** While `$DPATH` support is planned (and already integrated in some community builds), full adoption across D tooling is still under discussion in the D installer PRs.

Using `$DPATH` consistently would make D’s ecosystem more cohesive, simplifying multi-tool management and allowing centralized user-level storage of compilers, packages, and configurations.

## Settings override

Specifying a `DUB_HOME` or `DPATH` as environment variable or from system-wide settings makes DUB read user settings from there instead of from `$DPATH/dub/` or `%APPDATA%\dub\`.

The only file read from here is `$DUB_HOME/settings.json`.

## Cache override

Specifying a `DUB_HOME` or `DPATH` as environment variable or from *any* settings (system-wide, user-wide, package-wide) changes where user packages and where the package cache are stored.

This overrides the behavior that it would store packages in `~/.dub/packages` and store cache in `~/.dub/cache` to other paths.

On Windows these cache paths default to `%LOCALAPPDATA%\dub\` instead of `%APPDATA%\dub\`. It's currently not possible to specify separate path overrides for user-wide cache, packages and settings.
