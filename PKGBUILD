# Maintainer: Sara Jakša <sarajaksa@gmail.com>

_pkgname=python-pytumblr
pkgname=$_pkgname-git
pkgver=0.0.7.r135.250ad07
pkgrel=1
pkgdesc="Python2 wrapper for Tumblr API"
arch=('any')
url="https://github.com/tumblr/pytumblr"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
provides=($_pkgname)
conflicts=($_pkgname)
source=("pytumblr::git+https://github.com/tumblr/pytumblr")
sha256sums=('SKIP')


pkgver() {
    cd "${srcdir}/pytumblr"
    printf "%s.r%s.%s" "$(python setup.py --version)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/pytumblr"
    python setup.py install --root="${pkgdir}/"
}
