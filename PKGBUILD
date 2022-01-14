# Maintainer: Scarecrow928 <yushuaibin999@gmail.com>

pkgname=poi-bin
_pkgname=poi
pkgver=10.7.0
pkgrel=2
pkgdesc="Scalable KanColle browser and tool"
arch=('any')
url="https://github.com/poooi/poi/"
license=('MIT')
provides=("${_pkgname}")
depends=('nss' 'gtk3')
conflicts=('poi')
options=(!strip)
source=("https://github.com/poooi/poi/releases/download/v${pkgver}/${_pkgname}-${pkgver}.7z"
	"${pkgname}.sh")
noextract=("${_pkgname}-${pkgver}.7z")
sha256sums=('a59624a5cb265fe52e5b08b8ed63a8f812a64ab85cdac2c8d3299af0b8f70b4a'
            '1226865a0add6b146ea556c5d02e302ea175bdbbb59530ce9830a1828e18875e')

package() {
	mkdir -p "${pkgdir}/opt/${_pkgname}/"
	bsdtar -xf "${_pkgname}-${pkgver}.7z" -C "${pkgdir}/opt/${_pkgname}/"
	install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
