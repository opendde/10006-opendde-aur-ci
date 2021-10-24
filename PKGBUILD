# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=topcat
pkgver=4.8.2
_pkgver=4.8-2
pkgrel=4
pkgdesc="Tool for OPerations on Catalogues And Tables"
arch=('any')
url="http://www.star.bris.ac.uk/~mbt/topcat/"
depends=('java-runtime' 'sh')
license=('GPL')
noextract=('topcat-full.jar')
source=("http://andromeda.star.bristol.ac.uk/releases/topcat/v${_pkgver}/topcat-full.jar"
        "https://raw.githubusercontent.com/Starlink/starjava/master/topcat/src/docs/tclogo.svg"
        "topcat" "topcat.desktop")
md5sums=('a65430e71f9dc2817f321f919c6bbd89'
        'a8df7717765aa85d16dfbf296ea8d76e'
         '5f2df6a05c72b5641bf6a2b1c29173ed'
         'c00fecfd325398c2bcbd08ac76456c6e')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/java"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  install -m644 "$srcdir"/topcat-full.jar "$pkgdir"/usr/share/java
  install -m755 "$srcdir"/topcat "$pkgdir"/usr/bin/topcat
  install -m755 "$srcdir"/tclogo.svg "$pkgdir"/usr/share/pixmaps/topcat.svg
  install -m755 "$srcdir"/topcat.desktop "$pkgdir"/usr/share/applications
}
