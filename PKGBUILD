# Maintainer: Wolfgang Mader <Wolfgang dot Mader at brain-frog dot de>

_name=langdetect
pkgname=("python-${_name}")
pkgver=1.0.7
pkgrel=1
pkgdesc="Language detection library ported from Google's language-detection"
arch=('any')
url="https://github.com/Mimino666/langdetect"
license=('APACHE')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.zip")
md5sums=("6675db2d8abccb97246372767270e912")

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
