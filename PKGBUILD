pkgname=uftrace-git
pkgver=0.8+13.g4a9b1ed
pkgrel=1
pkgdesc="Function (graph) tracer for user-space"
arch=(x86_64)
url="https://github.com/namhyung/uftrace"
license=('GPL2')
provides=("uftrace=${pkgver%+*}")
conflicts=('uftrace')
source=("git+$url")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir"/uftrace
  git describe --long --tags --abbrev=7 | sed 's/^v//; s/-/+/; s/-/\./'
}

build() {
  cd "$srcdir"/uftrace
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/uftrace
  make DESTDIR="$pkgdir/" install
}
