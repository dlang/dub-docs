# dub-init(1)
dub-init \- Initializes an empty package skeleton
## SYNOPSIS
<b>dub init </b>[&lt;<i>directory</i>&gt; [&lt;<i>dependency</i>&gt;...]] <i>OPTIONS...</i>
[-- <<i>application arguments...</i>>]
## DESCRIPTION
Initializes an empty package of the specified type in the given directory. By default, the current working directory is used.
## OPTIONS

<dl>


<dt id="option-init---b--t-b-b---type-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-init---b--t-b-b---type-b-i-VALUE-i-"></a>

<b>-t</b>, <b>--type</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Set the type of project to generate. Available types:



minimal - simple "hello world" project (default)

vibe.d  - minimal HTTP server based on vibe.d

deimos  - skeleton for C header bindings

custom  - custom project provided by dub package

</dd>


<dt id="option-init---b--f-b-b---format-b-i-VALUE-i-" class="option-argname">
<a class="anchor" href="#option-init---b--f-b-b---format-b-i-VALUE-i-"></a>

<b>-f</b>, <b>--format</b>=<i>VALUE</i>

</dt>


<dd markdown="1" class="option-desc">

Sets the format to use for the package description file. Possible values:

  json (default), sdl

</dd>


<dt id="option-init---b--n-b-b---non-interactive-b-" class="option-argname">
<a class="anchor" href="#option-init---b--n-b-b---non-interactive-b-"></a>

<b>-n</b>, <b>--non-interactive</b>

</dt>


<dd markdown="1" class="option-desc">

Don't enter interactive mode.

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
[<b>dub</b>(1)](dub.md), [<b>dub-add</b>(1)](dub-add.md), [<b>dub-convert</b>(1)](dub-convert.md)
