# Maintainer: PaddiM8 <paddim8@pm.me>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Moritz Maxeiner <moritz@ucworks.org>
# Contributor: Stefan-Husmann@t-online.de
# Contributor: Army

pkgname=dunst-notif-log-git
_pkgname=dunst-pl
pkgver=autogenerated
pkgrel=1
pkgdesc="Dunst with notification logging."
arch=('i686' 'x86_64' 'armv7h')
license=('BSD')
depends=('libxinerama' 'libxss' 'pango' 'libnotify' 'gdk-pixbuf2' 'libxdg-basedir' 'libxrandr')
makedepends=('git' 'perl')
provides=('dunst' 'notification-daemon' 'dunstify')
conflicts=('dunst' 'dunstify')
source=('git+https://github.com/paddim8/dunst-pl')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 dunstify
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  install -Dm755 dunstify "${pkgdir}"/usr/bin/dunstify
  install -Dm755 contrib/dunst_espeak.sh "${pkgdir}"/usr/bin/dunst_espeak.sh
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
