# Maintainer: nbebaw
pkgname=boostchanger-py
pkgver=0.0
pkgrel=4
pkgdesc="Tray application to controlling CPU Turbo boost"
arch=('any')
url="https://github.com/nbebaw/boostchanger-py"
license=('MIT')
makedepends=('python' 'git' 'tar')
source=("https://github.com/nbebaw/boostchanger-py/releases/download/v$pkgver.$pkgrel/boost_changer-$pkgver.$pkgrel.tar.gz")
md5sums=('SKIP')

prepare() {
	pkgverOLD=0.0.3
	if [ -d ${pkgdir}/opt/boostchanger-v$pkgver.$pkgrel ]; then
		rm -r ${pkgdir}/opt/boostchanger-v$pkgverOLD
		rm ${pkgdir}/usr/bin/boostchanger-py
		rm ${pkgdir}/usr/share/applications/boostchanger-py.desktop
		rm ${pkgdir}/usr/share/pixmaps/boostchanger-py.png
	fi
	tar -xvf boost_changer-$pkgver.$pkgrel.tar.gz
}

package() {
	mkdir -p ${pkgdir}/opt
	mkdir -p ${pkgdir}/home/$SUDO_USER/.config/autostart
	cp -r boost_changer-$pkgver.$pkgrel/src ${pkgdir}/opt
	mv ${pkgdir}/opt/src ${pkgdir}/opt/boostchanger-v$pkgver.$pkgrel
	install -Dm755 boost_changer-$pkgver.$pkgrel/build/boostchanger-py.sh ${pkgdir}/usr/bin/boostchanger-py
	install -Dm644 boost_changer-$pkgver.$pkgrel/build/boostchanger-py.desktop ${pkgdir}/usr/share/applications/boostchanger-py.desktop
	install -Dm644 boost_changer-$pkgver.$pkgrel/build/boostchanger-py.png ${pkgdir}/usr/share/pixmaps/boostchanger-py.png
	cp boost_changer-$pkgver.$pkgrel/build/boostchanger-py.desktop ${pkgdir}/home/$SUDO_USER/.config/autostart
	chown $SUDO_USER:$SUDO_USER ${pkgdir}/home/$SUDO_USER/.config/autostart/boostchanger-py.desktop
	rm -r boost_changer-$pkgver.$pkgrel
	rm boost_changer-$pkgver.$pkgrel.tar.gz
}
