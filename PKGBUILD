pkgname='ruffle-git'
_pkgname="ruffle"
pkgver=0.1.0.3210.g7ac53be2
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/ruffle-rs/ruffle"
pkgdesc="A Flash Player emulator written in Rust"
license=('Apache' 'MIT')
depends=('openssl' 'libxcb' 'zlib' 'alsa-lib' 'xz')
makedepends=('rust' 'cargo' 'git' 'libx11' 'python')
provides=('ruffle')
conflicts=('ruffle')
source=("$_pkgname::git+https://github.com/ruffle-rs/ruffle.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname/desktop
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build(){
  cd "$_pkgname/desktop"
  env CARGO_INCREMENTAL=0 cargo build --features="lzma" --release --locked
}

package() {
	cd $_pkgname

	install -D -m755 "target/release/ruffle_desktop" "$pkgdir/usr/bin/ruffle"
}
