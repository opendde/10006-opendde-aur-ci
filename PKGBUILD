pkgname='python-dissononce-git'
pkgver=0.34.3.r1.g4fad01e
pkgrel=1
pkgdesc="python implementation for Noise Protocol Framework"
url="https://github.com/tgalal/dissononce"
arch=('any')
license=('MIT')
depends=('python' 'python-cryptography' 'python-transitions')
makedepends=('python-setuptools')
provides=('python-dissononce')
source=("${pkgname}::git+https://github.com/tgalal/dissononce")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="$pkgdir/"
}
