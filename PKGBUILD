pkgname=slimit
provides=('slimit')
pkgver=0.8.1
pkgrel=2
pkgdesc="SlimIt - JavaScript minifier"
arch=('any')
url="http://slimit.org/"
license=('MIT')
depends=('python2' 'python2-ply>=3.4' 'python2-odict')
makedepends=('python2-distribute')
source=("https://pypi.python.org/packages/source/s/slimit/slimit-${pkgver}.zip")
sha512sums=('df6be158e257e4fa0acb6c08b7821aae10b4075d889d3be165c80c1e4d387ab016e87f9ac522ff46a5954a758a08dbb2a50fac0fbb1e4f1e9edc8cfebb1161b0')
 
build() {
   cd "${srcdir}/slimit-${pkgver}"
   python2 setup.py build || exit 1
}
 
package() {
   cd "${srcdir}/slimit-${pkgver}"
   python2 setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}
