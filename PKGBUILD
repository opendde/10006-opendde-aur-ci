# Maintainer: zapp-brannigan <fuerst.reinje@web.de>
#             danhyal <danhyal@gmail.com>
#             jgottula
_pkgname=kvdo
pkgname=kvdo-dkms
pkgrel=1
pkgver=8.1.0.316
pkgdesc='A pair of kernel modules which provide pools of deduplicated and/or compressed block storage '
arch=('x86_64')
url="https://github.com/dm-vdo/kvdo"
license=('GPL2')
provides=('kvdo')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/dm-vdo/kvdo/archive/$pkgver.tar.gz"
        "dkms.conf"
        "config_hz.patch")
sha256sums=('6aded08bfc2bfbc91f5362bcd8b77121e04398f134f7cad1e0ef9caf519b61ae'
            '516f60bdb28f7a0cb6c8f1f84c656ee7c6aec8feb393538f227ed515372ac88a'
            'bd4c32b8496714e9a998fed0f0114076c61e50cf1a51ebf52180b728cb1bbd9c')

package() {
  mkdir -p "$pkgdir"/usr/src
  cp -r "$_pkgname-$pkgver" "$pkgdir"/usr/src/"$_pkgname-$pkgver"
  cd "$pkgdir"/usr/src/kvdo-"$pkgver"
  patch --forward --strip=0 -i "$srcdir"/config_hz.patch
  cd "$srcdir"
  sed -e "s/@PKGVER@/${pkgver}/" dkms.conf > "$pkgdir"/usr/src/"$_pkgname-$pkgver"/dkms.conf
}
