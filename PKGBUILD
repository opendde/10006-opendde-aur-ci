# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Simon Conseil <contact+aur at saimon dot org>

pkgname=pip-tools
pkgver=1.7.0
pkgrel=1
pkgdesc="A set of tools to keep your pinned Python dependencies fresh."
arch=('any')
url="https://github.com/nvie/pip-tools"
license=('BSD')
depends=('python-click' 'python-first' 'python-pip' 'python-six')
source=("https://pypi.python.org/packages/ec/1a/3dce962d5d58f2874ee64110e45986ac5a73d2023dcf32804038ffd87637/${pkgname}-${pkgver}.tar.gz"
        LICENSE.txt)
md5sums=('2f3be43fd4f96ed5b03ddd093d8e4f04'
         'b542fe20de254615b3ab48020bc73441')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "${srcdir}/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
