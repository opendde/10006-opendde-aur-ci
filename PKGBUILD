# Submitter: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Maintainer: Zren <zrenfire@gmail.com>

pkgname=plasma5-applets-eventcalendar
pkgver=72
pkgrel=1
pkgdesc="An extended calendar plasmoid with daily weather forecasts and events from Google Calendar. Also includes a timer and 24 hour forecast graph."
arch=('any')
url="https://store.kde.org/p/998901/"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects' 'python-gobject' 'libcanberra')
makedepends=('bash' 'gettext')
source=("https://github.com/Zren/plasma-applet-eventcalendar/archive/v$pkgver.tar.gz")
md5sums=('8dd371433ca2c1132aea678e9d69e9df')

package() {
    cd plasma-applet-eventcalendar-$pkgver/package

    mkdir -p $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.eventcalendar
    cp -r * $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.eventcalendar

    cd $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.eventcalendar/translate
    sh ./build
    mkdir -p $pkgdir/usr/share/locale
    mv $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.eventcalendar/contents/locale $pkgdir/usr/share/
    rm -rf $pkgdir/usr/share/plasma/plasmoids/org.kde.plasma.eventcalendar/translate
}

