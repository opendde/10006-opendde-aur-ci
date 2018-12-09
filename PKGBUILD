# Maintainer: Václav Valíek <valicek1994@gmail.com>
pkgname=python-npyscreen
pkgver=4.10.5
pkgrel=1
pkgdesc="A python widget library and application framework"
arch=('any')
url="https://bitbucket.org/npcole/npyscreen"
license=('BSD')
makedepends=('python-setuptools' )
depends=('python' )
source=('https://files.pythonhosted.org/packages/93/48/91b8321280f17d135918895b57f891f727be84a88f62fc62485a7039de00/npyscreen-4.10.5.tar.gz')
sha256sums=('622ee0f9a5dae946e635b7c6e0f6d65e1ed3c9ea0d20b89dab7f58d580e5126e')

package() {
   cd "$srcdir/npyscreen-$pkgver"
   msg "$srcdir/npyscreen-$pkgver/LICENSE"
   install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
   python setup.py install --root="$pkgdir/" --optimize=1
}


