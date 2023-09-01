# dub-list(1)
dub-list \- Prints a list of all or selected local packages dub is aware of
## SYNOPSIS
<b>dub list </b>[&lt;<i>package</i>&gt;[@&lt;<i>version-spec</i>&gt;]] <i>OPTIONS...</i>
## DESCRIPTION
Prints a list of all or selected local packages. This includes all cached packages (user or system wide), all packages in the package search paths ("dub add-path") and all manually registered packages ("dub add-local"). If package specified output filtered by package spec.
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
[<b>dub</b>(1)](dub.md), [<b>dub-search</b>(1)](dub-search.md)
