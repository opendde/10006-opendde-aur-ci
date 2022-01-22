# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=boca
_pkgname=BoCA
pkgver=1.0.6
pkgrel=2
pkgdesc="A component library used by the fre:ac audio converter"
arch=('x86_64')
url="https://github.com/enzo1982/BoCA"
license=('GPL2')
depends=('alsa-lib' 'libcdio-paranoia' 'expat' 'libpulse' 'uriparser' 'smooth')
provides=('libboca-1.0.so=3' 'freac_cdk')
conflicts=('freac_cdk')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1d924c3d61252b28bd5546ee0ef1276177020fda25311474207d909b61d2e940')

prepare() {
  cd "$_pkgname-$pkgver"
  find . -type f -exec sed -i 's|/usr/local|/usr|g' {} \;

  sed -i 's/FOLDERS += coreaudioconnect/#FOLDERS += coreaudioconnect/g' \
    components/encoder/Makefile
}

build() {
  cd "$_pkgname-$pkgver"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
