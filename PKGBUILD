# Maintainer: Simon Zack <simonzack@gmail.com>
# Submitter: Simon Zack <simonzack@gmail.com>
# Contributor: Santi Villalba <sdvillal@gmail.com>

pkgname=python-guessit
pkgver=0.11.0
pkgrel=1
pkgdesc="A library for guessing information from video files."
arch=(any)
url="http://pypi.python.org/pypi/guessit"
license=(LGPL)
depends=(python python-babelfish python-stevedore python-requests python-dateutil)
makedepends=(python-distribute)
conflicts=(${pkgname}-git)
source=(http://pypi.python.org/packages/source/g/guessit/guessit-${pkgver}.tar.gz)
md5sums=('ded69d55db57e0a57a588f0be6243871')

package() {
    cd "${srcdir}/guessit-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
