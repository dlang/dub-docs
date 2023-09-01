# `$DUB_HOME`

!!! note "Work-in-Progress Documentation"

    The content on this page is not yet fully finished.

    Tracking issue: <https://github.com/WebFreak001/dub-docs-v2/issues/11>

WIP synposis: can be used by users to override where DUB places downloaded global content. Linux distro package maintainers may ship DUB with a system dub settings file that changes the global value to some non-writable path. There exists `$DPATH` as well for user installations, which is used as `$DPATH/dub` in case `$DUB_HOME` is not set.

`$DPATH` may be used by all D applications to store their user-wide D application files, such as installed compilers, DUB, packages, etc.
