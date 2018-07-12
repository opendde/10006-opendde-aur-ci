# Maintainer: Markus Richter <mqus at disroot dot org>

pkgname=bitwarden_rs-git
_pkgbase=bitwarden_rs
pkgver=r166.470ad14
pkgrel=1
pkgdesc="An unofficial lightweight implementation of the bitwarden-server using rust and sqlite. Does NOT include the web-interface."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/dani-garcia/bitwarden_rs"
license=('GPL3')
groups=()
makedepends=('rust-nightly' 'cargo-nightly')
depends=('openssl')
provides=("$_pkgbase") 
conflicts=("$_pkgbase" "${_pkgbase}-vault-git" "${_pkgbase}-vault") 
replaces=()
backup=()
options=()
install=bitwarden_rs.install
source=('git+https://github.com/dani-garcia/bitwarden_rs.git'
	"${_pkgbase}.install"
	"${_pkgbase}.service"
	"0001-Disable-Vault.patch")
noextract=()
sha512sums=('SKIP'
            'ea6ac7d915887078d7e091b99d53f2ee6fbf11ad5a80e04309263e7b06ce43de6e90e69ad62e3c99eaf81f825aebe930bf45888041225a156d74f324dfa10578'
            '773dc0830b4eaf3a1d4134a52a6157e6a94265c6212ae8cc24b9584f9c444b9a0f822325f487ce9c23c363f743f1f64f269352f030e98e336816aee0a68048f6'
            '704057f0bf6d71ab9888378c3d66ee97c5019e8b18d0f22f93615fef60bef7df80a11ad7ebf5cca1cc49c90ba3f9d84515a160555e395790f325510f8a81f5cd')


pkgver() {
	cd "$srcdir/$_pkgbase"
	( set -o pipefail
	    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	#build bitwarden_rs
	cd "$srcdir/$_pkgbase"
	patch -N -i "$srcdir/0001-Disable-Vault.patch"
	cargo build --release
}

package() {
	# setup systemd service
	install -D -m 0644 "$srcdir/bitwarden_rs.service" "$pkgdir/usr/lib/systemd/system/bitwarden_rs.service"
	# copy default config file
	install -D -m 0644 "$srcdir/$_pkgbase/.env" "$pkgdir/etc/bitwarden_rs.env"
	# copy binary
	install -D -m0755 "$srcdir/$_pkgbase/target/release/bitwarden_rs" "$pkgdir/usr/bin/bitwarden_rs"
}
