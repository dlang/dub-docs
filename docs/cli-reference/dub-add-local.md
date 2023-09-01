# dub-add-local(1)
dub-add-local \- Adds a local package directory (e.g. a git repository)
## SYNOPSIS
<b>dub add-local </b>&lt;<i>path</i>&gt; [&lt;<i>version</i>&gt;] <i>OPTIONS...</i>
## DESCRIPTION
Adds a local package directory to be used during dependency resolution. This command is useful for registering local packages, such as GIT working copies, that are either not available in the package registry, or are supposed to be overwritten.



The version of the package is either determined automatically (see the "add-path" command, or can be explicitly overwritten by passing a version on the command line.



See 'dub add-path -h' for a way to register multiple local packages at once.
## OPTIONS

<dl>


<dt id="option-add-local---b---system-b-" class="option-argname">
<a class="anchor" href="#option-add-local---b---system-b-"></a>

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
[<b>dub</b>(1)](dub.md), [<b>dub-remove-local</b>(1)](dub-remove-local.md)
