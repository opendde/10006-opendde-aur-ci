# Maintainer: Jat <chat@jat.email>

_pkgname=xorgxrdp
pkgname=xorgxrdp-nvidia
pkgver=0.2.17
pkgrel=1
pkgdesc="Xorg drivers for xrdp, with NVIDIA GPU support."
arch=('i686' 'x86_64')
url="https://github.com/neutrinolabs/xorgxrdp"
license=('MIT')
provides=('xorgxrdp')
conflicts=('xorgxrdp')
depends=('nvidia')
makedepends=('nasm' 'xorg-server-devel' 'xrdp')
options=('staticlibs')
source=("https://github.com/neutrinolabs/xorgxrdp/releases/download/v$pkgver/xorgxrdp-$pkgver.tar.gz"{,.asc}
        "$pkgver.nvidia.patch::https://github.com/neutrinolabs/xorgxrdp/compare/v$pkgver...jsorg71:nvidia_hack.diff")
sha256sums=('de6fb593edfbaead1d47c663fc9c04bdad7e98293c0dca2bdc10727c54b24ced'
            'SKIP'
            '5065757020d8a2d07096ee5dc3d7998b459dd0ea172907e52ae2945338cee154')
validpgpkeys=('61ECEABBF2BB40E3A35DF30A9F72CDBC01BF10EB')  # Koichiro IWAO <meta@vmeta.jp>
install="$pkgname.install"

prepare() {
  cd "$_pkgname-$pkgver"

  patch -p1 -i"${srcdir}/$pkgver.nvidia.patch"

  busid=$(nvidia-xconfig --query-gpu-info | grep -im1 busid | awk '{print $NF}')
  sed -i 's/Identifier "layout"/Identifier "X11 Server"/
  /Section "ServerFlags"/a \ \ Option "DefaultServerLayout" "X11 Server"
  s/BusID "PCI:2:0:0"/BusID "'"$busid"'/' xrdpdev/xorg_nvidia.conf
}

build() {
  cd "$_pkgname-$pkgver"

  ./bootstrap
  ./configure --prefix="/usr"
  make
}

package() {
  cd "$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
