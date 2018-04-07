# Maintainer: mosh5382 <arch@moshermail.com>
_name=aiohttp-cors
pkgname=python-aiohttp-cors
pkgver=0.7.0
pkgrel=1
pkgdesc="Implements Cross Origin Resource Sharing (CORS) support for aiohttp"
arch=('any')
url="https://github.com/aio-libs/aiohttp-cors"
license=('Apache')
depends=('python>=3.5' 'python-aiohttp')
makedepends=('python-setuptools')
options=('!emptydirs')
source=("https://github.com/aio-libs/aiohttp-cors/archive/v${pkgver}.tar.gz")
md5sums=('df27226eb1d3e5c238bb0f25838201a6')

package() {
	cd "$srcdir/$_name-${pkgver}"
	python setup.py install --root="${pkgdir}/" --optimize=1
}
