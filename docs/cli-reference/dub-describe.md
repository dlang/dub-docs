# dub-describe(1)
dub-describe \- Prints a JSON description of the project and its dependencies
## SYNOPSIS
<b>dub describe </b>[&lt;<i>package</i>&gt;[@&lt;<i>version-spec</i>&gt;]] <i>OPTIONS...</i>
## DESCRIPTION
Prints a JSON build description for the root package an all of their dependencies in a format similar to a JSON package description file. This is useful mostly for IDEs.



All usual options that are also used for build/run/generate apply.



When --data=VALUE is supplied, specific build settings for a project will be printed instead (by default, formatted for the current compiler).



The --data=VALUE option can be specified multiple times to retrieve several pieces of information at once. A comma-separated list is also acceptable (ex: --data=dflags,libs). The data will be output in the same order requested on the command line.



The accepted values for --data=VALUE are:



main-source-file, dflags, lflags, libs, linker-files, source-files, versions, debug-versions, import-paths, string-import-paths, import-files, options



The following are also accepted by --data if --data-list is used:



target-type, target-path, target-name, working-directory, copy-files, string-import-files, pre-generate-commands, post-generate-commands, pre-build-commands, post-build-commands, pre-run-commands, post-run-commands, requirements
## OPTIONS

<dl>


<dt id="option-describe---b--b-b-b---build-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-describe---b--b-b-b---build-b-i-VALUE-i-"></a>

<b>-b</b>, <b>--build</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Specifies the type of build to perform. Note that setting the DFLAGS environment variable will override the build type with custom flags.

Possible names:

  debug, plain, release, release-debug, release-nobounds, unittest, profile, profile-gc, docs, ddox, cov, cov-ctfe, unittest-cov, unittest-cov-ctfe, syntax and custom types

</dd>


<dt id="option-describe---b--c-b-b---config-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-describe---b--c-b-b---config-b-i-VALUE-i-"></a>

<b>-c</b>, <b>--config</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Builds the specified configuration. Configurations can be defined in dub.json

</dd>


<dt id="option-describe---b---override-config-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-describe---b---override-config-b-i-VALUE-i-"></a>

<b>--override-config</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Uses the specified configuration for a certain dependency. Can be specified multiple times.

Format: --override-config=<dependency>/<config>

</dd>


<dt id="option-describe---b---compiler-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-describe---b---compiler-b-i-VALUE-i-"></a>

<b>--compiler</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Specifies the compiler binary to use (can be a path).

Arbitrary pre- and suffixes to the identifiers below are recognized (e.g. ldc2 or dmd-2.063) and matched to the proper compiler type:

  dmd, gdc, ldc, gdmd, ldmd

</dd>


<dt id="option-describe---b--a-b-b---arch-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-describe---b--a-b-b---arch-b-i-VALUE-i-"></a>

<b>-a</b>, <b>--arch</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Force a different architecture (e.g. x86 or x86_64)

</dd>


<dt id="option-describe---b--d-b-b---debug-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-describe---b--d-b-b---debug-b-i-VALUE-i-"></a>

<b>-d</b>, <b>--debug</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Define the specified debug version identifier when building - can be used multiple times

</dd>


<dt id="option-describe---b---nodeps-b-" class="option-argname">
<a class="anchor" href="#option-describe---b---nodeps-b-"></a>

<b>--nodeps</b>

</dt>


<dd markdown="1" class="option-desc">

Do not resolve missing dependencies before building

</dd>


<dt id="option-describe---b---build-mode-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-describe---b---build-mode-b-i-VALUE-i-"></a>

<b>--build-mode</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Specifies the way the compiler and linker are invoked. Valid values:

  separate (default), allAtOnce, singleFile

</dd>


<dt id="option-describe---b---single-b-" class="option-argname">
<a class="anchor" href="#option-describe---b---single-b-"></a>

<b>--single</b>

</dt>


<dd markdown="1" class="option-desc">

Treats the package name as a filename. The file must contain a package recipe comment.

</dd>


<dt id="option-describe---b---force-remove-b-" class="option-argname">
<a class="anchor" href="#option-describe---b---force-remove-b-"></a>

<b>--force-remove</b>

</dt>


<dd markdown="1" class="option-desc">

Deprecated option that does nothing.

</dd>


<dt id="option-describe---b---filter-versions-b-" class="option-argname">
<a class="anchor" href="#option-describe---b---filter-versions-b-"></a>

<b>--filter-versions</b>

</dt>


<dd markdown="1" class="option-desc">

[Experimental] Filter version identifiers and debug version identifiers to improve build cache efficiency.

</dd>


<dt id="option-describe---b---import-paths-b-" class="option-argname">
<a class="anchor" href="#option-describe---b---import-paths-b-"></a>

<b>--import-paths</b>

</dt>


<dd markdown="1" class="option-desc">

Shortcut for --data=import-paths --data-list

</dd>


<dt id="option-describe---b---string-import-paths-b-" class="option-argname">
<a class="anchor" href="#option-describe---b---string-import-paths-b-"></a>

<b>--string-import-paths</b>

</dt>


<dd markdown="1" class="option-desc">

Shortcut for --data=string-import-paths --data-list

</dd>


<dt id="option-describe---b---data-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-describe---b---data-b-i-VALUE-i-"></a>

<b>--data</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Just list the values of a particular build setting, either for this package alone or recursively including all dependencies. Accepts a comma-separated list. See above for more details and accepted possibilities for VALUE.

</dd>


<dt id="option-describe---b---data-list-b-" class="option-argname">
<a class="anchor" href="#option-describe---b---data-list-b-"></a>

<b>--data-list</b>

</dt>


<dd markdown="1" class="option-desc">

Output --data information in list format (line-by-line), instead of formatting for a compiler command line.

</dd>


<dt id="option-describe---b---data-0-b-" class="option-argname">
<a class="anchor" href="#option-describe---b---data-0-b-"></a>

<b>--data-0</b>

</dt>


<dd markdown="1" class="option-desc">

Output --data information using null-delimiters, rather than spaces or newlines. Result is usable with, ex., xargs -0.

</dd>


</dl>

### COMMON OPTIONS
See [<b>dub</b>(1)](dub.md)
## EXIT STATUS

<dl markdown="1">

<dt markdown="1">

<b>0</b>

</dt>
<dd markdown="1">

DUB succeeded

</dd>
<dt markdown="1">

<b>1</b>

</dt>
<dd markdown="1">

usage errors, unknown command line flags

</dd>
<dt markdown="1">

<b>2</b>

</dt>
<dd markdown="1">

package not found, package failed to load, miscellaneous error

</dd>

</dl>

## FILES
<i>dub.sdl</i>, <i>dub.json</i>
## AUTHOR
Copyright (c) 1999-2022 by The D Language Foundation
## ONLINE DOCUMENTATION
[http://code.dlang.org/docs/commandline](http://code.dlang.org/docs/commandline)
## SEE ALSO
[<b>dub</b>(1)](dub.md), [<b>dub-generate</b>(1)](dub-generate.md)
