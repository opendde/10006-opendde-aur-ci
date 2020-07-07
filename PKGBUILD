# Maintainer: Sebastiaan de Schaetzen <sebastiaan.de.schaetzen@gmail.com>
pkgname=jack-editor
pkgver=1.1.1064
pkgrel=1
pkgdesc="J.A.C.K. is a brand new level editor for games with a quake-style BSP architecture."
arch=("x86_64")
url=""
license=('GPL')
depends=()
makedepends=()
source=("jackhammer.run ::http://jack.hlfx.ru/en/download_jackhammer_linux64.html")
sha256sums=("f2d02affd843a0d3191b45096435d7bcd7b2cf0d9d55ff3bc6094b732f41a4fa")

build() {
	chmod +x jackhammer.run
	./jackhammer.run --noexec --keep
}

package() {
	mv -f linux_x64 jack
	rm -f jack/install.sh
	mv -f jack/Jack.desktop .
	mkdir -p ${pkgdir}/opt
	cp -rv jack ${pkgdir}/opt
	install -D -m644 Jack.desktop ${pkgdir}/usr/share/applications/Jack.desktop
}
