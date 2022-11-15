# Maintainer: Guus van Meerveld <contact@guusvanmeerveld.dev>
pkgname='dust-mail-client'

arch=('x86_64')

pkgdesc='A simple and fast mail client'

pkgver=0.2.3
pkgrel=1
epoch=1

url='https://github.com/Guusvanmeerveld/Dust-Mail'

license=('MIT')

source=("https://github.com/Guusvanmeerveld/Dust-Mail/releases/download/${pkgver}/dust-mail_${pkgver}_amd64.deb")

md5sums=('f1009b2a7adb29675d6ea2c96b7701ed')
sha256sums=('c210d1a2c67e0571e2cfdfc96aeb3593781d4353231411087b4cc996998a4100')

prepare() {
  tar -zxvf data.tar.gz
}

package() {
  mkdir -p "$pkgdir/usr"

  cp "$srcdir/usr" "$pkgdir" -r
}
