# dub-clean(1)
dub-clean \- Removes intermediate build files and cached build results
## SYNOPSIS
<b>dub clean </b>[&lt;<i>package</i>&gt;] <i>OPTIONS...</i>
## DESCRIPTION
This command removes any cached build files of the given package(s). The final target file, as well as any copyFiles are currently not removed.

Without arguments, the package in the current working directory will be cleaned.
## OPTIONS

<dl>


<dt id="option-clean---b---all-packages-b-" class="option-argname">
<a class="anchor" href="#option-clean---b---all-packages-b-"></a>

<b>--all-packages</b>

</dt>


<dd markdown="1" class="option-desc">

Cleans up *all* known packages (dub list)

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
[<b>dub</b>(1)](dub.md), [<b>dub-clean-caches</b>(1)](dub-clean-caches.md), [<b>dub-remove</b>(1)](dub-remove.md)
