# Installing DUB

## Bundled with the compiler

DUB is being distributed alongside with [the major D compilers](https://dlang.org/download.html) whenever installing their full packages.

Once you have a D compiler installed, open the terminal and try running `dub --version` to see if DUB is installed.

## Standalone installation

DUB can be installed separately from the compiler, for example this may be necessary when a package manager is used to install just the compiler or when DUB needs to be updated separately from the compiler to make use of new features.

### Pre-compiled packages

Pre-compiled DUB binaries are available for x86 (32 and 64 bit) machines for Linux, OSX and Windows on the [GitHub DUB releases](https://github.com/dlang/dub/releases). Extract the archive anywhere on your system and make sure the DUB executable is in your path.

### From source

First clone the [dub repository](https://github.com/dlang/dub) from git:

```
git clone https://github.com/dlang/dub.git
```

If you already have another (perhaps older) DUB version installed, you can simply run

```
dub build
```

then, the dub executable will be inside the `bin` folder.

---

If you do not have a previous dub version to bootstrap from, use the `build.d` script in the repository's folder to build dub:

```
rdmd build.d
```

or directly with dmd or ldc:

```
dmd -run build.d
# or
ldc2 -run build.d
# or
gdc build.d && ./a.out
```

## Third-party downloads

These links are not maintained by the same people maintaining the official downloads. 

<div markdown="1" class="install os-arch">

### [Arch Linux](https://wiki.archlinux.org/index.php/D_(programming_language))

```
pacman -S dlang
```

</div>

<div markdown="1" class="install os-gentoo">

### [Gentoo](https://wiki.gentoo.org/wiki/Dlang)

```
layman -f -a dlang
```

</div>

<div markdown="1" class="install os-homebrew">

### [Homebrew](https://formulae.brew.sh/formula/dub)

```
brew install dub
```

</div>

<div markdown="1" class="install os-nix">

### [Nix/NixOS](https://search.nixos.org/packages?show=dub&query=dub)

```
nix-env -iA nixos.dub
```

</div>

<div markdown="1" class="install os-ubuntu">

### Ubuntu/Debian

Using the [APT repository](http://d-apt.sourceforge.net/) also used for the D compilers, you can simply run

```
apt install dub
```

</div>

<div markdown="1" class="install os-opensuse">

### [OpenSUSE Tumbleweed](https://build.opensuse.org/package/show/devel:languages:D/dub)

```
sudo zypper install dub
```

</div>

<div markdown="1" class="install os-snap">

### [Snap](https://snapcraft.io/dub)

```
sudo snap install --classic dub
```

</div>

<div markdown="1" class="install os-openbsd">

### [OpenBSD](https://openports.se/devel/dub)

```
doas pkg_add dub
```

</div>
