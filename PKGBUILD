pkgname=steve++
pkgver=1.0.0
pkgrel=2
pkgdesc="A joke c++ compiler that does nothing."
url="https://blog.stevefan1999.me"
arch=('i686' 'x86_64')
depends=('bash')
source=('steve++')
sha256sums=('ebd277f07f6a07aa0ab84853ee6e0b0936425514b89062aa90261736d4352c82')

package() {
  install -Dm755 "steve++" "${pkgdir}/usr/bin/steve++"
}
