# Maintainer: Philipp Schmitt <philipp@schmitt.co>
# GitHub: https://github.com/pschmitt/aur-python2-pagekite
pkgname=python2-pagekite
_pkgname=pagekite
pkgver=0.5.6d
pkgrel=3
pkgdesc='Python implementation of the PageKite remote front-end protocols.'
arch=('any')
url='http://pagekite.org'
license=('GPL')
depends=('python2' 'python2-socksipychain')
provides=('pypagekite')
conflicts=('pagekite')
options=(!emptydirs)
source=("https://pagekite.net/pk/src/$_pkgname-$pkgver.tar.gz")
md5sums=('2e1982c3fc9dc9461e7b1e24ffffe468')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  # Fix shebangs: #!/usr/bin/python -> #!/usr/bin/python2
  cd "$pkgdir"
  sed -i '1s/\(python\)/\12/' usr/bin/*
}

# vim:set ts=2 sw=2 et:
