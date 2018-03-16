pkgname=synapse-rs-git
_pkgname="synapse"
pkgdesc="Synapse BitTorrent Daemon."
pkgver=0.1.0.699
pkgrel=1
arch=("x86_64")
conflicts=("synapse-rs")
provides=("synapse-rs")
url='https://github.com/luminarys/synapse.git'
license=('ISC')
depends=("openssl" "pkg-config" "gcc" "c-ares")
optdepends=()
makedepends=("git" "cargo")
source=("git://github.com/luminarys/synapse.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD)
}

build() {
	cd $_pkgname
	cargo build --release --all
}

package() {
	cd $_pkgname
	install -D -m755 "$srcdir/$_pkgname/target/release/synapse" "$pkgdir/usr/bin/synapse-rs"
	install -D -m755 "$srcdir/$_pkgname/target/release/sycli" "$pkgdir/usr/bin/sycli"
	install -D -m755 "$srcdir/$_pkgname/example_config.toml" "$pkgdir/usr/share/synapse/example_config.toml"
}
