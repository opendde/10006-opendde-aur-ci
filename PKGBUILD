# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Automatically generated by pip2arch on 02-04-2018

pkgname=python-download-npo
_module='download-npo'
pkgver=2.9
pkgrel=1
pkgdesc="download videos from the Dutch npo.nl site."
url="http://arp242.net/code/download-npo"
depends=('python')
makedepends=('python3')
license=('MIT')
arch=('any')
source=('https://pypi.python.org/packages/23/cc/586465c1ac371cfbde35e2cc2a4cf3bee79745df2cd4ac110e61ffeba21e/download-npo-2.9.tar.gz')
md5sums=('054c34cfda96a96da1452d2806e39c2b')

build() {
    cd "$srcdir/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_module}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
