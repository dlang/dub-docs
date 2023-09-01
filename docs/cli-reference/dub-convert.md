# dub-convert(1)
dub-convert \- Converts the file format of the package recipe.
## SYNOPSIS
<b>dub convert </b><i>OPTIONS...</i>
## DESCRIPTION
This command will convert between JSON and SDLang formatted package recipe files.



Warning: Beware that any formatting and comments within the package recipe will get lost in the conversion process.
## OPTIONS

<dl>


<dt id="option-convert---b--f-b-b---format-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-convert---b--f-b-b---format-b-i-VALUE-i-"></a>

<b>-f</b>, <b>--format</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Specifies the target package recipe format. Possible values:

  json, sdl

</dd>


<dt id="option-convert---b--s-b-b---stdout-b-" class="option-argname">
<a class="anchor" href="#option-convert---b--s-b-b---stdout-b-"></a>

<b>-s</b>, <b>--stdout</b>

</dt>


<dd markdown="1" class="option-desc">

Outputs the converted package recipe to stdout instead of writing to disk.

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
[<b>dub</b>(1)](dub.md), [<b>dub-add</b>(1)](dub-add.md), [<b>dub-init</b>(1)](dub-init.md)
