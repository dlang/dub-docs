# dub-add-path(1)
dub-add-path \- Adds a default package search path
## SYNOPSIS
<b>dub add-path </b>&lt;<i>path</i>&gt; <i>OPTIONS...</i>
## DESCRIPTION
Adds a default package search path. All direct sub folders of this path will be searched for package descriptions and will be made available as packages. Using this command has the equivalent effect as calling 'dub add-local' on each of the sub folders manually.



Any packages registered using add-path will be preferred over packages downloaded from the package registry when searching for dependencies during a build operation.



The version of the packages will be determined by one of the following:

  - For GIT working copies, the last tag (git describe) is used to determine the version

  - If the package contains a "version" field in the package description, this is used

  - If neither of those apply, "~master" is assumed
## OPTIONS

<dl>


<dt id="option-add-path---b---system-b-" class="option-argname">
<a class="anchor" href="#option-add-path---b---system-b-"></a>

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
[<b>dub</b>(1)](dub.md), [<b>dub-remove-path</b>(1)](dub-remove-path.md)
