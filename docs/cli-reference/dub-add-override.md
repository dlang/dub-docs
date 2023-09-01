# dub-add-override(1)
dub-add-override \- Adds a new package override.
## SYNOPSIS
<b>dub add-override </b>&lt;<i>package</i>&gt; &lt;<i>version-spec</i>&gt; &lt;<i>target-path/target-version</i>&gt; <i>OPTIONS...</i>
## DESCRIPTION

## OPTIONS

<dl>


<dt id="option-add-override---b---system-b-" class="option-argname">
<a class="anchor" href="#option-add-override---b---system-b-"></a>

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
[<b>dub</b>(1)](dub.md), [<b>dub-list-overrides</b>(1)](dub-list-overrides.md), [<b>dub-remove-override</b>(1)](dub-remove-override.md)
