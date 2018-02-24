# Maintainer: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Leandro de Assis <leandrodiassis@gmail.com>
# Contributor: Thomas Dziedzic

pkgname=geoserver-bin
pkgver=2.12.2
pkgrel=1
pkgdesc="Server written in Java that allows users to share and edit geospatial data"
arch=('any')
url="http://geoserver.org"
license=('GPL2+')
depends=('java-runtime')

source=(http://downloads.sourceforge.net/project/geoserver/GeoServer/$pkgver/geoserver-$pkgver-bin.zip)
sha256sums=('c66d57acfbb2ea171c54cd9706a27cfceff4bc80756c5fcd95b0bc1fc44a6e3e')

####################################################
# WARNING: GEOSERVER USES A VERY WEIRD CONFIGURATION
#          FOLDERS NEED TO BE 777 IN /OPT
####################################################

package() {
  cd "$srcdir/geoserver-$pkgver"

  # remove windows files
  rm bin/startup.bat bin/shutdown.bat

  # install
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm LICENSE.txt
  cd ..
  mkdir -p "$pkgdir/opt"
  cp -r geoserver-$pkgver "$pkgdir/opt"

  # TODO: selectively change file permissions
  #       or find a better way to install geoserver

  # change permissions
  chmod -R a+rwX "$pkgdir/opt/geoserver-$pkgver"

  # make custom startup/shutdown links
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/geoserver-$pkgver/bin/startup.sh" "$pkgdir/usr/bin/geoserver-startup"
  ln -s "/opt/geoserver-$pkgver/bin/shutdown.sh" "$pkgdir/usr/bin/geoserver-shutdown"

  # set necessary variables
  mkdir -p "$pkgdir/etc/profile.d"
  echo "export GEOSERVER_HOME=/opt/geoserver-$pkgver/" > "$pkgdir/etc/profile.d/geoserver.sh"
  chmod +x "$pkgdir/etc/profile.d/geoserver.sh"
}
