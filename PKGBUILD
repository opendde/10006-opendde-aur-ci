# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
pkgname=boxtron-git
_pkgname="${pkgname%-git}"
pkgver=0.5.3.r6.8aa2e4e
pkgrel=2
pkgdesc='Compatibility tool to run DOS games on Steam through native Linux DOSBox'
arch=('i686' 'x86_64')
url="https://github.com/dreamer/$_pkgname"
license=('GPL')
depends=('python' 'dosbox' 'inotify-tools' 'timidity++')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
optdepends=(
  'steam: The Steam client'
  'soundfont-fluid: required for MIDI support, but another soundfont can be used')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

check() {
  cd "$_pkgname"
  make test
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" prefix=/usr install
}
