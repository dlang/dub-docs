# dub-run(1)
dub-run \- Builds and runs a package (default command)
## SYNOPSIS
<b>dub run </b>[&lt;<i>package</i>&gt;[@&lt;<i>version-spec</i>&gt;]] <i>OPTIONS...</i>
[-- <<i>application arguments...</i>>]
## DESCRIPTION
Builds and runs a package (uses the main package in the current working directory by default)
## OPTIONS

<dl>


<dt id="option-run---b---temp-build-b-" class="option-argname">
<a class="anchor" href="#option-run---b---temp-build-b-"></a>

<b>--temp-build</b>

</dt>


<dd markdown="1" class="option-desc">

Builds the project in the temp folder if possible.

</dd>


<dt id="option-run---b---rdmd-b-" class="option-argname">
<a class="anchor" href="#option-run---b---rdmd-b-"></a>

<b>--rdmd</b>

</dt>


<dd markdown="1" class="option-desc">

Use rdmd instead of directly invoking the compiler

</dd>


<dt id="option-run---b--f-b-b---force-b-" class="option-argname">
<a class="anchor" href="#option-run---b--f-b-b---force-b-"></a>

<b>-f</b>, <b>--force</b>

</dt>


<dd markdown="1" class="option-desc">

Forces a recompilation even if the target is up to date

</dd>


<dt id="option-run---b--y-b-b---yes-b-" class="option-argname">
<a class="anchor" href="#option-run---b--y-b-b---yes-b-"></a>

<b>-y</b>, <b>--yes</b>

</dt>


<dd markdown="1" class="option-desc">

Automatic yes to prompts. Assume "yes" as answer to all interactive prompts.

</dd>


<dt id="option-run---b--n-b-b---non-interactive-b-" class="option-argname">
<a class="anchor" href="#option-run---b--n-b-b---non-interactive-b-"></a>

<b>-n</b>, <b>--non-interactive</b>

</dt>


<dd markdown="1" class="option-desc">

Don't enter interactive mode.

</dd>


<dt id="option-run---b--b-b-b---build-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-run---b--b-b-b---build-b-i-VALUE-i-"></a>

<b>-b</b>, <b>--build</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Specifies the type of build to perform. Note that setting the DFLAGS environment variable will override the build type with custom flags.

Possible names:

  debug, plain, release, release-debug, release-nobounds, unittest, profile, profile-gc, docs, ddox, cov, cov-ctfe, unittest-cov, unittest-cov-ctfe, syntax and custom types

</dd>


<dt id="option-run---b--c-b-b---config-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-run---b--c-b-b---config-b-i-VALUE-i-"></a>

<b>-c</b>, <b>--config</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Builds the specified configuration. Configurations can be defined in dub.json

</dd>


<dt id="option-run---b---override-config-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-run---b---override-config-b-i-VALUE-i-"></a>

<b>--override-config</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Uses the specified configuration for a certain dependency. Can be specified multiple times.

Format: --override-config=<dependency>/<config>

</dd>


<dt id="option-run---b---compiler-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-run---b---compiler-b-i-VALUE-i-"></a>

<b>--compiler</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Specifies the compiler binary to use (can be a path).

Arbitrary pre- and suffixes to the identifiers below are recognized (e.g. ldc2 or dmd-2.063) and matched to the proper compiler type:

  dmd, gdc, ldc, gdmd, ldmd

</dd>


<dt id="option-run---b--a-b-b---arch-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-run---b--a-b-b---arch-b-i-VALUE-i-"></a>

<b>-a</b>, <b>--arch</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Force a different architecture (e.g. x86 or x86_64)

</dd>


<dt id="option-run---b--d-b-b---debug-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-run---b--d-b-b---debug-b-i-VALUE-i-"></a>

<b>-d</b>, <b>--debug</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Define the specified debug version identifier when building - can be used multiple times

</dd>


<dt id="option-run---b---nodeps-b-" class="option-argname">
<a class="anchor" href="#option-run---b---nodeps-b-"></a>

<b>--nodeps</b>

</dt>


<dd markdown="1" class="option-desc">

Do not resolve missing dependencies before building

</dd>


<dt id="option-run---b---build-mode-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-run---b---build-mode-b-i-VALUE-i-"></a>

<b>--build-mode</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Specifies the way the compiler and linker are invoked. Valid values:

  separate (default), allAtOnce, singleFile

</dd>


<dt id="option-run---b---single-b-" class="option-argname">
<a class="anchor" href="#option-run---b---single-b-"></a>

<b>--single</b>

</dt>


<dd markdown="1" class="option-desc">

Treats the package name as a filename. The file must contain a package recipe comment.

</dd>


<dt id="option-run---b---force-remove-b-" class="option-argname">
<a class="anchor" href="#option-run---b---force-remove-b-"></a>

<b>--force-remove</b>

</dt>


<dd markdown="1" class="option-desc">

Deprecated option that does nothing.

</dd>


<dt id="option-run---b---filter-versions-b-" class="option-argname">
<a class="anchor" href="#option-run---b---filter-versions-b-"></a>

<b>--filter-versions</b>

</dt>


<dd markdown="1" class="option-desc">

[Experimental] Filter version identifiers and debug version identifiers to improve build cache efficiency.

</dd>


<dt id="option-run---b---combined-b-" class="option-argname">
<a class="anchor" href="#option-run---b---combined-b-"></a>

<b>--combined</b>

</dt>


<dd markdown="1" class="option-desc">

Tries to build the whole project in a single compiler run.

</dd>


<dt id="option-run---b---print-builds-b-" class="option-argname">
<a class="anchor" href="#option-run---b---print-builds-b-"></a>

<b>--print-builds</b>

</dt>


<dd markdown="1" class="option-desc">

Prints the list of available build types

</dd>


<dt id="option-run---b---print-configs-b-" class="option-argname">
<a class="anchor" href="#option-run---b---print-configs-b-"></a>

<b>--print-configs</b>

</dt>


<dd markdown="1" class="option-desc">

Prints the list of available configurations

</dd>


<dt id="option-run---b---print-platform-b-" class="option-argname">
<a class="anchor" href="#option-run---b---print-platform-b-"></a>

<b>--print-platform</b>

</dt>


<dd markdown="1" class="option-desc">

Prints the identifiers for the current build platform as used for the build fields in dub.json

</dd>


<dt id="option-run---b---parallel-b-" class="option-argname">
<a class="anchor" href="#option-run---b---parallel-b-"></a>

<b>--parallel</b>

</dt>


<dd markdown="1" class="option-desc">

Runs multiple compiler instances in parallel, if possible.

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
[<b>dub</b>(1)](dub.md), [<b>dub-build</b>(1)](dub-build.md), [<b>dub-test</b>(1)](dub-test.md), <b>rdmd</b>(1)
