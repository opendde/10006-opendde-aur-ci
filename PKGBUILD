# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=dcpomatic
pkgver=2.14.19
pkgrel=2
pkgdesc="A free, open-source program to generate Digital Cinema Packages (DCPs) from videos or images"
arch=('i686' 'x86_64')
url="https://dcpomatic.com/"
#  CXXFLAGS="$CXXFLAGS  -I/usr/include/openjpeg-1.5/  -std=c++11"
depends=('pangomm>=1.4' 'xorgproto' 'libsub>=1.4.14' 'libcxml>=0.16.1' 'libdcp>=1.6.14' 'ffmpeg>=4.0.2' 'glib2' 'imagemagick' 'libssh'  'wxgtk2>=3.0.4'   'wxgtk-common' 'libquickmail>=0.1.29' 'libzip' 'xz' 'libsndfile' 'libsamplerate' 'pangomm' 'rtaudio' 'x264')
makedepends=('python2' 'boost>=1.66.0' )
source=("${pkgname}-${pkgver}.tar.bz2::https://dcpomatic.com/dl.php?id=source&version=${pkgver}" )
sha256sums=('7aee13f1d836af5e12bca05d2e73a4413961e08fafab64b94d6a0917b7c410c1')






build() {
  PKG_CONFIG_LIBDIR="/usr/lib64/pkgconfig/:/usr/lib/pkgconfig/:$PKG_CONFIG_LIBDIR"
  CXXFLAGS="$CXXFLAGS    -std=c++11 -O2 "

  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 waf configure   --prefix=/usr --disable-tests
  python2 waf build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 waf install --destdir=$pkgdir
  cd "${pkgdir}"
  if [ -d usr/lib64  ]
  then
      mv usr/lib64 usr/lib
  fi
}
