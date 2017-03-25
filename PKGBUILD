# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: DJ Ring, Jr <n1ea@arrl.net>
# Contributor: mmm
# Contributor: Woody Gilk <woody@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xaralx
pkgver=0.7_rev1785
pkgrel=12
pkgdesc="An advanced vector graphics program, development release"
arch=('i686' 'x86_64')
url="http://www.xaraxtreme.org/"
license=('GPL')
depends=('wxgtk' 'libpng' 'libjpeg' 'libxml2')
makedepends=('pkgconfig')
optdepends=('imagemagick: needed for some conversions')
install=${pkgname}.install
source=(http://downloads.xara.com/opensource/xaralx${pkgver}.tar.bz2)
sha256sums=('83de10dda870da08cc2c1285246b364e1abfe3e0eb2d8483c1aa104a74003082')

if [ "$CARCH" = "x86_64" ]; then
    depends+=(lib32-{libstdc++5,pangox-compat,gtk2,libsm})
elif [ "$CARCH" = "i686" ]; then
    depends+=(libstdc++5 pangox-compat gtk2 libsm)
fi


package() {
  cd $srcdir/$pkgname
## needed for source/svn build 
#  autoreconf -f -i -s
#  ./configure --prefix=/usr --enable-filters  \
#    --enable-xarlib --disable-svnversion --with-gnu-ld
#  make 
#  make DESTDIR=$pkgdir install

  install -d $pkgdir/usr/bin $pkgdir/usr/share/xaralx/doc $pkgdir/usr/share/licenses/xaralx
  install -D -m755 bin/* $pkgdir/usr/bin 
  cp -R share/xaralx $pkgdir/usr/share/
  chmod -R 644 $pkgdir/usr/share/xaralx
  install -D -m644 share/xaralx/doc/LICENSE $pkgdir/usr/share/licenses/xaralx/LICENSE 
  # Desktop compatibility
  install -D -m644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -D -m644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D -m644 $pkgname.xml $pkgdir/usr/share/mime/packages/$pkgname.xml
}
