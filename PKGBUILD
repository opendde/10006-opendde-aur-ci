# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=lives
pkgver=3.0.1
pkgrel=1
pkgdesc="A Video Editing System"
arch=('i686' 'x86_64')
url="http://lives-video.com"
license=('GPL')
depends=('libtirpc' 'mplayer' 'imagemagick' 'gtk3' 'sox' 'libvisual' 'mjpegtools' 'python' 'ffmpeg' 'jack' 'fftw' 'glu' 'schroedinger')
optdepends=('sdl' 'libogg' 'mkvtoolnix-cli' 'libmatroska' 'ogmtools' 'libavc1394' 'dvgrab' 'cdrkit' 'lame' 'youtube-dl' 'opencv')
makedepends=('pkg-config')
options=(!emptydirs)
changelog=lives.changelog
source=(http://lives-video.com/releases/LiVES-$pkgver.tar.bz2)
md5sums=('8b0cf9bfbbc2275c3038451b58f3b2b2')

build() {
  cd ${pkgname}-${pkgver}

  CPPFLAGS+=" -I/usr/include/tirpc/"
  LDFLAGS+=" -ltirpc"

  ./configure --prefix=/usr --enable-turbo --disable-doxygen
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
