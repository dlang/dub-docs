# Package Suppliers

## Introduction

DUB supports package suppliers of types

- DUB Registry,
- Maven and
- File System.

By default, DUB will search on the DUB Registry on [https://code.dlang.org](https://code.dlang.org), possibly trying hard-coded and user-set fallbacks.

Package suppliers can be specified either using argument `--registry` or globally using the [registryUrls setting](../dub-reference/settings.md#registryUrls). The type of the package supplier can be specified by prefixing the URL with `dub+` for type DUB Registry, `mvn+` for type Maven or using the `file://` scheme for type File System. Without a prefix, the type DUB Registry (`dub+`) is assumed.

## DUB Registry

DUB packages are registered at a [DUB registry server](https://github.com/dlang/dub-registry) like [https://code.dlang.org](https://code.dlang.org). It isn't needed to prefix the address of a DUB Registry. 

**Examples**:

- `https://code.dlang.org/`
- `dub+https://code.dlang.org/`

## Maven repository

DUB can retrieve package zip archives located within a Maven repository like Nexus or Artifactory. The registry address needs to contain the Maven repository and a group id. The dub packages needs to be stored with a common group id, the dub package name as artifact id and dub version as artifact version. The dub package zip file must have the name `[packageName]-[version].zip`.

**Example**:

Dub package zip archive `calculator-1.0.0.zip` is stored on Maven repository [http://localhost:8040/maven/libs-release](http://localhost:8040/maven/libs-release) using group id `dubpackages`. As registry address

- `mvn+http://localhost:8040/maven/libs-release/dubpackages`

needs to be specified.

```
dub fetch calculator@1.0.0 --skip-registry=all --registry=mvn+http://localhost:8040/maven/libs-release/dubpackages
```

## File system

A folder containing dub packages as zip files could be specified as registry. The zip files must have the name `[packageName]-[version].zip`.

**Examples**:

- Linux `file:///var/dubpackages`
- Windows `file:///c:/d/dubpackages`

To use a registry only for a single command, you can use

```
dub fetch calculator@1.0.0 --skip-registry=all --registry=file:///var/dubpackages
```

See [dub-fetch(1)](../cli-reference/dub-fetch.md).
