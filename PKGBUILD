# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-bioservices
_pkgname=${pkgname#python-}
pkgver=1.8.1
pkgrel=1
pkgdesc="Access Bioinformatices Web Services and framework for WSDL/SOAP and REST wrappers"
arch=('any')
license=('GPL')
url="https://bioservices.readthedocs.io/"
depends=('python-easydev>=0.9.36' 'python-beautifulsoup4' 'python-pandas'
         'python-colorlog' 'python-grequests' 'python-requests-cache'
         'python-xmltodict' 'python-suds')
source=("https://pypi.io/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('ad9147885d92bdbe31cee4eec29a795ec0c9dbcfb373998f1e44f4354f3512ca')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
