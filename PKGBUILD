# Maintainer: Arthur Vuillard <arthur@hashbang.fr>
pkgname=tidy-html5
name=tidy-html5
pkgver=5.1.25
pkgrel=2
pkgdesc="A tool to tidy down your HTML5 code to a clean style"
url="https://github.com/htacg/tidy-html5"
license=('custom')
arch=('i686' 'x86_64')
depends=()
makedepends=('git' 'cmake')
provides=('tidy' 'tidyhtml')
conflicts=('tidy-html5-git' 'tidyhtml')
source=(https://github.com/htacg/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('5fd96deef635ab8cea3dc74079f54d95')

build() {
  cd "$srcdir/$name-$pkgver/build/cmake"
  cmake ../.. -DCMAKE_INSTALL_PREFIX=$pkgdir/usr
  make
}

package() {
  cd "$srcdir/$name-$pkgver/build/cmake"
  make install
  install -Dm644 $srcdir/$name-$pkgver/README/LICENSE.md $pkgdir/usr/share/licenses/$name/LICENSE.md
  install -Dm644 $srcdir/$name-$pkgver/README/LICENSE.txt $pkgdir/usr/share/licenses/$name/LICENSE.txt
} 
