# Maintainer: Jack O'Connor <oconnor663@gmail.com>

# NOTE: This PKGBUILD is generated and pushed by Keybase's release automation.
# Any changes made in aur.archlinux.org git repos will get overwritten. See
# https://github.com/keybase/client/tree/master/packaging/linux/arch.

pkgname=keybase-git
pkgdesc='the Keybase Go client, filesystem, and GUI'
license=('BSD')
url='https://keybase.io'
pkgver=1.0.26+15067.b095a794e
pkgver() {
  "$srcdir/client/packaging/linux/arch/keybase_git_version.sh"
}
pkgrel=1
arch=('i686' 'x86_64')
depends=(fuse gconf libxss gtk2) # don't change this without changing the SRCINFO template too
makedepends=(go yarn npm git rsync)
# keybase-release is a deprecated AUR package
conflicts=(keybase keybase-release keybase-bin)
source=(
  'git+https://github.com/keybase/client'
  'git+https://github.com/keybase/kbfs'
)
md5sums=('SKIP' 'SKIP')
install=keybase.install

build() {
  if [ "$CARCH" = "i686" ] ; then
    export KEYBASE_SKIP_64_BIT=1
  elif [ "$CARCH" = "x86_64" ] ; then
    export KEYBASE_SKIP_32_BIT=1
  else
    echo "Unknown arch: $CARCH"
    exit 1
  fi

  "$srcdir/client/packaging/linux/build_binaries.sh" prerelease "$srcdir/build_dir"
}

package() {
  if [ "$CARCH" = "i686" ] ; then
    deb_arch="i386"
  elif [ "$CARCH" = "x86_64" ] ; then
    deb_arch="amd64"
  else
    echo "Unknown arch: $CARCH"
    exit 1
  fi

  cp -r "$srcdir/build_dir/binaries/$deb_arch"/* "$pkgdir"
}
