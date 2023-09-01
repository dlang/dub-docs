# dub-remove-path(1)
dub-remove-path \- Removes a package search path
## SYNOPSIS
<b>dub remove-path </b>&lt;<i>path</i>&gt; <i>OPTIONS...</i>
## DESCRIPTION
Removes a package search path previously added with add-path.
## OPTIONS

<dl>


<dt id="option-remove-path---b---system-b-" class="option-argname">
<a class="anchor" href="#option-remove-path---b---system-b-"></a>

<b>--system</b>

</dt>


<dd markdown="1" class="option-desc">

Register system-wide instead of user-wide

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
[<b>dub</b>(1)](dub.md), [<b>dub-add-path</b>(1)](dub-add-path.md)
