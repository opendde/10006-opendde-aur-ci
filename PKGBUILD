# Maintainer: kumpelblase2
pkgname=nanobox-bin
pkgver=0.16.9
pkgrel=1
pkgdesc='Local Development Done Right'
arch=('x86_64')
provides='nanobox'
url='https://desktop.nanobox.io/'
license=('custom:MPL2')
depends=('virtualbox' 'vagrant')
source=('https://s3.amazonaws.com/tools.nanobox.io/cli/linux/amd64/nanobox'
        'LICENSE')
md5sums=('378a10af92646cd8314d8f11e1996bf9'
         '12db314d9a9d5c9479e9890471e8e543')

package() {
  cd "$srcdir"
  install -Dm755 nanobox "$pkgdir/usr/bin/nanobox"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
