# Maintainer: mosh5382 <arch@moshermail.com>
_name=aiohttp-cors
pkgname=python-aiohttp-cors
pkgver=0.5.2
pkgrel=1
pkgdesc="Implements Cross Origin Resource Sharing (CORS) support for aiohttp"
arch=('i686' 'x86_64')
url="https://github.com/aio-libs/aiohttp-cors"
license=('Apache')
depends=('python>=3.4.1' 'python-aiohttp')
makedepends=('python-setuptools')
options=('!emptydirs')
source=("https://github.com/aio-libs/aiohttp-cors/archive/v0.5.2.tar.gz")
md5sums=('2d4dce25483bba75a9c1021b4c9b2a73')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
