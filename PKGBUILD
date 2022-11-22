# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=rssnix
pkgver=0.2.1
pkgrel=1
pkgdesc="Unix-style filesystem-based RSS/Atom/JSON Feed fetcher/reader"
arch=('any')
url="https://github.com/jafarlihi/rssnix"
license=('MIT')
makedepends=('git' 'go')
optdepends=('vim: default viewer'
						'ranger: enhanced viewer')
provides=("${pkgname}")
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8bfa1f25d5aaead405a625dc2895686cefdbc3b87efc3bbf39c636b5f40ac571')

build() {
	cd "${srcdir}"/"${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ${pkgname} .
}

package() {
	cd "${srcdir}"/"${pkgname}-${pkgver}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
}
