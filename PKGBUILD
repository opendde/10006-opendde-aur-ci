# Maintainer: Joris Engbers <info at joris engbers dot nl>

pkgname=python-kaptan
pkgver=0.5.9
pkgrel=1
pkgdesc="Python configuration manager"
arch=('any')
url="https://emre.github.io/kaptan/"
license=('BSD')
depends=('python' 'python-yaml')
makedepends=('python-setuptools')
options=(!emptydirs)
source=(https://pypi.python.org/packages/37/28/65abc7998f22daeb5ed2176bb3510418ae313f495975c84c7b898a1b3d39/kaptan-0.5.9.tar.gz)
md5sums=('fd8faa01ee93c44b6cc8d0642788a2a6')

package() {
  cd "$srcdir/$_distname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 || exit1
}

# vim:set ts=2 sw=2 et:
