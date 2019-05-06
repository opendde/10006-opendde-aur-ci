# Maintainer:         Alexander Blinne "Sunday" <alexander at blinne dot net>

_pkgname=sview
pkgname=$_pkgname-git
pkgver=19.04.r3.gcb9332a8
pkgrel=1
pkgdesc="Stereoscopic 3D video player with OpenGL UI"
arch=('i686' 'x86_64')
url="http://www.sview.ru/en"
license=('custom')
depends=('libconfig' 'ffmpeg' 'freetype2' 'gtk2' 'libgl' 'libx11' 'libxext' 'libxpm' 'openal' 'ttf-droid' 'ttf-freefont')
optdepends=('ttf-nanum')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://github.com/gkv311/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  # this is the version according to AndroidManifest.xml, however no tag was set by the original author
  git tag -f 19_04 2b03b4fac40ad38a2e5e3223c09dc35ad0f9ba02
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g'
}

build() {
  cd $_pkgname
  unset ANDROID_NDK
  msg2 "Starting make..."
  make -j1 all
}

package() {
  cd $_pkgname
  msg2 "Starting make install..."
  make DESTDIR="$pkgdir" install
  mkdir -p $pkgdir/usr/share/licenses/$_pkgname/
  cp LICENSE.md $pkgdir/usr/share/licenses/$_pkgname/
}
