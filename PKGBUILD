# Maintainer: Martyn van Dijke <martijn_vdijke at hotmail dot com>
# Upstream URL: https://github.com/martynvdijke/gr-lora_sdr
# Based on Pieter Robyns <pieter dot robyn at uhasselt dot be>'s gr-lora-git PKGBUILD

pkgname=gr-lora_sdr-git
pkgver=d779124
pkgrel=2
pkgdesc="GNU Radio blocks for fully-functional LoRa transceiver"
arch=('x86_64')
url="https://github.com/martynvdijke/gr-lora_sdr"
license=('GNU General Public License v3.0')
depends=('gnuradio=3.8.2.0' 'boost' 'swig' 'libvolk' 'libuhd')
makedepends=('cmake')
provides=('gr-lora_sdr')
source=('git+https://github.com/martynvdijke/gr-lora_sdr')
sha1sums=('SKIP')
_gitname=gr-lora_sdr

pkgver() {
  cd $_gitname
  echo $(git describe --always | sed 's/-/./g' | sed 's/^v//g')
}

build() {
  cd $_gitname
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd $_gitname
  cd build
  make DESTDIR=${pkgdir} install
}
