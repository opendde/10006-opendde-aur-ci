# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: mosh5382 <arch@moshermail.com>
_name=aiohttp-cors
pkgname=python-aiohttp-cors
pkgver=0.5.0
pkgrel=1
pkgdesc="aiohttp_cors library implements Cross Origin Resource Sharing (CORS) support for aiohttp"
arch=('i686' 'x86_64')
url="https://github.com/aio-libs/aiohttp-cors"
license=('Apache')
depends=('python>=3.4.1' 'python-aiohttp')
makedepends=('python-setuptools')
options=('!emptydirs')
source=("https://github.com/aio-libs/aiohttp-cors/archive/v0.5.0.tar.gz")
md5sums=('b1bd2d631c66d61f739765ffdad19125')

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
}
