# Generated by debtap
# Maintainer: tabulatejarl8@gmail.com <TabulateJarl8>
# Maintainer: TurboWafflz <turbowafflz@gmail.com>
pkgname=iicalc
pkgver=2.4.6
pkgrel=1
pkgdesc="An extensible calculator written in Python."
arch=('any')
url=""
license=('GPL')
groups=('')
depends=('bash-completion' 'python-pip')
optdepends=("dialog: GUI elements")
makedepends=("binutils" "tar")
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("iicalc-$pkgver.deb::https://gitlab.com/TurboWafflz/ImaginaryInfinity-Calculator/-/jobs/artifacts/development/raw/iicalc.deb?job=debian%20packager")
sha512sums=('058feb918274a0cb091c76f2eaba8709acb4af1545580559f293de80c7eea7b9cc98460ad2b0629349ebaa013262904ffce30b182a37a2d2041b4ac5058403ab')

package(){

	# Extract package data
	ar vx iicalc-$pkgver.deb
	tar xf data.tar.xz -C "${pkgdir}"
	rm debian-binary control.tar.xz data.tar.xz
	sed -i -E 's/debian/aur/' ${pkgdir}/usr/share/iicalc/config.ini

}
