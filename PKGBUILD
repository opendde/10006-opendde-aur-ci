# Maintainer: Hsiu-Ming Chang <cges30901 at gmail dot com>
pkgname=hmtimer
pkgver=2.3.1
pkgrel=1
pkgdesc="graphical shutdown timer"
arch=('i686' 'x86_64')
url="https://sites.google.com/site/hsiumingstimer/"
license=('GPL3')
groups=()
depends=('qt5-base' 'qt5-multimedia' 'hicolor-icon-theme')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="$pkgname.install"
changelog=
source=("https://sourceforge.net/projects/hsiumingstimer/files/hmtimer-$pkgver/hmtimer-$pkgver-src.tar.bz2")
noextract=()
md5sums=('0e7d11111a590a47bfb3793a118fc6c9')

build() {
  cd "$pkgname-$pkgver"
  qmake
  make
}

package() {
  cd "$pkgname-$pkgver"

  install -D -m0755 hmtimer/hmtimer $pkgdir/usr/bin/hmtimer
  install -D -m0644 hmtimer/language/hmtimer_zh_TW.qm $pkgdir/usr/share/hmtimer/hmtimer_zh_TW.qm
  install -D -m0644 hmtimer/language/hmtimer_ar.qm $pkgdir/usr/share/hmtimer/hmtimer_ar.qm
  install -D -m0644 hmtimer/language/hmtimer_ru.qm $pkgdir/usr/share/hmtimer/hmtimer_ru.qm
  install -D -m0644 hmtimer.desktop $pkgdir/usr/share/applications/hmtimer.desktop
  install -D -m0644 hmtimer/hmtimer.png $pkgdir/usr/share/icons/hicolor/128x128/apps/hmtimer.png
  install -D -m0644 hmtimer/hmtimer48.png $pkgdir/usr/share/icons/hicolor/48x48/apps/hmtimer.png
}
