# Contributor: xduugu
pkgname=ofxstatement
pkgver=0.6.4
pkgrel=1
pkgdesc="Tool to convert proprietary bank statement to OFX format, suitable for importing to GnuCash"
arch=('any')
url="https://github.com/kedder/ofxstatement"
license=('GPL')
depends=('python-appdirs>=1.3.0' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kedder/ofxstatement/archive/$pkgver.tar.gz")
sha512sums=('ecbef387b48dd8bf1408e7a8a5445642e34275e9334bf29216c00fbf8b31622f63939f14a3e18e4523ad836f264e17247a34f6cbd9ab789b7ab4068e1d482c52')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
