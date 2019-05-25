# Contributor: twa022 <twa022 at gmail dot com>

pkgname=superpaper
pkgver=1.1.2
pkgrel=1
pkgdesc="Cross-platform multi monitor wallpaper manager"
arch=('any')
url="https://github.com/hhannine/Superpaper"
license=('MIT')
depends=('python-pillow' 'python-screeninfo' 'python-wxpython' 'python-system_hotkey')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hhannine/${pkgname^}/archive/v${pkgver}.tar.gz"
       'write_to_confdir.patch')
sha256sums=('a564d52cb1b4194de2b1563d9273fec7ea4a7969e6b2b1ff91701e8038c34dfa'
            '869aafccfd75f514bf0956bc32df419e4dc7c49c5c11dd8f057e9aebd8ab6e52')

prepare() {
  cd "${srcdir}/${pkgname^}-${pkgver}"
  patch -uNp2 -r- -i ../write_to_confdir.patch
}

package() {
	mkdir -p "${pkgdir}"/usr/{bin,lib,share/applications}
	cp -ar "${srcdir}/${pkgname^}-${pkgver}" "${pkgdir}"/usr/lib/"${pkgname}"

	cat > "${pkgdir}"/usr/bin/"${pkgname}" <<- __EOF__
		#!/bin/bash

		python /usr/lib/superpaper/superpaper.pyw
		exit $?
	__EOF__
	chmod +x "${pkgdir}"/usr/bin/"${pkgname}"

	cat > "${pkgdir}"/usr/share/applications/"${pkgname}".desktop <<- __EOF__
		[Desktop Entry]
		Version=1.0
		Type=Application
		Name=Superpaper
		Comment=$pkgdesc
		Exec=/usr/bin/$pkgname
		Icon=/usr/lib/superpaper/resources/icons8-panorama-filled-96.png
		Categories=Utilities;
		Terminal=false
		StartupNotify=false
	__EOF__

	install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${pkgname^}-${pkgver}/LICENSE"
}
