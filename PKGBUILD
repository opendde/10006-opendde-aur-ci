# Maintainer: Aleksy Grabowski <hurufu+arch@gmail.com>

pkgname=python-asn1tools
pkgver=0.156.0
pkgrel=1
pkgdesc='A Python package for ASN.1 parsing, encoding and decoding'
arch=(any)
url='https://github.com/eerimoq/asn1tools.git'
license=('MIT')
depends=(
    python 
    licenses
    python-prompt_toolkit
    python-diskcache
)
makedepends=(python-pip)
checkdepends=(python-pytest python-trio)
source=(asn1tools-$pkgver.tar.gz::https://github.com/eerimoq/asn1tools/archive/$pkgver.tar.gz)
md5sums=(a42fb735d3d290bd85e63ce5de58f449)
sha1sums=(ab39f16eec574d229f58bd49dc079348e3df27c7)

build() {
    cd asn1tools-$pkgver
    python setup.py build
}

package() {
    cd asn1tools-$pkgver
    python setup.py install -O1 --root="$pkgdir" --skip-build
}
