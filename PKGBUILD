# Maintainer: Supdrewin <https://github.com/supdrewin>

pkgname=batterycm-switcher
pkgver=1.0.0
pkgrel=1
pkgdesc="An advanced Ideapad Laptops conservation mode adjustment tool"
arch=('any')

url="https://github.com/supdrewin/batterycm-switcher"
license=('GPL3')

depends=('bash' 'coreutils' 'man-db' 'polkit' 'vim')
makedepends=('git' 'gzip' 'make' 'xz')
optdepends=(
  'acpid: For enable use function key to switch mode'
  'espeak: For enable show status using voice'
  'systemd: For optional function key backend service'
)

provides=('batterycm' 'batterycm-switcher')
conflicts=('batterycm' 'batterycm-switcher')

install=batterycm.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
