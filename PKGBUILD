# Maintainer: Serene-Arc <https://aur.archlinux.org/account/serene-arc>

_pkgname="bulk-downloader-for-reddit"
pkgname=python-bdfr
pkgver=2.3.0
pkgrel=1
pkgdesc="Bulk downloader for Reddit"
arch=('any')
url="https://github.com/aliparlakci/bulk-downloader-for-reddit"
depends=('python' 'python-setuptools')
makedepends=()
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aliparlakci/bulk-downloader-for-reddit/archive/refs/tags/v2.3.0.tar.gz")
md5sums=('3da354979837d37f20b3465d2d13a552')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
