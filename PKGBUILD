# Generated by debtap
# Maintainer: tabulatejarl8@gmail.com <TabulateJarl8>
# Maintainer: TurboWafflz <turbowafflz@gmail.com>
pkgname=iicalc
pkgver=2.4.5
pkgrel=1
pkgdesc="An extensible calculator written in Python."
arch=('any')
url=""
license=('APLG-3.0')
groups=('')
depends=('bash-completion' 'python-pip')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("iicalc-$pkgver.deb::https://gitlab.com/TurboWafflz/ImaginaryInfinity-Calculator/-/jobs/artifacts/development/raw/iicalc.deb?job=debian%20packager")
sha512sums=('95a456e227a4a073ff3604c51d9d90f977745dd704e03a479f0125645b8495498bd0da1b3b774bfa744902d557f2fb33fffc2c155f1b3cb2f4cf7fdcda8ff610')

package(){

	# Extract package data
	ar vx iicalc-$pkgver.deb
	tar xf data.tar.xz -C "${pkgdir}"
	rm debian-binary control.tar.xz data.tar.xz

}
