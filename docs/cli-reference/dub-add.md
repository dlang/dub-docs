# dub-add(1)
dub-add \- Adds dependencies to the package file.
## SYNOPSIS
<b>dub add </b>&lt;<i>package</i>&gt;[@&lt;<i>version-spec</i>&gt;] [&lt;<i>packages...</i>&gt;] <i>OPTIONS...</i>
## DESCRIPTION
Adds &lt;packages&gt; as dependencies.



Running "dub add &lt;package&gt;" is the same as adding &lt;package&gt; to the "dependencies" section in dub.json/dub.sdl.

If no version is specified for one of the packages, dub will query the registry for the latest version.
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
[<b>dub</b>(1)](dub.md), [<b>dub-convert</b>(1)](dub-convert.md), [<b>dub-fetch</b>(1)](dub-fetch.md), [<b>dub-init</b>(1)](dub-init.md)
