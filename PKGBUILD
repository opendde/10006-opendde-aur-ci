# Maintainer: mosh5382 <arch@moshermail.com>
_name=aiohttp-cors
pkgname=python-aiohttp-cors
pkgver=0.5.3
pkgrel=2
pkgdesc="Implements Cross Origin Resource Sharing (CORS) support for aiohttp"
arch=('any')
url="https://github.com/aio-libs/aiohttp-cors"
license=('Apache')
depends=('python>=3.4.1' 'python-aiohttp')
makedepends=('python-setuptools')
options=('!emptydirs')
source=("https://github.com/aio-libs/aiohttp-cors/archive/v0.5.3.tar.gz")
md5sums=('db3dc7335ae4352d7b9c82a52857ada6')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
