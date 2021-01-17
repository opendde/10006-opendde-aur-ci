# Original Contributor Dan McGee <dan@archlinux.org>
# Contributor: Florian Zeitz <florob at babelmonkeys dot de>
# Mantainer:  Lorenzo Ferrillo <lorenzofer at live dot it> 
_basename=numactl
pkgname=lib32-numactl
pkgver=2.0.14
pkgrel=1
pkgdesc="Simple NUMA policy support 32-bit version. Libraries only"
arch=('x86_64')
url="http://oss.sgi.com/projects/libnuma/"
license=('LGPL2.1' 'GPL2')
depends=('lib32-gcc-libs' 'numactl')
source=("https://github.com/numactl/numactl/releases/download/v${pkgver}/${_basename}-${pkgver}.tar.gz")
sha512sums=('28b95985d6b2f26c5f6f15fe235224c998c86f534adf5fdaa355a292cf2fd65515c91ba2a76c899d552d439b18ea1209a1712bd6755f8ee3a442f3935993b2e6')



prepare(){
  cd "${_basename}-${pkgver}"
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  autoreconf -vfi
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
 # patch -Np0 -i numactl-2.0.11-sysmacros.patch
  cd "${_basename}-${pkgver}"
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "${_basename}-${pkgver}"          
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir/usr/share/" "$pkgdir/usr/bin/" "$pkgdir/usr/include/"
}
 
