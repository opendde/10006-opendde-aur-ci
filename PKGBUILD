# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=targetcli-fb
pkgver=2.0rc1.fb19
pkgrel=1
epoch=
pkgdesc="free branch of the targetcli LIO administration shell (iSCSI + Co)"
arch=('any')
url="https://github.com/agrover/targetcli-fb"
license=('AGPL3')
groups=()
depends=('python2-rtslib-fb>=2.1.fb13' 'python2-configshell')
optdepends=()
conflicts=('lio-utils')
provides=('targetcli')
replaces=('rtsadmin')
backup=()
options=()
install=
source=($pkgname-$pkgver.tar.gz::https://github.com/agrover/$pkgname/archive/v$pkgver.tar.gz
target)
md5sums=('f2bd7ddd04945e49c1f6c9a5c72f76c1'
         'f23bd6d5d4021c29b4519e40b3b9e042')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
  gzip --stdout targetcli.8 > "targetcli.8.gz"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir/" --optimize=1

  install -D -m 644 targetcli.8.gz "$pkgdir/usr/share/man/man8/targetcli.8.gz"

  # arch specific
  cd "$srcdir"
  install -D -m 755 target "$pkgdir/etc/rc.d/target"
  install -d "$pkgdir/etc/target"
}

# vim:set ts=2 sw=2 et:
