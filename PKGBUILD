# Maintainer: Florian Bigard <florian.bigard@gmail.com>
# Thanks to Adria Arrufat <swiftscythe@gmail.com>

pkgname=clementine-lxqt
pkgver=1.2.3
pkgrel=1
pkgdesc="Qt5 version of Clementine, a modern music player and library organiser."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly'
         'gst-libav' 'taglib' 'glew' 'liblastfm-qt5' 'desktop-file-utils'
         'libmtp' 'libplist' 'hicolor-icon-theme' 'qt5-base' 'sparsehash'
         'libechonest-qt5' 'libcdio' 'protobuf' 'crypto++' 'chromaprint'
         'libmygpo-qt5-git' 'qt5-x11extras')
makedepends=('git' 'boost' 'cmake' 'mesa' 'qt5-tools')
install=clementine.install
# Uncomment next lines to enable more features
#makedepends+=('libspotify' 'libgpod' 'libimobiledevice')
#optdepends+=(
#'libspotify: for Spotify support'
#'libimobiledevice: for iPhone and iPod Touch support'
#)

url="http://www.clementine-player.org/"
source="http://esclapion.free.fr/AUR/Clementine-$pkgver.tar.gz"
sha256sums=('d5f4208c788b6ebe85921b95969e5692ebd81a23d31c3942d11d0a22c2f5f28c')

provides=('clementine')
conflicts=('clementine' 'clementine-qt5-git')
replaces=('clementine')

build() {
  mkdir -p build
  cd build

  # Don't make a release build since it's experimental and we would need debug/info/warning messages
  # Add -DCMAKE_BUILD_TYPE=Release if you're an adventurer
  cmake "../Clementine" \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make 
}

package(){
  cd build
  make DESTDIR=${pkgdir} install
}
