# Maintainer: mosh5382 <arch@moshermail.com>
_name=aiohttp-cors
pkgname=python-aiohttp-cors
pkgver=0.6.0
pkgrel=1
pkgdesc="Implements Cross Origin Resource Sharing (CORS) support for aiohttp"
arch=('any')
url="https://github.com/aio-libs/aiohttp-cors"
license=('Apache')
depends=('python>=3.4.1' 'python-aiohttp')
makedepends=('python-setuptools')
options=('!emptydirs')
source=("https://github.com/aio-libs/aiohttp-cors/archive/v0.6.0.tar.gz")
md5sums=('c8ebcd1caaecbc546bba994b135e23a0')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
