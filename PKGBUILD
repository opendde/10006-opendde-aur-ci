# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfdesktop
pkgname=${_pkgname}-devel
pkgver=4.13.3
pkgrel=1
pkgdesc="A desktop manager for Xfce"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui>=4.13' 'libxfce4util>=4.13' 'exo' 'thunar>=1.7.0' 'garcon>=0.6.0' 'hicolor-icon-theme' 'libwnck3>=3.14')
makedepends=('intltool')
conflicts=('xfce4-menueditor' "${_pkgname}")
provides=("${_pkgname}=${pkgver}")
replaces=('xfce4-menueditor')
options=('!libtool')
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('80f7f28ef17638fe1cf4481db694731c208785a56b6c840005202f9c2db238f5')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-thunarx \
    --enable-notifications \
    --disable-debug
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
