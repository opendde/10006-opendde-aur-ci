# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=gpsdings
pkgver=6.9.4
pkgrel=1
pkgdesc="Set of free applications that let you manipulate and analyse GPS data from the command line"
arch=('any')
url="http://gpstools.sourceforge.net/"
license=('GPL3')
depends=('java-runtime')
source=(http://sourceforge.net/projects/gpstools/files/$pkgname/$pkgver/$pkgname-$pkgver-jar.zip)
md5sums=('b801c7e450819dfec5e0666ac90d0940')

package() {
  cd "${srcdir}"

  install -Dm644 $pkgname.jar "${pkgdir}"/usr/share/java/$pkgname/$pkgname.jar
  echo -e "#"'!'"/bin/bash\njava -jar /usr/share/java/$pkgname/$pkgname.jar \"\$@\"" > $pkgname
  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname

  install -d "${pkgdir}"/usr/share/doc/$pkgname
  cp -r doc/* "${pkgdir}"/usr/share/doc/$pkgname
}
