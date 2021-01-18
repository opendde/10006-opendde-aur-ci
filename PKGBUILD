# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='bandwhich'
pkgname="${_pkgname}-git"
pkgver=0.20.0.r4.gacd1b0a
pkgrel=1
pkgdesc='Terminal bandwidth utilization tool'
arch=('x86_64')
url='https://github.com/imsnif/bandwhich'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_pkgname}"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
	cd "${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin" "target/release/${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" "docs/${_pkgname}.1"
  install -Dm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
