# former Maintainer python-dill: Antony Lee
# former Maintainer python2-dill: bchretien

pkgname=("python-dill" "python2-dill")
pkgbase=python-dill
pkgver=0.2.8.2
pkgrel=1
pkgdesc='Serialize all of python (almost)'
arch=('any')
url='http://pypi.python.org/pypi/dill/'
makedepends=('python-setuptools' 'python2-setuptools')
license=('BSD')
source=("https://github.com/uqfoundation/dill/archive/dill-$pkgver.tar.gz" "python2-dill.install")
md5sums=('a08ad17ce84b413be78f17cb5ec08894'
         '2ac075f39bab33c203e7b25adb3e07b3')

build() {
    cd "$srcdir/dill-dill-$pkgver"
    python setup.py build
}

package_python-dill() {
    depends=('python')
    cd "$srcdir/dill-dill-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-dill() {
    depends=('python2')
    install=python2-dill.install
    cd "$srcdir/dill-dill-$pkgver"
    find . -name "*.py" -exec sed -i 's#/usr/bin/env python#/usr/bin/env python2#' {} \;
    python2 setup.py install --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    mv "$pkgdir/usr/bin/get_objgraph" "$pkgdir/usr/bin/get_objgraph2"
    mv "$pkgdir/usr/bin/undill" "$pkgdir/usr/bin/undill2"
}
