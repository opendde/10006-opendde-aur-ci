# Maintainer: Gerard Ribugent <ribugent <at> gmail <dot> com>
pkgname=nodejs-leapp-cli
_pkgname=${pkgname#nodejs-}
pkgver=0.1.25
pkgrel=1
pkgdesc="Leapp's Command Line Interface."
arch=('any')
url="https://www.npmjs.com/package/@noovolari/leapp-cli"
license=('MPL2')
makedepends=('npm')
depends=('leapp' 'nodejs')
source=("https://registry.npmjs.org/@noovolari/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('88c469d6c0952b8d4816f7278e524746b30240cb8d43db67574ea00512cc7b19')

package() {
	npm install -g --cache "$srcdir/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
	chown -R root:root "${pkgdir}"
}
