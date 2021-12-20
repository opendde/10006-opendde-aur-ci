# Maintainer: rhssk <rhssk@posteo.eu>
pkgname=kicost-git
_remotename=KiCost
pkgver=1.1.6.r1.227f246
pkgrel=1
pkgdesc="Build cost spreadsheet for a KiCad project"
url="https://github.com/hildogjr/KiCost"
depends=(
    'python'
    'python-setuptools'
    'python-beautifulsoup4'
    'python-xlsxwriter'
    'python-future'
    'python-lxml'
    'python-yattag'
    'python-tqdm'
    'python-currencyconverter'
    'python-pycountry'
    'python-requests'
)
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
license=('MIT')
arch=('any')
source=('git+https://github.com/hildogjr/KiCost.git')
sha256sums=('SKIP')

pkgver() {
    cd "$_remotename"

    printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

check() {
    cd "$_remotename"

    python -m unittest tests.test_kicost
}

package() {
    cd "$_remotename"

    python setup.py install --root="$pkgdir" --optimize=1
}
