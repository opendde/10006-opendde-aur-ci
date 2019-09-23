# Maintainer:         Alexander Blinne "Sunday" <alexander at blinne dot net>

pkgname=sview
_pkgver=49eb8a009d563ed498ad64960f17a5b98fd74a19
pkgver=19.08
pkgrel=1
pkgdesc="Stereoscopic 3D video player with OpenGL UI"
arch=('i686' 'x86_64')
url="http://www.sview.ru/en"
license=('custom')
depends=('libconfig' 'ffmpeg' 'freetype2' 'gtk2' 'libgl' 'libx11' 'libxext' 'libxpm' 'openal' 'ttf-droid' 'gnu-free-fonts')
optdepends=('ttf-nanum')
source=("https://github.com/gkv311/sview/archive/$_pkgver.tar.gz")
sha256sums=('4652c638819834676f800d636544ea3233cacec14025de66aa22b295863c7fe5')

build() {
  cd $pkgname-$_pkgver
  unset ANDROID_NDK
  msg2 "Starting make..."
  make -j1 all
}

package() {
  cd $pkgname-$_pkgver
  msg2 "Starting make install..."
  make DESTDIR="$pkgdir" install
  mkdir -p $pkgdir/usr/share/licenses/$_pkgname/
  cp LICENSE.md license* $pkgdir/usr/share/licenses/$_pkgname/
}
