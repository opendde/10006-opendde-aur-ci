# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=python-torchviz-git
_pkgver=0.0.1
pkgver=0.0.1.r13.a02b4a2
pkgrel=1
pkgdesc="A small package to create visualizations of PyTorch execution graphs and traces"
arch=(any)
url="https://github.com/szagoruyko/pytorchviz"
license=(custom)
depends=(python-graphviz python-pytorch)
makedepends=(git python-setuptools)
provides=(python-torchviz=${pkgver})
conflicts=(python-torchviz)
source=("${pkgname}::git+https://github.com/szagoruyko/pytorchviz.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  ver=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  echo "${_pkgver}.${ver}"
}

build() {
	cd "${srcdir}/${pkgname}"
	python setup.py build
}

package() {
	cd "${srcdir}/${pkgname}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
