# $Id$
# Maintainter: martadinata666 <martadinata666@gmail.com>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

pkgname=compiz-fusion-plugins-main
pkgver=0.8.12
pkgrel=1
pkgdesc="Compiz Fusion Main plugins"
arch=('i686' 'x86_64')
url="http://blog.northfield.ws/compiz-0-8-12-release-announcement/"
license=('GPL')
depends=('compiz-core>=0.8.10' 'libjpeg>=7' 'librsvg' 'compiz-bcop' 'libxdamage' 'libxcomposite'
	'libxinerama' 'startup-notification')
makedepends=('intltool' 'pkgconfig' 'gettext')
groups=('compiz-fusion' 'compiz-fusion-kde' 'compiz-fusion-gtk')
conflicts=('compiz-fusion-plugins-main-git')
source=("compiz-fplugs-main-${pkgver}.tar.xz::http://www.northfield.ws/projects/compiz/releases/${pkgver}/plugins-main.tar.xz")
options=(!libtool)
sha256sums=('64973a098bfc4f3f43cd604202600a551a93ada3')


build() {
  cd "${srcdir}/plugins-main"
  
  CPPFLAGS="$CPPFLAGS -I/usr/include/compiz -I/usr/include/startup-notification-1.0 \
        -I/usr/include/libxml2" ./autogen.sh --prefix=/usr --sysconfdir=/etc

  make
}

package() {
  cd "${srcdir}/plugins-main"
  make DESTDIR="${pkgdir}" install
}
sha256sums=('9f74cc602630823d0e2621f271fa217527370716290b7acce78ef48658706ebd')
