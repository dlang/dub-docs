# dub-remove(1)
dub-remove \- Removes a cached package
## SYNOPSIS
<b>dub remove </b>&lt;<i>package</i>&gt;[@&lt;<i>version-spec</i>&gt;] <i>OPTIONS...</i>
## DESCRIPTION
Removes a package that is cached on the local system.
## OPTIONS

<dl>


<dt id="option-remove---b---version-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-remove---b---version-b-i-VALUE-i-"></a>

<b>--version</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Use the specified version/branch instead of the latest available match

The remove command also accepts "*" here as a wildcard to remove all versions of the package from the specified location

</dd>


<dt id="option-remove---b---force-remove-b-" class="option-argname">
<a class="anchor" href="#option-remove---b---force-remove-b-"></a>

<b>--force-remove</b>

</dt>


<dd markdown="1" class="option-desc">

Deprecated option that does nothing

</dd>


<dt id="option-remove---b--n-b-b---non-interactive-b-" class="option-argname">
<a class="anchor" href="#option-remove---b--n-b-b---non-interactive-b-"></a>

<b>-n</b>, <b>--non-interactive</b>

</dt>


<dd markdown="1" class="option-desc">

Don't enter interactive mode.

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
[<b>dub</b>(1)](dub.md), [<b>dub-clean</b>(1)](dub-clean.md), [<b>dub-clean-caches</b>(1)](dub-clean-caches.md)
