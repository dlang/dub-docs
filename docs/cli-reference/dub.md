# dub(1)
dub \- Package and build management system for D
## SYNOPSIS
<b>dub</b> [--version] [<i>COMMAND</i>] [<i>OPTIONS...</i>] -- [<i>APPLICATION ARGUMENTS...</i>]
## DESCRIPTION
Manages the DUB project in the current directory. DUB can serve as a build
system and a package manager, automatically keeping track of project's
dependencies \- both downloading them and linking them into the application.
## COMMANDS

<dl markdown="1">

<dt markdown="1">

<b>[init](dub-init.md)</b>

</dt>
<dd markdown="1">

Initializes an empty package of the specified type in the given directory. By default, the current working directory is used.

</dd>
<dt markdown="1">

<b>[run](dub-run.md)</b>

</dt>
<dd markdown="1">

Builds and runs a package (uses the main package in the current working directory by default)

</dd>
<dt markdown="1">

<b>[build](dub-build.md)</b>

</dt>
<dd markdown="1">

Builds a package (uses the main package in the current working directory by default)

</dd>
<dt markdown="1">

<b>[test](dub-test.md)</b>

</dt>
<dd markdown="1">

Builds the package and executes all contained unit tests.



If no explicit configuration is given, an existing "unittest" configuration will be preferred for testing. If none exists, the first library type configuration will be used, and if that doesn't exist either, the first executable configuration is chosen.



When a custom main file (--main-file) is specified, only library configurations can be used. Otherwise, depending on the type of the selected configuration, either an existing main file will be used (and needs to be properly adjusted to just run the unit tests for 'version(unittest)'), or DUB will generate one for library type configurations.



Finally, if the package contains a dependency to the "tested" package, the automatically generated main file will use it to run the unit tests.

</dd>
<dt markdown="1">

<b>[lint](dub-lint.md)</b>

</dt>
<dd markdown="1">

Builds the package and executes D-Scanner linter tests.

</dd>
<dt markdown="1">

<b>[generate](dub-generate.md)</b>

</dt>
<dd markdown="1">

Generates project files using one of the supported generators:



visuald - VisualD project files

sublimetext - SublimeText project file

cmake - CMake build scripts

build - Builds the package directly



An optional package name can be given to generate a different package than the root/CWD package.

</dd>
<dt markdown="1">

<b>[describe](dub-describe.md)</b>

</dt>
<dd markdown="1">

Prints a JSON build description for the root package an all of their dependencies in a format similar to a JSON package description file. This is useful mostly for IDEs.



All usual options that are also used for build/run/generate apply.



When --data=VALUE is supplied, specific build settings for a project will be printed instead (by default, formatted for the current compiler).



The --data=VALUE option can be specified multiple times to retrieve several pieces of information at once. A comma-separated list is also acceptable (ex: --data=dflags,libs). The data will be output in the same order requested on the command line.



The accepted values for --data=VALUE are:



main-source-file, dflags, lflags, libs, linker-files, source-files, versions, debug-versions, import-paths, string-import-paths, import-files, options



The following are also accepted by --data if --data-list is used:



target-type, target-path, target-name, working-directory, copy-files, string-import-files, pre-generate-commands, post-generate-commands, pre-build-commands, post-build-commands, pre-run-commands, post-run-commands, requirements

</dd>
<dt markdown="1">

<b>[clean](dub-clean.md)</b>

</dt>
<dd markdown="1">

This command removes any cached build files of the given package(s). The final target file, as well as any copyFiles are currently not removed.

Without arguments, the package in the current working directory will be cleaned.

</dd>
<dt markdown="1">

<b>[dustmite](dub-dustmite.md)</b>

</dt>
<dd markdown="1">

This command uses the Dustmite utility to isolate the cause of build errors in a DUB project.



It will create a copy of all involved packages and run dustmite on this copy, leaving a reduced test case.



Determining the desired error condition is done by checking the compiler/linker status code, as well as their output (stdout and stderr combined). If --program-status or --program-regex is given and the generated binary is an executable, it will be executed and its output will also be incorporated into the final decision.

</dd>
<dt markdown="1">

<b>[fetch](dub-fetch.md)</b>

</dt>
<dd markdown="1">

Note: Use "dub add <dependency>" if you just want to use a certain package as a dependency, you don't have to explicitly fetch packages.



Explicit retrieval/removal of packages is only needed when you want to put packages in a place where several applications can share them. If you just have a dependency to add, use the `add` command. Dub will do the rest for you.



Without specified options, placement/removal will default to a user wide shared location.



Complete applications can be retrieved and run easily by e.g.

$ dub fetch vibelog --cache=local

$ dub run vibelog --cache=local



