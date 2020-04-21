# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Mopi <mopi@dotslashplay.it>

pkgname=play.it-git
pkgver=2.11.1.r849.g1a4d6b0e
pkgrel=1
pkgdesc="Easy way to install games on Linux - git version"
arch=('any')
url="https://wiki.dotslashplay.it"
license=('BSD')
depends=('bash')
makedepends=('pandoc')
provides=('play.it')
conflicts=('play.it')
optdepends=(
  'imagemagick: to convert images between formats'
  'libarchive: to extract various archive formats'
  'icoutils: to manipulate Windows icon files'
  'innoextract: to extract some Windows installers'
  'unzip: to extract some archives'
)
source=(play.it::"git+https://forge.dotslashplay.it/play.it/scripts.git")
sha1sums=('SKIP')

pkgver() {
  cd play.it
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd play.it
  make
}

package() {
  cd play.it
  make DESTDIR="$pkgdir"/ prefix=/usr bindir=/usr/bin datadir=/usr/share install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

