# Maintainer: Wouter de Vries <wouter@wouter-web.nl>
_name=ripe.atlas.tools
pkgname=ripe-atlas-tools
pkgver=2.3.0
pkgrel=1
pkgdesc="The official command-line client for RIPE Atlas"
arch=('any')
url="https://pypi.python.org/pypi/$_name"
license=('GPL3')
optdepends=('python-ujson: faster json decoding' 'python-sphinx: documentation generator')
depends=('python>=3.4' 'python-dateutil>=2.4.2' 'python-requests>=2.7.0' 'python-ripe-atlas-cousteau>=1.4.2' 'python-ripe-atlas-sagan>=1.3.0' 'python-tzlocal' 'python-yaml' 'python-pyopenssl>=0.13')
makedepends=('python-setuptools')
provides=('ripe-atlas-tools')
source=("https://pypi.io/packages/source/r/$_name/$_name-$pkgver.tar.gz")
sha256sums=('edb979ebb8e91ce994559ccf36733ea60480960a4c2a6d8c48d5420cdc99c148')

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 || return 1
    rm -rf "ripe/__pycache__" "ripe/atlas/__pycache__"
}
