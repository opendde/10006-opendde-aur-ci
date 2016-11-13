#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=ecryptfs-simple
pkgver=2016.11.13
pkgrel=1
pkgdesc='A very simple utility for working with eCryptfs.'
arch=(i686 x86_64)
license=(GPL)
url="http://xyne.archlinux.ca/projects/ecryptfs-simple"
depends=(ecryptfs-utils util-linux)
makedepends=(cmake)
source=(
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2016.11.13.tar.xz
  http://xyne.archlinux.ca/projects/ecryptfs-simple/src/ecryptfs-simple-2016.11.13.tar.xz.sig
)
sha512sums=(
  c0e7178cc24ac1e5ddf79859b44abc5a137cd43de77d3044f6d19247541939facde8060f24fc11adbae1c179e69f036ef226fdb78d614974eb2391acba59f293
  d9de56f5b8d294b0835703a44e6f79365fcc79a017dbabc6206a966142038dd8bff807d4a97ab637e35f256a98f9f28101d971b8b68ab6c84901d32427c5d223
)
md5sums=(
  625d252fe3638f0dc5c93fdcc5d82aea
  85ac8c71c1a59be138f740fb0aec29e9
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

build ()
{
  mkdir -p "$srcdir/build"
  cd -- "$srcdir/build"
  cmake ../"$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package ()
{
  cd -- "$srcdir/build"
  make install DESTDIR="$pkgdir"
}
# vim: set ts=2 sw=2 et:
