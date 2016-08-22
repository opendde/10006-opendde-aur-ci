# Maintainer: David Manouchehri <manouchehri@riseup.net>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: veox <veox at wemakethings dot net>

_gitname='pulseview'
pkgname="${_gitname}-git"
pkgver=0.3.0.r86.g55547a4
pkgrel=1
pkgdesc="A Qt based logic analyzer GUI for sigrok. (git version)"
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="http://sigrok.org/wiki/Main_Page"
license=('GPL3')
depends=('libsigrok-git' 'libsigrokdecode-git' 'qt5-base' 'boost-libs' 'qt5-svg')
makedepends=('git' 'cmake' 'boost')
conflicts=("${_gitname}")
provides=("${_gitname}")
source=("git://sigrok.org/${_gitname}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long | sed 's/^pulseview-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_gitname}"

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_CXX_FLAGS=-fext-numeric-literals .
  make
}

package() {
  cd "${srcdir}/${_gitname}"

  make DESTDIR="${pkgdir}" PREFIX=/usr install
  install -Dm644 contrib/pulseview.desktop "${pkgdir}/usr/share/applications/pulseview.desktop"
}
