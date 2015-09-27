# Maintainer: jerry73204 <jerry73204@gmail.com>
# Created by Gillen Dan

pkgname=fred
pkgver=0.1.1
pkgrel=7
pkgdesc="Digital forensics tool for viewing and reporting on Windows registry files"
arch=("i686" "x86_64")
url="https://www.pinguin.lu/fred"
license=("GPL3")
depends=("qt4" "hivex")
makedepends=("qtwebkit" "qt4" "hivex")
conflicts=("${pkgname}")
source=("http://files.pinguin.lu/${pkgname}-${pkgver}.tar.gz")
md5sums=('fdc7ea67a83f2632f2de662f254c9708')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  qmake-qt4 fred.pro
  make
}

package() {
# Binary
  install -D ${srcdir}/${pkgname}-${pkgver}/${pkgname}  ${pkgdir}/usr/bin/${pkgname} || return 1

# .desktop file and icon
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/resources/${pkgname}.desktop" \
	  "${pkgdir}/usr/share/applications/${pkgname}.desktop" || return 1
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/resources/${pkgname}.png" \
	  "${pkgdir}/usr/share/pixmaps/${pkgname}.png" || return 1
}
