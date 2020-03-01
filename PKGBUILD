# Maintainer: robertfoster

_pkgname=indy
pkgname=python-${_pkgname}
pkgver=1.14.2
pkgrel=1
pkgdesc="Official wrapper for Hyperledger Indy library"
arch=(i686 x86_64)
url="https://github.com/hyperledger/indy-sdk"
license=('APACHE')
depends=('libindy')
makedepends=('python')
source=("https://github.com/hyperledger/indy-sdk/archive/v$pkgver.tar.gz")

package() {
    cd $srcdir/indy-sdk-$pkgver
    cd wrappers/python
    python setup.py install -O1 --root="$pkgdir"
}

md5sums=('427fb49e2f3b5bc176968b0744fd2b3c')
