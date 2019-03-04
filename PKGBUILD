# Maintainer: Robert Tari <robert at tari dot in>

pkgname="mate-ayatana-indicator-applet"
_pkgnameorig="mate-indicator-applet"
pkgver="1.20.1"
pkgrel="1"
pkgdesc="MATE panel Ayatana indicator applet"
arch=("i686" "x86_64")
url="http://www.mate-desktop.org/"
license=("GPL" "GPL2" "GPL3" "LGPL3")
depends=("atk" "glib2" "gtk3" "ayatana-indicator-application" "mate-applets" "libx11" "mate-panel" "ayatana-ido")
makedepends=("intltool" "gtk3" "ayatana-indicator-application" "mate-applets" "libtool" "libx11" "libxml2" "mate-common")
optdepends=("ayatana-indicator-power" "ayatana-indicator-printers" "ayatana-indicator-session" "ayatana-indicator-messages")
source=("https://github.com/mate-desktop/${_pkgnameorig}/archive/v${pkgver}.tar.gz")
md5sums=("d7c3a8e40158331e915fc467049f73ce")
options=("!emptydirs")
provides=("${_pkgnameorig}")
conflicts=("${_pkgnameorig}")

prepare()
{
    cd ${srcdir}/${_pkgnameorig}-${pkgver}
    NOCONFIGURE=1 ./autogen.sh
}

build()
{
    cd ${srcdir}/${_pkgnameorig}-${pkgver}
    ./configure --prefix=/usr --disable-static --libexecdir=/usr/lib --with-ayatana-indicators=yes
    make
}

package()
{
    cd ${srcdir}/${_pkgnameorig}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
