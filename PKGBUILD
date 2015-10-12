pkgname=lib32-qt5-base
pkgver=5.5.0
pkgrel=1
pkgdesc="32bit qt5-base"
arch=('x86_64')
url="http://qt-project.org/"
license=('GPL3' 'LGPL' 'FDL' 'custom')
depends=('qt5-base' 'lib32-libjpeg-turbo' 'lib32-libdbus' 'lib32-fontconfig' 'lib32-systemd' \
         'lib32-libxrender' 'lib32-libxi' 'lib32-sqlite' 'lib32-icu' 'lib32-xcb-util' 'lib32-xcb-util-keysyms' \
         'lib32-xcb-util-wm')
provides=('lib32-qt5-base-bin')
conflicts=('lib32-qt5-base-bin')
source=(https://www.archlinux.org/packages/extra/i686/qt5-base/download/#qt5-base-i686.pkg.tar.xz)
md5sums=('SKIP')
pkgver() {
        cat $srcdir/.PKGINFO | grep -oP '(?<=pkgver = )\d+\.\d+\.\d+'
}
package() {
	mkdir -p ${pkgdir}/usr/lib32/qt5/plugins
	cp -rPf ${srcdir}/usr/lib/lib* ${pkgdir}/usr/lib32
	cp -rPf ${srcdir}/usr/lib/qt/plugins/* ${pkgdir}/usr/lib32/qt5/plugins
}
