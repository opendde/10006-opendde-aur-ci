# Maintainer: Sree Harsha Totakura <sreeharsha at lastname dot in>

pkgname=kerneloops-git
pkgver=0.12.r28.g64e6bd9
pkgrel=3
pkgdesc="kerneloops client tool for reporting OOPS to http://oops.kernel.org/"
arch=('i686' 'x86_64')
url="http://oops.kernel.org/"
license=('GPL2')
depends=('dbus-glib' 'libnotify' 'gtk2' 'curl')
makedepends=('git')
backup=('etc/kerneloops.conf')
source=("git+https://github.com/oops-kernel-org/kerneloops")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" SBINDIR=/usr/bin
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" SBINDIR=/usr/bin install
}
