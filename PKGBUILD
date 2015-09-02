# Maintainer: Lucki <Lucki at holarse-linuxgaming dot de>

pkgname=opsu
pkgver=0.11.0
pkgrel=2
pkgdesc="An open source osu!-client written in Java."
arch=('any')
url="https://itdelatrisu.github.io/opsu/"
license=('GPL3')
changelog=.CHANGELOG
depends=('java-runtime' 'bash')
makedepends=('java-environment' 'java-web-start' 'gradle' 'gendesk' 'git')
provides=('opsu')
conflicts=('opsu')
source=( ${pkgname}::git://github.com/itdelatrisu/opsu.git#tag=${pkgver}
         opsu.sh )
sha512sums=('SKIP'
            '4b065052fef55e1860a51dfa5af080930b1001e4c82cd8b3b0383bd68b239d382d788408235a7cb4fb4a1d04123a6049188a2e2c2d0e5fd08a3deb69da25fc2d')

pkgver()
{
	cd "${srcdir}/${pkgname}"
	git describe --tags | sed 's/-.*//'
}

prepare()
{
	# generate .desktop-file
	gendesk -n -f --pkgname ${pkgname} --pkgdesc "$pkgdesc" --name "opsu!" --exec "${pkgname}" --categories "Game"
}

build()
{
	cd "${srcdir}/${pkgname}"
	gradle jar -PXDG=true
}

package()
{
	install -Dm644 "${srcdir}/${pkgname}/build/libs/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
	install -Dm644 "${srcdir}/${pkgname}/res/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
