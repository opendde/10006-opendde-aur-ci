# Maintainer: Aaron J Graves <linux@ajgraves.com>
pkgname=criptext-bin
pkgver=0.17.12
pkgrel=1
pkgdesc='Official Criptext encrypted email client'
arch=('x86_64')
url='https://criptext.com/'
license=('GPL2')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=(!strip)
_destimage="Criptext-latest.AppImage"
_srcimage="Criptext-${pkgver}.AppImage"
source=("https://cdn.criptext.com/Criptext-Email-Desktop/linux/${_srcimage}")
noextract=("${_srcimage}")
sha512sums=('464629933fcf2b2fe92201a96fe893baa111ff980dee1440245b5bba26fe15b2c7d53b0b43ef5427306d286e8b8a007a4eda2f3f9d018b37caafdafe09f74030')

package() {
	install -Dpm755 "${_srcimage}" "${pkgdir}/opt/${pkgname}/${_destimage}"
	install -d "${pkgdir}/usr/local/bin"
	ln -s "../../../opt/${pkgname}/${_destimage}" "${pkgdir}/usr/local/bin/criptext"
}

