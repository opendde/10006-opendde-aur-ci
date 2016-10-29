# Maintainer: aksr <aksr at t-com dot me>
pkgname=aerc-git
pkgver=r183.fef5146
pkgrel=1
epoch=
pkgdesc="Asynchronous email client for your terminal"
arch=('i686' 'x86_64')
url="https://github.com/SirCmpwn/aerc"
license=('MIT')
categories=()
groups=()
depends=('termbox' 'openssl')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=${pkgname}.install
source=("$pkgname::git+https://github.com/SirCmpwn/aerc.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir/" install
  install -Dm644 ../README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  mkdir -p $pkgdir/usr/share/doc/${pkgname%-*}/config
  install -m644 ../config/* "$pkgdir/usr/share/doc/${pkgname%-*}/config"
  install -Dm644 ../LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

