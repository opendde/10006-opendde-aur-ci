# Maintainer: Monika Schrenk <moni@random-access.org>

pkgname=mongochef
pkgver=3.0.7
pkgrel=2
pkgdesc="A free universal database tool for developers and database administrators"
arch=('i686' 'x86_64')
url="http://3t.io/mongochef/"
license=("custom")
depends=('java-runtime>=1.6')
makedepends=('unzip')
provides=('mongochef')

source=("mongochef.desktop" "mongochef")
source_i686=("https://cdn.3t.io/mongochef/linux/${pkgver}/mongochef-linux-x86-dist.tar.gz")
source_x86_64=("https://cdn.3t.io/mongochef/linux/${pkgver}/mongochef-linux-x64-dist.tar.gz")

sha256sums=('a603fd54a34f8aa59a70580fd4321db24f439ceb746545f1cf6c0216f7f8169e' 
'4b0f30fd696fc270df6333446294b761d9dcd8921b39f0dda9957d4fafacdece')
sha256sums_i686=('266748ef1fabbee08fcd74e9896f6c24030ef6281e1380c2c3d4c336e216f8c5')
sha256sums_x86_64=('5f06150e4119e802b7e9f22450062f90c9caf9b5820ecec797599e3a979e7cb9')

prepare() {
  unzip -j $srcdir/${pkgname}-$pkgver-linux-*-dist/lib/data-man-gui-3.0.0.jar "t3/dataman/icons/mc-512.png" -d "./"
  unzip -j $srcdir/${pkgname}-$pkgver-linux-*-dist/lib/data-man-mongodb-pro-$pkgver.jar "t3/utils/gui/3T-EULA.txt" -d "./"
}

package() {
  cd $pkgdir
  mkdir -p opt/

  cp -r $srcdir/${pkgname}-$pkgver-linux-*-dist/lib opt/${pkgname}

  ## add startup script 
  install -D -m 755 $srcdir/${pkgname} usr/bin/${pkgname}

  ## add desktop entry
  install -D -m 644 $srcdir/${pkgname}.desktop usr/share/applications/${pkgname}.desktop
  
  ## add application icon
  install -D -m 644 $srcdir/mc-512.png usr/share/pixmaps/${pkgname}.png

  ## add licence
  install -D -m 644 $srcdir/3T-EULA.txt usr/share/licences/${pkgname}/3T-EULA.txt
}
