# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Miguel de Val-Borro <miguel dot deval at gmail dot com>

pkgname=python-agnpy
_pkg="${pkgname#python-}"
pkgver=0.2.0
pkgrel=1
pkgdesc="Models Active Galactic Nuclei radiative processes"
arch=('any')
url="https://github.com/cosimonigro/agnpy"
license=('BSD')
depends=('python-astropy' 'python-numpy' 'python-matplotlib' 'python-scipy')
optdepends=('python-sherpa' 'python-gammapy')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
# checkdepends=('python-pytest' 'python-sherpa' 'python-gammapy')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/a/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('9e73ab7ede7c1eb54d1981a3d852fa3739e4265db3d190d08432510e644c37dd')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i '/find_packages/s/()/(exclude=["agnpy.tests*"])/' setup.py
	rm -rf "$_pkg.egg-info"
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

# check() {
# 	cd "$_pkg-$pkgver"
# 	PYTHONPATH="$PWD" pytest -x
# }

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
