# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=radian
pkgver=0.4.8
pkgrel=1
pkgdesc="A 21 century R console"
url="https://github.com/randy3k/radian"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.4.0' 'python-six>=1.9.0'
         'python-lineedit>=0.1.5' 'python-lineedit<0.2.0'
         'python-rchitect>=0.3.19' 'python-rchitect<0.4.0')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pyte' 'python-pexpect' 'python-ptyprocess')
replaces=('rtichoke')
source=($pkgname-$pkgver.tar.gz::https://github.com/randy3k/radian/archive/v$pkgver.tar.gz)
sha256sums=('7e635b18c2f594e1c38b1536a3a62f462282bc54c2443ec26a16becf1d2b7e57')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

check_disabled() { # may fail because of R profile
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
