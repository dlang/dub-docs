# First Steps

## Starting a new project

To create a new project in a folder called `myproject/`, run:

```
$ dub init myproject
```

This begins an interactive session:

```
Package recipe format (sdl/json) [sdl]:
Name [myproject]:
Description [A minimal D application.]: My first project
Author name [imadev]: My Name
License [proprietary]: Boost
Copyright string [Copyright © 2022, My Name]:
Add dependency (leave empty to skip) []:
Successfully created an empty project in '/home/imadev/src/myproject'.
Package successfully created in myproject
```

DUB has created a "myproject" directory containing a .gitignore, a [dub recipe](../dub-guide/recipe.md), and a source tree containing an app.d file.

```
myproject/
├── source/
│   └── app.d
├── .gitignore
└── dub.json
```

Notice that there are two configuration file formats available. JSON is a commonly-known format, and SDL ([SDLang](https://sdlang.org)) is a clean, minimalist format. Both offer equivalent functionality (though unlike JSON, SDLang allows comments); use whichever you prefer.

The following configuration file is generated:

=== "dub.sdl"

    ```sdl
    name "myproject"
    description "My first project"
    authors "My Name"
    copyright "Copyright © 2022, My Name"
    license "Boost"
    ```

=== "dub.json"

    ```json
    {
        "name": "myproject",
        "authors": [
            "My Name"
        ],
        "description": "My first project",
        "copyright": "Copyright © 2022, My Name",
        "license": "Boost"
    }
    ```

For more information and help with configuring your builds, see the [recipe documentation](../dub-guide/recipe.md). DUB is smart and will provide sane defaults, but you can override almost anything.

Execute [`dub build`](../cli-reference/dub-build.md) to build your project, [`dub run`](../cli-reference/dub-run.md) to build and run it, or [`dub test`](../cli-reference/dub-test.md) to build and run unit tests. The last line below is the output of the default application.

!!! cli "dub run"
    <pre>
        <span class="col_lg">Starting</span> Performing "<span class="col_dp">debug</span>" build using dmd for x86_64.
        <span class="col_lg">Building</span> <b>myproject</b> ~master: building configuration [<span class="col_db">application</span>]
         <span class="col_lg">Linking</span> <b>myproject</b>
         <span class="col_dg">Running</span> myproject 
    Edit source/app.d to start your project.
    </pre>

See the [command line interface documentation](../cli-reference/dub.md), or run [dub --help and dub <command> --help](../cli-reference/dub.md) for more information.

## Adding a dependency

When you find a package to use from the [DUB registry](https://code.dlang.org), add it to the dependency list in your DUB configuration file by running [`dub add <packageName>`](../cli-reference/dub-add.md).

The DUB registry uses git tags to determine application versioning and DUB's dependency management is designed to work best according to [SemVer](http://semver.org/) rules. Please follow the rules of the SemVer specification for all packages you list on the registry. See the [recipe documentation](../dub-guide/recipe.md) for more information on dependency version specification.

You can publish packages to [the registry here](../dub-guide/publishing.md).

## Building a third-party project

You can easily fetch and build third-party projects published to the dub registry via the [`dub fetch <package name>`](../cli-reference/dub-fetch.md) command.

To get the package, run [`dub fetch <package name>`](../cli-reference/dub-fetch.md) to download the package and install it in your [user build directory](../dub-reference/dub_home.md). [`dub run <package name>`](../cli-reference/dub-run.md) can then be used to build and execute the package. Adding the `--cache=local` flag to the fetch command will extract the package into a subfolder of the current working directory.

## Publishing packages

To publish your own packages, just create a new package with a valid package recipe like above (see the [package recipe specification](../dub-reference/recipe.md)) and follow the instructions on the [publishing packages](../dub-guide/publishing.md) page.
