# Maintainer: spikecodes <19519553+spikecodes@users.noreply.github.com>
pkgname=ox-bin
_pkgname=${pkgname%-bin}
pkgver=0.2.3
pkgrel=1
pkgdesc="An independent Rust text editor that runs in your terminal!"
arch=(x86_64)
url="https://github.com/curlpipe/ox"
license=("GPLv2")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${url}/releases/download/${pkgver}/${_pkgname}")
sha256sums=("SKIP")

package() {
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
