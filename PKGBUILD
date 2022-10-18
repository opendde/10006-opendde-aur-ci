# Maintainer: Berke Enercan <berkeenercan@tutanota.com>

pkgname=ytsub-git
_pkgname=ytsub
pkgver=v0.3.1.r0.ga950632
pkgrel=1

pkgdesc='A subscriptions only TUI Youtube client that uses the Invidious API'
url='https://github.com/sarowish/ytsub'
arch=('x86_64')
license=('GPL3')
depends=('sqlite')
optdepends=('mpv: for playing videos', 'yt-dlp: for playing videos')
makedepends=('git' 'cargo')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/sarowish/ytsub')
sha256sums=('SKIP')
options=('!lto')

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$_pkgname"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}

