# Maintainer: Lukky513 <lukky513 (a t) gmail (d o t) com>
pkgname=zatikon
pkgver=1.003
pkgrel=1
pkgdesc='Turn-based board strategy game inspired by chess, made by Chronic Logic'
arch=('any')
url="http://www.zatikon.com"
license=('custom:ZatikonEULA')
depends=('java-environment'
         'hicolor-icon-theme'
         'sh')
install=('zatikon.install')
source=('http://s159260531.onlinehome.us/demos/zatikon-jars.tar.xz')

package() {
    _gamedir=${pkgdir}/opt/${pkgname}

    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

	for jarname in zatikon sound art; do
		install -Dm644 ${jarname}.jar ${_gamedir}/${jarname}.jar
	done
	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}

    for size in 16x16 32x32 48x48 64x64 128x128; do
        install -Dm644 icons/${pkgname}_${size}.png ${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgname}.png
    done
    install -Dm644 icons/${pkgname}_128x128.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

	install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}

md5sums=('350bb59935be7613908bb082e0c35250')
sha256sums=('3f97c4c9ced74fd5f71e7ef06cca8d8b6032193a9ff28c09659fb2832e129e57')
