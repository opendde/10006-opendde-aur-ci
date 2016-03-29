# Maintainer: Remi Casanova <rc.dev@tuxico.com>

pkgname=xcursor-oxygen
pkgver=5.6.0
pkgrel=1

arch=('any')
license=('LGPL')
pkgdesc="Oxygen cursor themes"
url="https://projects.kde.org/projects/kde/workspace/oxygen"

sha256sums=("458eeb0614f075f029ffedb08d71950c5258ad4f6daea0c8cbad89e8a6b27954")
source=("http://download.kde.org/stable/plasma/${pkgver}/oxygen-${pkgver}.tar.xz")

package() {
    install -d -m755 ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/oxygen-${pkgver}/cursors/Oxygen_* ${pkgdir}/usr/share/icons
}

