# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=nitrofs
pkgver=0.9.11
pkgrel=1
pkgdesc="Library for Nintendo DS homebrew development aka 'libfilesystem'"
arch=('any')
url="http://www.devkitpro.org"
license=('unknown')
depends=('libfat-nds')
options=(!strip staticlibs)
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/libfilesystem-src-$pkgver.tar.bz2")
sha256sums=('b997856bf528230aba4004820f4b320dae659e7532537a4589e7d2f0f6b4e659')

build() {
  source /etc/profile.d/devkitarm.sh
  make
}

package() {
  export DEVKITPRO="$pkgdir/opt/devkitpro"

  install -d "$DEVKITPRO"/libnds/{include,lib}
  make install
}
