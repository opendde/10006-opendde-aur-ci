# Maintainer bageljr <bageljr 897 at protonmail dot com>
# PKGBUILD generated by pipman
# Python package author: Lie Ryan <lie.1296@gmail.com>
pkgname=python-pylsp-rope
_name=${pkgname#python-}
pkgver=0.1.10
pkgrel=1
pkgdesc="Extended refactoring capabilities for Python LSP Server using Rope."
arch=(any)
url="https://github.com/python-rope/pylsp-rope"
license=(MIT license)
depends=("python-rope" "python-typing_extensions" "python" "python-lsp-server")
makedepends=("python" "python-pip" "python-build" "python-installer" "python-pytest")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("9e6104f15f922f633a4ba06ba0280f08a5e18973028f9bbdcae57b715d81cdd7")
build() {
	cd $_name-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $_name-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
check() {
	cd $_name-$pkgver
	python -m pytest .
}
