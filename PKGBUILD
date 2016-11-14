# Maintainer: Mario Cianciolo <mr.udda at gmail dot com>
# Co-maintainer: Michael Kogan <michael.kogan at gmx dot net>

# This file is automatically generated from multiload-ng source.

pkgname='multiload-ng-indicator-gtk2'
pkgdesc='Modern graphical system monitor, AppIndicator plugin'
pkgver=1.4.2
pkgrel=2

makedepends=('intltool')
depends=('gtk2>=2.20.0' 'cairo' 'libappindicator-gtk2>=0.4.92')

conflicts=('multiload-ng-indicator-gtk3' 'multiload-ng-indicator-gtk2-git' 'multiload-ng-indicator-gtk3-git')

source=("https://github.com/udda/multiload-ng/archive/v$pkgver.tar.gz")
md5sums=('3c17d8483bc874b20c877a7d7897ab5e')

arch=('i686' 'x86_64')
url='https://udda.github.io/multiload-ng/'
license=('GPL2')

build() {
    cd "multiload-ng-$pkgver"
    ./autogen.sh
    ./configure --prefix=/usr --with-gtk=2.0 --without-awn --with-indicator --without-lxpanel --without-mate --without-standalone --without-systray --without-xfce4
    make
} 

package() {
    cd "multiload-ng-$pkgver"
    make DESTDIR="$pkgdir" install
}
