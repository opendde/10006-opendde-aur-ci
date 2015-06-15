# Maintainer: Albert Berger < nbdspcl at gmail dot com>
pkgname=regd
pkgver=0.4
pkgrel=1
pkgdesc="Registry daemon, information cache and secure credential storage."
arch=('any')
url="https://github.com/nbdsp/regd"
license=('GPL')
groups=()
depends=('python3')
optdepends=('')
makedepends=('')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=("${pkgname}::$url#tag=v0.4")
noextract=()
md5sums=('SKIP')


package() {
	cd "${pkgname}"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 "data/conf.${pkgname}" "$pkgdir/etc/${pkgname}/conf.${pkgname}"
	install -Dm644 "${pkgname}.1" "$pkgdir/usr/share/man/man1/${pkgname}.1"
}
