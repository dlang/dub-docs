# dub-lint(1)
dub-lint \- Executes the linter tests of the selected package
## SYNOPSIS
<b>dub lint </b>[&lt;<i>package</i>&gt;[@&lt;<i>version-spec</i>&gt;]] <i>OPTIONS...</i>
[-- <<i>application arguments...</i>>]
## DESCRIPTION
Builds the package and executes D-Scanner linter tests.
## OPTIONS

<dl>


<dt id="option-lint---b---syntax-check-b-" class="option-argname">
<a class="anchor" href="#option-lint---b---syntax-check-b-"></a>

<b>--syntax-check</b>

</dt>


<dd markdown="1" class="option-desc">

Lexes and parses sourceFile, printing the line and column number of any syntax errors to stdout.

</dd>


<dt id="option-lint---b---style-check-b-" class="option-argname">
<a class="anchor" href="#option-lint---b---style-check-b-"></a>

<b>--style-check</b>

</dt>


<dd markdown="1" class="option-desc">

Lexes and parses sourceFiles, printing the line and column number of any static analysis check failures stdout.

</dd>


<dt id="option-lint---b---error-format-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-lint---b---error-format-b-i-VALUE-i-"></a>

<b>--error-format</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Format errors produced by the style/syntax checkers.

</dd>


<dt id="option-lint---b---report-b-" class="option-argname">
<a class="anchor" href="#option-lint---b---report-b-"></a>

<b>--report</b>

</dt>


<dd markdown="1" class="option-desc">

Generate a static analysis report in JSON format.

</dd>


<dt id="option-lint---b---report-format-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-lint---b---report-format-b-i-VALUE-i-"></a>

<b>--report-format</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Specifies the format of the generated report.

</dd>


<dt id="option-lint---b---report-file-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-lint---b---report-file-b-i-VALUE-i-"></a>

<b>--report-file</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Write report to file.

</dd>


<dt id="option-lint---b---import-paths-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-lint---b---import-paths-b-i-VALUE-i-"></a>

<b>--import-paths</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Import paths

</dd>


<dt id="option-lint---b---config-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-lint---b---config-b-i-VALUE-i-"></a>

<b>--config</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Use the given configuration file.

</dd>


<dt id="option-lint---b--b-b-b---build-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-lint---b--b-b-b---build-b-i-VALUE-i-"></a>

<b>-b</b>, <b>--build</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Specifies the type of build to perform. Note that setting the DFLAGS environment variable will override the build type with custom flags.

Possible names:

  debug, plain, release, release-debug, release-nobounds, unittest, profile, profile-gc, docs, ddox, cov, cov-ctfe, unittest-cov, unittest-cov-ctfe, syntax and custom types

</dd>


<dt id="option-lint---b--c-b-b---config-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-lint---b--c-b-b---config-b-i-VALUE-i-"></a>

<b>-c</b>, <b>--config</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Builds the specified configuration. Configurations can be defined in dub.json

</dd>


<dt id="option-lint---b---override-config-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-lint---b---override-config-b-i-VALUE-i-"></a>

<b>--override-config</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Uses the specified configuration for a certain dependency. Can be specified multiple times.

Format: --override-config=<dependency>/<config>

</dd>


<dt id="option-lint---b---compiler-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-lint---b---compiler-b-i-VALUE-i-"></a>

<b>--compiler</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Specifies the compiler binary to use (can be a path).

Arbitrary pre- and suffixes to the identifiers below are recognized (e.g. ldc2 or dmd-2.063) and matched to the proper compiler type:

  dmd, gdc, ldc, gdmd, ldmd

</dd>


<dt id="option-lint---b--a-b-b---arch-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-lint---b--a-b-b---arch-b-i-VALUE-i-"></a>

<b>-a</b>, <b>--arch</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Force a different architecture (e.g. x86 or x86_64)

</dd>


<dt id="option-lint---b--d-b-b---debug-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-lint---b--d-b-b---debug-b-i-VALUE-i-"></a>

<b>-d</b>, <b>--debug</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Define the specified debug version identifier when building - can be used multiple times

</dd>


<dt id="option-lint---b---nodeps-b-" class="option-argname">
<a class="anchor" href="#option-lint---b---nodeps-b-"></a>

<b>--nodeps</b>

</dt>


<dd markdown="1" class="option-desc">

Do not resolve missing dependencies before building

</dd>


<dt id="option-lint---b---build-mode-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-lint---b---build-mode-b-i-VALUE-i-"></a>

<b>--build-mode</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Specifies the way the compiler and linker are invoked. Valid values:

  separate (default), allAtOnce, singleFile

</dd>


<dt id="option-lint---b---single-b-" class="option-argname">
<a class="anchor" href="#option-lint---b---single-b-"></a>

<b>--single</b>

</dt>


<dd markdown="1" class="option-desc">

Treats the package name as a filename. The file must contain a package recipe comment.

</dd>


<dt id="option-lint---b---force-remove-b-" class="option-argname">
<a class="anchor" href="#option-lint---b---force-remove-b-"></a>

<b>--force-remove</b>

</dt>


<dd markdown="1" class="option-desc">

Deprecated option that does nothing.

</dd>


<dt id="option-lint---b---filter-versions-b-" class="option-argname">
<a class="anchor" href="#option-lint---b---filter-versions-b-"></a>

<b>--filter-versions</b>

</dt>


<dd markdown="1" class="option-desc">

[Experimental] Filter version identifiers and debug version identifiers to improve build cache efficiency.

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
[<b>dub</b>(1)](dub.md), [<b>dub-dustmite</b>(1)](dub-dustmite.md), [<b>dub-test</b>(1)](dub-test.md)
