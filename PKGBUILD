# Maintainer GI_Jack <GI_Jack@hackermail.com>
# Contributer: Paul Taylor <bao7uo at gmail dot com>
# Contributer: BlackArch

pkgname='python-bs4'
_pkgname='bs4'
pkgver='0.0.1'
pkgrel=1
pkgdesc='Beautiful Soup. bs4 name required by CrackMapExec trunk'
arch=('any')
url='https://pypi.python.org/pypi/bs4/'
license=('custom:unknown')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('36ecea1fd7cc5c0c6e4a1ff075df26d50da647b75376626cc186e2212886dd3a')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"

  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

