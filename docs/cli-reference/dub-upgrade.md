# dub-upgrade(1)
dub-upgrade \- Forces an upgrade of the dependencies
## SYNOPSIS
<b>dub upgrade </b>[&lt;<i>packages...</i>&gt;] <i>OPTIONS...</i>
## DESCRIPTION
Upgrades all dependencies of the package by querying the package registry(ies) for new versions.



This will update the versions stored in the selections file (dub.selections.json) accordingly.



If one or more package names are specified, only those dependencies will be upgraded. Otherwise all direct and indirect dependencies of the root package will get upgraded.
## OPTIONS

<dl>


<dt id="option-upgrade---b---prerelease-b-" class="option-argname">
<a class="anchor" href="#option-upgrade---b---prerelease-b-"></a>

<b>--prerelease</b>

</dt>


<dd markdown="1" class="option-desc">

Uses the latest pre-release version, even if release versions are available

</dd>


<dt id="option-upgrade---b--s-b-b---sub-packages-b-" class="option-argname">
<a class="anchor" href="#option-upgrade---b--s-b-b---sub-packages-b-"></a>

<b>-s</b>, <b>--sub-packages</b>

</dt>


<dd markdown="1" class="option-desc">

Also upgrades dependencies of all directory based sub packages

</dd>


<dt id="option-upgrade---b---verify-b-" class="option-argname">
<a class="anchor" href="#option-upgrade---b---verify-b-"></a>

<b>--verify</b>

</dt>


<dd markdown="1" class="option-desc">

Updates the project and performs a build. If successful, rewrites the selected versions file <to be implemented>.

</dd>


<dt id="option-upgrade---b---dry-run-b-" class="option-argname">
<a class="anchor" href="#option-upgrade---b---dry-run-b-"></a>

<b>--dry-run</b>

</dt>


<dd markdown="1" class="option-desc">

Only print what would be upgraded, but don't actually upgrade anything.

</dd>


<dt id="option-upgrade---b---missing-only-b-" class="option-argname">
<a class="anchor" href="#option-upgrade---b---missing-only-b-"></a>

<b>--missing-only</b>

</dt>


<dd markdown="1" class="option-desc">

Performs an upgrade only for dependencies that don't yet have a version selected. This is also done automatically before each build.

</dd>


<dt id="option-upgrade---b---force-remove-b-" class="option-argname">
<a class="anchor" href="#option-upgrade---b---force-remove-b-"></a>

<b>--force-remove</b>

</dt>


<dd markdown="1" class="option-desc">

Deprecated option that does nothing.

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
[<b>dub</b>(1)](dub.md)
