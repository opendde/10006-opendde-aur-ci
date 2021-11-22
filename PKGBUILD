# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

_pkgname=timeago
pkgname=python-${_pkgname}
pkgver=1.0.15
pkgrel=1
pkgdesc="Very simple python library, used to format datetime with \`***time ago\` statement."
arch=('any')
url="https://github.com/hustcc/timeago"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=()
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/hustcc/timeago/${pkgver}/LICENSE")
sha256sums=('cfce420d82892af6b2439d0f69eeb3e876bbeddab6670c3c88ebf7676407bf4c'
            'e2a15cd0b56cfffbb99e27caeb87afe58ff78097d9c3bd3aea2a251145479912')

build() {
	cd "${_pkgname}-$pkgver"
	python setup.py build
}

package() {
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "${_pkgname}-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
