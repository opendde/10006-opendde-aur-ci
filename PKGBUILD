# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-mne
_name=${pkgname#python-}
pkgver=1.0.2
pkgrel=1
pkgdesc="Python package for exploring, visualizing, and analyzing human neurophysiological data: MEG, EEG, sEEG, ECoG, and more"
arch=('any')
url="https://mne.tools/stable/index.html"
license=('BSD')
groups=()
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib' 'python-pooch' 'python-tqdm' 'python-jinja' 'python-decorator')
makedepends=()
optdepends=('python-scikit-learn' 'python-pandas')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://files.pythonhosted.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz)
noextract=()
sha1sums=('1816dd32af41c65c9f5783502ff7689dd239f324')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
