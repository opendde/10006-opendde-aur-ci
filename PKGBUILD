# Generated by debtap
# Maintainer: tabulatejarl8@gmail.com <TabulateJarl8>
# Maintainer: TurboWafflz <turbowafflz@gmail.com>
pkgname=iicalc
pkgver=2.4.7
pkgrel=1
pkgdesc="An extensible calculator written in Python."
arch=('any')
url="https://gitlab.com/TurboWafflz/ImaginaryInfinity-Calculator"
license=('GPL')
groups=('')
depends=('bash-completion' 'python-pip')
optdepends=("dialog: GUI elements")
makedepends=("binutils" "tar")
conflicts=("iicalc-beta")
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("iicalc-$pkgver.deb::https://gitlab.com/TurboWafflz/ImaginaryInfinity-Calculator/-/jobs/artifacts/development/raw/iicalc.deb?job=debian%20packager")
sha512sums=('758a226710c3192a1f70c146cfca9da9e7db42db6978318540b1e0d86385ff668c6037aa2254995e794f016beb8eda6defe56c800f6727131c7f450298cc1926')

package(){

	# Extract package data
	ar vx iicalc-$pkgver.deb
	tar xf data.tar.xz -C "${pkgdir}"
	rm debian-binary control.tar.xz data.tar.xz
	sed -i -E 's/debian/aur/' ${pkgdir}/usr/share/iicalc/config.ini

}
