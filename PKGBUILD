# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgdesc="XDG sound theme for the unexicon distribution"
pkgname=unexicon-sound-theme-git
_pkgname=unexicon-sound-theme
pkgver=0.9.r2.g88c67ee
pkgrel=1
arch=('any')
license=('GPL')
url="https://github.com/bbidulock/${_pkgname}"
groups=('unexicon')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")
depends=('sound-theme-freedesktop' 'sound-theme-smooth' 'linux-a11y-sound-theme')
makedepends=('git' 'pkgconfig' 'flite' 'flite-voices' 'sox')
source=("$pkgname::git://github.com/bbidulock/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
 cd $pkgname
  ./configure
  make
}

package() {
  make -C ${pkgname} DESTDIR="${pkgdir}" install
}

