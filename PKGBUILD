# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
pkgname=hashdeep
pkgver=4.4
pkgrel=2
pkgdesc="cross-platform tools to computer hashes, or message digests, for any number of files"
arch=('i686' 'x86_64')
url="https://github.com/jessek/hashdeep"
license=('GPL')
source=(git+https://github.com/jessek/hashdeep#commit=b88a659572925e748115bdc3f4f64cacf15f2061)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/^v//; s/-/.r/; s/-/./'
}

prepare() {
  cd "$srcdir/$pkgname"
  ./bootstrap.sh
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

# EOF
