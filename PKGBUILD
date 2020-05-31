# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Gwenn Gueguen <gwenn+aur@demisel.net>

pkgname=lcmc
pkgver=1.7.17
pkgrel=1
pkgdesc="Linux Cluster Management Console"
arch=('i686' 'x86_64')
url="http://lcmc.sourceforge.net/"
license=('GPL')
depends=('java-runtime-common' 'libxtst' 'bash' 'hicolor-icon-theme')
source=("LCMC.jar::https://sourceforge.net/projects/lcmc/files/LCMC-${pkgver}.jar/download"
    'http://lcmc.sourceforge.net/changelog'
    'lcmc'
    'lcmc.png'
    'lcmc.desktop'
    'lcmc.install')
noextract=(LCMC.jar)
install=lcmc.install

sha1sums=('3654baa97a87081a86cb96a6e21f95c7c8fad3ff'
          'SKIP'
          '7177ab9f9a6d6e877443d834b55f81a58d69ef34'
          '84f8ab9b450c9e51d828435f12e72cfc851af0cf'
          '583f30b90058efb742a9ecc8e7f33e5e98048341'
          'e8b239a493dd5e1eb7e3dc5989bb03800e76a38d')

package() {
  cd "$srcdir"
  install -d $pkgdir/usr/bin
  install -m755 lcmc $pkgdir/usr/bin/
  install -d $pkgdir/usr/lib/${pkgname}
  install -m 644 -t $pkgdir/usr/lib/${pkgname} LCMC.jar changelog
  install -d $pkgdir/usr/share/icons/hicolor/48x48/apps
  install -t $pkgdir/usr/share/icons/hicolor/48x48/apps ${pkgname}.png
  install -d $pkgdir/usr/share/applications
  install -t $pkgdir/usr/share/applications ${pkgname}.desktop
}
