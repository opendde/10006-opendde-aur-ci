# Maintainer: Letu Ren <fantasquex at gmail dot com>
# Contributor: workonfire <kolucki62@gmail.com>

pkgname=babi
pkgver=1.5.3
pkgrel=1
pkgdesc="A text editor, eventually..."
arch=('any')
url="https://github.com/asottile/babi"
license=('MIT')
depends=('python-onigurumacffi>=0.0.18' 'babi-grammars' 'python-identify')
makedepends=('python-setuptools')
provides=('babi')
conflicts=('babi' 'babi-git')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
        cd "${pkgname}-${pkgver}"
	python setup.py build
}

package() {
        cd "${pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

