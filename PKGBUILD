# Maintainer: Robert Tari <robert at tari dot in>

pkgname="ayatana-indicator-keyboard"
pkgver="0.9.0"
pkgrel="1"
pkgdesc="Ayatana Indicator Keyboard Applet"
arch=("i686" "x86_64" "pentium4")
url="https://github.com/AyatanaIndicators/ayatana-indicator-keyboard"
license=("GPL3")
makedepends=("intltool" "cmake-extras" "systemd" "glib2" "libx11")
depends=("libayatana-common>=0.9.5" "libxklavier" "hicolor-icon-theme")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AyatanaIndicators/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=("5925349e3c06de7b04b5502163cf4acb")

build()
{
    cd ${pkgname}-${pkgver}
    mkdir build
    cd build
    cmake ..
    make
}

package()
{
    cd ${pkgname}-${pkgver}/build
    make DESTDIR="${pkgdir}" install
}

