# Maintainer: Chris Brendel <cdbrendel@gmail.com>
# Python package author: Matthew Honnibal <matt@explosion.ai>
pkgname=python-blis
_origpkgname=cython-blis
pkgver=0.1.0
pkgrel=1
pkgdesc="The Blis linear algebra routines as a self-contained Python C-extension"
arch=("x86_64")
url="https://github.com/explosion/cython-blis"
license=("MIT")
depends=("cython" "python-numpy" "python-pytest" "python-hypothesis")
makedepends=("python-setuptools" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::https://github.com/explosion/cython-blis/archive/v$pkgver.tar.gz")
md5sums=('b36cf1c713d10473be866a16bbe733e3')

prepare() {
    # Change gcc-6 to gcc to avoid that dep. I originally made a patch here,
    # but there is some idiosycracy in Matt's environ that the script seems
    # to require to build properly, and I can't figure out which env it is.
    sed -i -e 's/gcc-6/gcc/g' "$_origpkgname-$pkgver/blis/_src/make/linux-x86_64.jsonl"
}

package() {
    cd "$_origpkgname-$pkgver"
    export BLIS_COMPILER="gcc"
    export BLIS_ARCH="x86_64"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"    
}
