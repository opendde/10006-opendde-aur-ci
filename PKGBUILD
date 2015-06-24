# Contributor: Johannes Dewender   arch at JonnyJD dot net
pkgname=distro-info
_python=python2
pkgver=0.14
pkgrel=1
pkgdesc="provides information about the distributions' releases"
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/distro-info"
license=('MIT')
depends=('distro-info-data>=0.21')
makedepends=('shunit2' 'perl' 'python-setuptools' 'python2-setuptools' 'python-pylint')
provides=('python-distro-info' 'python2-distro-info' 'perl-distro-info')
conflicts=('python-distro-info' 'python2-distro-info' 'perl-distro-info')
options=(!emptydirs)
source=(http://ftp.debian.org/debian/pool/main/d/$pkgname/${pkgname}_$pkgver.tar.xz)
sha256sums=('73b7912107157cdad96a52b10a050292c9bdb049c52fb3a70b6dbf21a4965204')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e 's/python3 setup.py/python2 setup.py/g' \
    -e 's/ --install-layout=deb//g' \
    Makefile
  make
}
check() {
  cd "$srcdir/$pkgname-$pkgver"
  make test-commandline
  make test-perl
  cd python
  # We don't want to test all installed python versions -> don't use "make test"
  for pythonver in {python2,python}; do
    $pythonver setup.py test
  done
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  # vendor can currently be only ubuntu or debian
  # with ubuntu you can build for PPA (with bzr-builddeb)
  make DESTDIR="$pkgdir/" VENDOR="ubuntu" install
}

# vim:set ts=2 sw=2 et:
