# Registries

!!! note "Work-in-Progress Documentation"

    The content on this page is not yet fully finished.

    Tracking issue: <https://github.com/WebFreak001/dub-docs-v2/issues/18>

## Configuring mirrors

As a user you might be interested in configuring DUB registry mirrors for a number of reasons:

- you want to pick mirrors geographically closer to you for better response time and possibly bandwidth
- you are running package mirrors publicly in your region or just for your infrastructure
- you are hosting a private registry

Mirrors are collected from multiple sources:

### Built-in mirrors



### Persistent dub.settings.json

You can configure registry mirrors on a [per-package or system-wide setting](./settings.md).

See the [registryUrls](./settings.md#registryurls) setting for more info.

### `DUB_REGISTRY` environment variable

You can set additional registries that are picked up for use from the DUB_REGISTRY environment variable, separated by semicolons.

Example:

```sh
# note: you don't have to include the default registries like these, only include your own registries.
env DUB_REGISTRY='https://code.dlang.org/;https://codemirror.dlang.org/' dub build
```

### `--registry=VALUE` CLI argument

## Registry priority

# Hosting Registries

## Requirements

## Building

To build the dub-registry project, then clone it and then run `dub build`

```
git clone https://github.com/dlang/dub-registry.git
cd dub-registry
dub build
```

## Running as standalone registry



## Running in mirror mode
