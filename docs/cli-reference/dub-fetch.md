# dub-fetch(1)
dub-fetch \- Manually retrieves and caches a package
## SYNOPSIS
<b>dub fetch </b>&lt;<i>package</i>&gt;[@&lt;<i>version-spec</i>&gt;] <i>OPTIONS...</i>
## DESCRIPTION
Note: Use "dub add &lt;dependency&gt;" if you just want to use a certain package as a dependency, you don't have to explicitly fetch packages.



Explicit retrieval/removal of packages is only needed when you want to put packages in a place where several applications can share them. If you just have a dependency to add, use the `add` command. Dub will do the rest for you.



Without specified options, placement/removal will default to a user wide shared location.



Complete applications can be retrieved and run easily by e.g.

$ dub fetch vibelog --cache=local

$ dub run vibelog --cache=local



This will grab all needed dependencies and compile and run the application.
## OPTIONS

<dl>


<dt id="option-fetch---b---version-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-fetch---b---version-b-i-VALUE-i-"></a>

<b>--version</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Use the specified version/branch instead of the latest available match

The remove command also accepts "*" here as a wildcard to remove all versions of the package from the specified location

</dd>


<dt id="option-fetch---b---force-remove-b-" class="option-argname">
<a class="anchor" href="#option-fetch---b---force-remove-b-"></a>

<b>--force-remove</b>

</dt>


<dd markdown="1" class="option-desc">

Deprecated option that does nothing

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
[<b>dub</b>(1)](dub.md), [<b>dub-add</b>(1)](dub-add.md)
