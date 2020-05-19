# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-mne
_name=${pkgname#python-}
pkgver=0.20.4
pkgrel=1
pkgdesc="Open-source Python software for exploring, visualizing, and analyzing human neurophysiological data: MEG, EEG, sEEG, ECoG, and more"
arch=('any')
url="https://mne.tools/stable/index.html"
license=('BSD')
groups=()
depends=('python' 'python-numpy' 'python-scipy')
makedepends=()
optdepends=('python-matplotlib' 'python-scikit-learn' 'python-pandas')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz)
noextract=()
sha1sums=('15420a7ab6870f0a0e9ed58af777bd788bfc8f81')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
