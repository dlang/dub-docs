# dub-search(1)
dub-search \- Search for available packages.
## SYNOPSIS
<b>dub search </b>&lt;<i>query</i>&gt; <i>OPTIONS...</i>
## DESCRIPTION
Search all specified DUB registries for packages matching query.
## OPTIONS

<dl>


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
[<b>dub</b>(1)](dub.md), [<b>dub-list</b>(1)](dub-list.md)
