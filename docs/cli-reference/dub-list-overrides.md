# dub-list-overrides(1)
dub-list-overrides \- Prints a list of all local package overrides
## SYNOPSIS
<b>dub list-overrides </b><i>OPTIONS...</i>
## DESCRIPTION
Prints a list of all overridden packages added via "dub add-override".
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
[<b>dub</b>(1)](dub.md), [<b>dub-add-override</b>(1)](dub-add-override.md), [<b>dub-remove-override</b>(1)](dub-remove-override.md)
