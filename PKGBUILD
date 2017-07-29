# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>

# I maintain this on github, feel free to submit a pull request to
# https://github.com/soker90/paquetes-archinux.git

pkgname=betcon
pkgver=1.3.5.1
pkgrel=1
pkgdesc="Sports betting management"
url="https://github.com/soker90/betcon"
arch=('any')
license=('GPLv3')
depends=('python' 'python-pyqt5' 'sqlite')
source=('https://github.com/soker90/betcon/archive/1.3.5.1.tar.gz')
md5sums=('eb2a67251401447fc5e0c0536bb2d6b6')

package() {
	mkdir -p ${pkgdir}/usr/share/betcon/default/
	mkdir -p ${pkgdir}/usr/share/betcon/resources/
	mkdir -p ${pkgdir}/usr/share/applications/
	mkdir -p ${pkgdir}/usr/share/pixmaps/
	mkdir -p ${pkgdir}/usr/bin/
	cp -r ${srcdir}/${pkgname}-${pkgver}/src ${pkgdir}/usr/share/betcon/
	cp -r ${srcdir}/${pkgname}-${pkgver}/ui ${pkgdir}/usr/share/betcon/
	cp -r ${srcdir}/${pkgname}-${pkgver}/resources/bookies/ ${pkgdir}/usr/share/betcon/resources/
	cp -r ${srcdir}/${pkgname}-${pkgver}/resources/sports/ ${pkgdir}/usr/share/betcon/resources/
	cp ${srcdir}/${pkgname}-${pkgver}/default/database.sql ${pkgdir}/usr/share/betcon/default/
	cp ${srcdir}/${pkgname}-${pkgver}/resources/betcon.desktop ${pkgdir}/usr/share/applications/
	cp ${srcdir}/${pkgname}-${pkgver}/resources/icon.png ${pkgdir}/usr/share/pixmaps/betcon.png
	cp ${srcdir}/${pkgname}-${pkgver}/resources/betcon ${pkgdir}/usr/bin/
	chmod +x ${pkgdir}/usr/bin/betcon
}
