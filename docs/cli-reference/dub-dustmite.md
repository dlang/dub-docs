# dub-dustmite(1)
dub-dustmite \- Create reduced test cases for build errors
## SYNOPSIS
<b>dub dustmite </b>&lt;<i>destination-path</i>&gt; <i>OPTIONS...</i>
[-- <<i>application arguments...</i>>]
## DESCRIPTION
This command uses the Dustmite utility to isolate the cause of build errors in a DUB project.



It will create a copy of all involved packages and run dustmite on this copy, leaving a reduced test case.



Determining the desired error condition is done by checking the compiler/linker status code, as well as their output (stdout and stderr combined). If --program-status or --program-regex is given and the generated binary is an executable, it will be executed and its output will also be incorporated into the final decision.
## OPTIONS

<dl>


<dt id="option-dustmite---b---compiler-status-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-dustmite---b---compiler-status-b-i-VALUE-i-"></a>

<b>--compiler-status</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

The expected status code of the compiler run

</dd>


<dt id="option-dustmite---b---compiler-regex-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-dustmite---b---compiler-regex-b-i-VALUE-i-"></a>

<b>--compiler-regex</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

A regular expression used to match against the compiler output

</dd>


<dt id="option-dustmite---b---linker-status-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-dustmite---b---linker-status-b-i-VALUE-i-"></a>

<b>--linker-status</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

The expected status code of the linker run

</dd>


<dt id="option-dustmite---b---linker-regex-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-dustmite---b---linker-regex-b-i-VALUE-i-"></a>

<b>--linker-regex</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

A regular expression used to match against the linker output

</dd>


<dt id="option-dustmite---b---program-status-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-dustmite---b---program-status-b-i-VALUE-i-"></a>

<b>--program-status</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

The expected status code of the built executable

</dd>


<dt id="option-dustmite---b---program-regex-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-dustmite---b---program-regex-b-i-VALUE-i-"></a>

<b>--program-regex</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

A regular expression used to match against the program output

</dd>


<dt id="option-dustmite---b---test-package-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-dustmite---b---test-package-b-i-VALUE-i-"></a>

<b>--test-package</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Perform a test run - usually only used internally

</dd>


<dt id="option-dustmite---b---combined-b-" class="option-argname">
<a class="anchor" href="#option-dustmite---b---combined-b-"></a>

<b>--combined</b>

</dt>


<dd markdown="1" class="option-desc">

Builds multiple packages with one compiler run

</dd>


<dt id="option-dustmite---b---no-redirect-b-" class="option-argname">
<a class="anchor" href="#option-dustmite---b---no-redirect-b-"></a>

<b>--no-redirect</b>

</dt>


<dd markdown="1" class="option-desc">

Don't redirect stdout/stderr streams of the test command

</dd>


<dt id="option-dustmite---b---strategy-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-dustmite---b---strategy-b-i-VALUE-i-"></a>

<b>--strategy</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Set strategy (careful/lookback/pingpong/indepth/inbreadth)

</dd>


<dt id="option-dustmite---b--j-b-" class="option-argname">
<a class="anchor" href="#option-dustmite---b--j-b-"></a>

<b>-j</b>

</dt>


<dd markdown="1" class="option-desc">

Set number of look-ahead processes

</dd>


<dt id="option-dustmite---b---trace-b-" class="option-argname">
<a class="anchor" href="#option-dustmite---b---trace-b-"></a>

<b>--trace</b>

</dt>


<dd markdown="1" class="option-desc">

Save all attempted reductions to DIR.trace

</dd>


<dt id="option-dustmite---b--b-b-b---build-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-dustmite---b--b-b-b---build-b-i-VALUE-i-"></a>

<b>-b</b>, <b>--build</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Specifies the type of build to perform. Note that setting the DFLAGS environment variable will override the build type with custom flags.

Possible names:

  debug, plain, release, release-debug, release-nobounds, unittest, profile, profile-gc, docs, ddox, cov, cov-ctfe, unittest-cov, unittest-cov-ctfe, syntax and custom types

</dd>


<dt id="option-dustmite---b--c-b-b---config-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-dustmite---b--c-b-b---config-b-i-VALUE-i-"></a>

<b>-c</b>, <b>--config</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Builds the specified configuration. Configurations can be defined in dub.json

</dd>


<dt id="option-dustmite---b---override-config-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-dustmite---b---override-config-b-i-VALUE-i-"></a>

<b>--override-config</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Uses the specified configuration for a certain dependency. Can be specified multiple times.

Format: --override-config=<dependency>/<config>

</dd>


<dt id="option-dustmite---b---compiler-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-dustmite---b---compiler-b-i-VALUE-i-"></a>

<b>--compiler</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Specifies the compiler binary to use (can be a path).

Arbitrary pre- and suffixes to the identifiers below are recognized (e.g. ldc2 or dmd-2.063) and matched to the proper compiler type:

  dmd, gdc, ldc, gdmd, ldmd

</dd>


<dt id="option-dustmite---b--a-b-b---arch-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-dustmite---b--a-b-b---arch-b-i-VALUE-i-"></a>

<b>-a</b>, <b>--arch</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Force a different architecture (e.g. x86 or x86_64)

</dd>


<dt id="option-dustmite---b--d-b-b---debug-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-dustmite---b--d-b-b---debug-b-i-VALUE-i-"></a>

<b>-d</b>, <b>--debug</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Define the specified debug version identifier when building - can be used multiple times

</dd>


<dt id="option-dustmite---b---nodeps-b-" class="option-argname">
<a class="anchor" href="#option-dustmite---b---nodeps-b-"></a>

<b>--nodeps</b>

</dt>


<dd markdown="1" class="option-desc">

Do not resolve missing dependencies before building

</dd>


<dt id="option-dustmite---b---build-mode-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-dustmite---b---build-mode-b-i-VALUE-i-"></a>

<b>--build-mode</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Specifies the way the compiler and linker are invoked. Valid values:

  separate (default), allAtOnce, singleFile

</dd>


<dt id="option-dustmite---b---single-b-" class="option-argname">
<a class="anchor" href="#option-dustmite---b---single-b-"></a>

<b>--single</b>

</dt>


<dd markdown="1" class="option-desc">

Treats the package name as a filename. The file must contain a package recipe comment.

</dd>


<dt id="option-dustmite---b---force-remove-b-" class="option-argname">
<a class="anchor" href="#option-dustmite---b---force-remove-b-"></a>

<b>--force-remove</b>

</dt>


<dd markdown="1" class="option-desc">

Deprecated option that does nothing.

</dd>


<dt id="option-dustmite---b---filter-versions-b-" class="option-argname">
<a class="anchor" href="#option-dustmite---b---filter-versions-b-"></a>

<b>--filter-versions</b>

</dt>


<dd markdown="1" class="option-desc">

[Experimental] Filter version identifiers and debug version identifiers to improve build cache efficiency.

</dd>


</dl>

### COMMON OPTIONS
See [<b>dub</b>(1)](dub.md)
## EXIT STATUS
Forwards the exit code from <b>dustmite</b>(1)
## FILES
<i>dub.sdl</i>, <i>dub.json</i>
## AUTHOR
Copyright (c) 1999-2022 by The D Language Foundation
## ONLINE DOCUMENTATION
[http://code.dlang.org/docs/commandline](http://code.dlang.org/docs/commandline)
## SEE ALSO
[<b>dub</b>(1)](dub.md), [<b>dub-lint</b>(1)](dub-lint.md), [<b>dub-test</b>(1)](dub-test.md), <b>dustmite</b>(1)
