# Maintainer: Kitsu mail@kitsu.me
pkgname=yofi-git
pkgver=0.1.0.5387c5f
pkgrel=2
pkgdesc="Minimalistic menu for Wayland-based compositors"
arch=('i686' 'x86_64')
url="https://github.com/l4l/yofi"
license=('MIT')
depends=('fontconfig' 'expat' 'graphite' 'pcre' 'wayland-protocols' 'libxkbcommon')
makedepends=('cargo' 'git')
provides=('yofi')
source=("$pkgname::git+https://github.com/l4l/yofi.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.1.0.%s" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/yofi" "$pkgdir/usr/bin/yofi"
}