This will grab all needed dependencies and compile and run the application.

</dd>
<dt markdown="1">

<b>[add](dub-add.md)</b>

</dt>
<dd markdown="1">

Adds <packages> as dependencies.



Running "dub add <package>" is the same as adding <package> to the "dependencies" section in dub.json/dub.sdl.

If no version is specified for one of the packages, dub will query the registry for the latest version.

</dd>
<dt markdown="1">

<b>[remove](dub-remove.md)</b>

</dt>
<dd markdown="1">

Removes a package that is cached on the local system.

</dd>
<dt markdown="1">

<b>[upgrade](dub-upgrade.md)</b>

</dt>
<dd markdown="1">

Upgrades all dependencies of the package by querying the package registry(ies) for new versions.



This will update the versions stored in the selections file (dub.selections.json) accordingly.



If one or more package names are specified, only those dependencies will be upgraded. Otherwise all direct and indirect dependencies of the root package will get upgraded.

</dd>
<dt markdown="1">

<b>[add-path](dub-add-path.md)</b>

</dt>
<dd markdown="1">

Adds a default package search path. All direct sub folders of this path will be searched for package descriptions and will be made available as packages. Using this command has the equivalent effect as calling 'dub add-local' on each of the sub folders manually.



Any packages registered using add-path will be preferred over packages downloaded from the package registry when searching for dependencies during a build operation.



The version of the packages will be determined by one of the following:

  - For GIT working copies, the last tag (git describe) is used to determine the version

  - If the package contains a "version" field in the package description, this is used

  - If neither of those apply, "~master" is assumed

</dd>
<dt markdown="1">

<b>[remove-path](dub-remove-path.md)</b>

</dt>
<dd markdown="1">

Removes a package search path previously added with add-path.

</dd>
<dt markdown="1">

<b>[add-local](dub-add-local.md)</b>

</dt>
<dd markdown="1">

Adds a local package directory to be used during dependency resolution. This command is useful for registering local packages, such as GIT working copies, that are either not available in the package registry, or are supposed to be overwritten.



