# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetwebcontrol
pkgver=2.0.0.RC8.b3
pkgrel=1
pkgdesc="Official web interface for Duet electronics"
arch=('any')
url="https://github.com/chrishamm/DuetWebControl"
license=('GPL3')
provides=('duetwebcontrol')
conflicts=('duetwebcontrol')
source=("https://chrishamm.io/debian/dists/buster/dsf/binary-armhf/duetwebcontrol_2.0.0-3.deb")
sha256sums=('ab5e49ec7acf36f6e7bedfad3889504264e86ac24be6a73b6934658edbc702c6')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}/opt/dsf/dwc2"
	cp -R "${srcdir}/opt/dsf/dwc2/"* "${pkgdir}/opt/dsf/dwc2"
}
