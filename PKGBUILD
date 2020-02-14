# Maintainer: liberodark

pkgname=elcalc
pkgver=6.1.3
pkgrel=1
pkgdesc="Simple, Cross-Platform calculator built with Electron! In less than 100 lines of code."
arch=('x86_64')
url="https://github.com/elcalc/elcalc/"
license=('MIT')
depends=('xdg-utils')
source=("https://github.com/elcalc/elcalc/releases/download/${pkgver}/elcalc_${pkgver}_amd64.deb"
	"$pkgname.desktop"
        "$pkgname.png")
sha512sums=('0b991263102316f2e2d5e1e7bf6bb5c50d59b03cc5ab81c1268c9af0fc2a8baf257160ee5403b55daf3ad9d2d98bc62326452e2bf1937e541810874c484a231a'
            'b078f9108b73f79b5ead6bda9a7dacc1e7806413f549c8132fe6f37548c5e93a0a7505b3397cf49a6fe8c7827ba3430b4242c2fd67fcd722482dd4372891aa14'
            'a15838f134ac3a85cb2dbbb508ee6fca18923156d17a05ef8a64778e573a28605e45475b6d4e21e3a5f00ebd1f0d4e2f6b058537c0d919e174e67444afa64ead')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r opt $pkgdir
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

