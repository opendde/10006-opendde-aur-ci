# Maintainer: Mikael Tillenius <mti at tillenius dot com>
pkgname=libps4000
pkgver=2.1.34_2r2002
pkgrel=1
pkgdesc="library for picotech oscilloscope 4000 series (4223, 4224, 4226, 4227, 4262, 4423, 4424)"
arch=('x86_64')
url="http://www.picotech.com/linux.html"
license=('custom')
groups=()
depends=(libusb)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("http://labs.picotech.com/debian/pool/main/libp/libps4000/${pkgname}_${pkgver//_/-}_amd64.deb")
md5sums=('835a588cfbc0a90526dd831fe3806acf')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  chmod -R go-w $pkgdir
  chown -R root:root $pkgdir
}