The version of the package is either determined automatically (see the "add-path" command, or can be explicitly overwritten by passing a version on the command line.



See 'dub add-path -h' for a way to register multiple local packages at once.

</dd>
<dt markdown="1">

<b>[remove-local](dub-remove-local.md)</b>

</dt>
<dd markdown="1">

Removes a local package directory

</dd>
<dt markdown="1">

<b>[list](dub-list.md)</b>

</dt>
<dd markdown="1">

Prints a list of all or selected local packages. This includes all cached packages (user or system wide), all packages in the package search paths ("dub add-path") and all manually registered packages ("dub add-local"). If package specified output filtered by package spec.

</dd>
<dt markdown="1">

<b>[search](dub-search.md)</b>

</dt>
<dd markdown="1">

Search all specified DUB registries for packages matching query.

</dd>
<dt markdown="1">

<b>[add-override](dub-add-override.md)</b>

</dt>
<dd markdown="1">



</dd>
<dt markdown="1">

<b>[remove-override](dub-remove-override.md)</b>

</dt>
<dd markdown="1">



</dd>
<dt markdown="1">

<b>[list-overrides](dub-list-overrides.md)</b>

</dt>
<dd markdown="1">

Prints a list of all overridden packages added via "dub add-override".

</dd>
<dt markdown="1">

<b>[clean-caches](dub-clean-caches.md)</b>

</dt>
<dd markdown="1">

This command removes any cached metadata like the list of available packages and their latest version.

</dd>
<dt markdown="1">

<b>[convert](dub-convert.md)</b>

</dt>
<dd markdown="1">

This command will convert between JSON and SDLang formatted package recipe files.



Warning: Beware that any formatting and comments within the package recipe will get lost in the conversion process.

</dd>
## COMMON OPTIONS

<dl>


<dt id="option-----b--h-b-b---help-b-" class="option-argname">
<a class="anchor" href="#option-----b--h-b-b---help-b-"></a>

<b>-h</b>, <b>--help</b>

</dt>


<dd markdown="1" class="option-desc">

Display general or command specific help

</dd>


<dt id="option-----b---root-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-----b---root-b-i-VALUE-i-"></a>

<b>--root</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Path to operate in instead of the current working dir

</dd>


<dt id="option-----b---registry-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-----b---registry-b-i-VALUE-i-"></a>

<b>--registry</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Search the given registry URL first when resolving dependencies. Can be specified multiple times. Available registry types:

  DUB: URL to DUB registry (default)

  Maven: URL to Maven repository + group id containing dub packages as artifacts. E.g. mvn+http://localhost:8040/maven/libs-release/dubpackages

</dd>


<dt id="option-----b---skip-registry-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-----b---skip-registry-b-i-VALUE-i-"></a>

<b>--skip-registry</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Sets a mode for skipping the search on certain package registry types:

  none: Search all configured or default registries (default)

  standard: Don't search the main registry (e.g. https://code.dlang.org/)

  configured: Skip all default and user configured registries

  all: Only search registries specified with --registry

</dd>


<dt id="option-----b---annotate-b-" class="option-argname">
<a class="anchor" href="#option-----b---annotate-b-"></a>

<b>--annotate</b>

</dt>


<dd markdown="1" class="option-desc">

Do not perform any action, just print what would be done

</dd>


<dt id="option-----b---bare-b-" class="option-argname">
<a class="anchor" href="#option-----b---bare-b-"></a>

<b>--bare</b>

</dt>


<dd markdown="1" class="option-desc">

Read only packages contained in the current directory

</dd>


<dt id="option-----b--v-b-b---verbose-b-" class="option-argname">
<a class="anchor" href="#option-----b--v-b-b---verbose-b-"></a>

<b>-v</b>, <b>--verbose</b>

</dt>


<dd markdown="1" class="option-desc">

Print diagnostic output

</dd>


<dt id="option-----b---vverbose-b-" class="option-argname">
<a class="anchor" href="#option-----b---vverbose-b-"></a>

<b>--vverbose</b>

</dt>


<dd markdown="1" class="option-desc">

Print debug output

</dd>


<dt id="option-----b--q-b-b---quiet-b-" class="option-argname">
<a class="anchor" href="#option-----b--q-b-b---quiet-b-"></a>

<b>-q</b>, <b>--quiet</b>

</dt>


<dd markdown="1" class="option-desc">

Only print warnings and errors

</dd>


<dt id="option-----b---verror-b-" class="option-argname">
<a class="anchor" href="#option-----b---verror-b-"></a>

<b>--verror</b>

</dt>


<dd markdown="1" class="option-desc">

Only print errors

</dd>


<dt id="option-----b---vquiet-b-" class="option-argname">
<a class="anchor" href="#option-----b---vquiet-b-"></a>

<b>--vquiet</b>

</dt>


<dd markdown="1" class="option-desc">

Print no messages

</dd>


<dt id="option-----b---colors-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-----b---colors-b-i-VALUE-i-"></a>

<b>--colors</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Configure colored output. Accepted values:

  automatic: Colored output on console/terminal,

             unless NO_COLOR is set and non-empty (default)

         on: Force colors enabled

        off: Force colors disabled

</dd>


<dt id="option-----b---cache-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-----b---cache-b-i-VALUE-i-"></a>

<b>--cache</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Puts any fetched packages in the specified location [local|system|user].

</dd>


</dl>

## FILES
<i>dub.sdl</i>, <i>dub.json</i>
## AUTHOR
Copyright (c) 1999-2022 by The D Language Foundation
## ONLINE DOCUMENTATION
[http://code.dlang.org/docs/commandline](http://code.dlang.org/docs/commandline)
## SEE ALSO
<b>dmd</b>(1), <b>rdmd</b>(1), [<b>dub-init</b>(1)](dub-init.md), [<b>dub-run</b>(1)](dub-run.md), [<b>dub-build</b>(1)](dub-build.md), [<b>dub-test</b>(1)](dub-test.md), [<b>dub-lint</b>(1)](dub-lint.md), [<b>dub-generate</b>(1)](dub-generate.md), [<b>dub-describe</b>(1)](dub-describe.md), [<b>dub-clean</b>(1)](dub-clean.md), [<b>dub-dustmite</b>(1)](dub-dustmite.md), [<b>dub-fetch</b>(1)](dub-fetch.md), [<b>dub-add</b>(1)](dub-add.md), [<b>dub-remove</b>(1)](dub-remove.md), [<b>dub-upgrade</b>(1)](dub-upgrade.md), [<b>dub-add-path</b>(1)](dub-add-path.md), [<b>dub-remove-path</b>(1)](dub-remove-path.md), [<b>dub-add-local</b>(1)](dub-add-local.md), [<b>dub-remove-local</b>(1)](dub-remove-local.md), [<b>dub-list</b>(1)](dub-list.md), [<b>dub-search</b>(1)](dub-search.md), [<b>dub-add-override</b>(1)](dub-add-override.md), [<b>dub-remove-override</b>(1)](dub-remove-override.md), [<b>dub-list-overrides</b>(1)](dub-list-overrides.md), [<b>dub-clean-caches</b>(1)](dub-clean-caches.md), [<b>dub-convert</b>(1)](dub-convert.md)
