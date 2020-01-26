# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Contributor: François M. <francois5537 @ gmail.com>

pkgname=manager-accounting
pkgver=$(wget -o /dev/null https://github.com/Manager-io/Manager.zip/releases -O - \
    | grep -o -P 'Manager-io/Manager\.zip/releases/download/[0-9]+\.[0-9]+\.[0-9]+' \
    | head -n1 \
    | grep -o -P '[0-9]+\.[0-9]+\.[0-9]+'
)
pkgrel=1
pkgdesc='Manager is free accounting software for small business'
arch=('i686' 'x86_64')
license=('custom')
url="http://www.manager.io/"
depends=('mono' 'gtk-sharp-3')
makedepends=('wget')
install=manager-accounting.install
options=('!makeflags')
source=(
  "LICENSE"
  "manager-accounting.png"
  "https://github.com/Manager-io/Manager.zip/releases/download/${pkgver}/Manager.zip"
)
sha256sums=(
  'bd144763506372341487683b0f28ad627e7e8923ea8ef8569541b55f4b987061'
  '1045ea9400e92c484cf751ac906d1589f8e2758b430b0861df09c161fe5cd044'
  'SKIP'
)

package() {
  install -d $pkgdir/usr/{bin,lib,lib/manager-accounting,share/{applications,icons}}

  # Generate desktop entry
  echo "[Desktop Entry]" > $pkgdir/usr/share/applications/manager-accounting.desktop
  echo "Name=Manager Accounting" >> $pkgdir/usr/share/applications/manager-accounting.desktop
  echo "Comment=Accounting software" >> $pkgdir/usr/share/applications/manager-accounting.desktop
  echo "Exec=/usr/bin/manager-accounting %f" >> $pkgdir/usr/share/applications/manager-accounting.desktop
  echo "Path=/usr/lib/manager-accounting" >> $pkgdir/usr/share/applications/manager-accounting.desktop
  echo "Terminal=false" >> $pkgdir/usr/share/applications/manager-accounting.desktop
  echo "Icon=manager-accounting" >> $pkgdir/usr/share/applications/manager-accounting.desktop
  echo "Type=Application" >> $pkgdir/usr/share/applications/manager-accounting.desktop
  echo "Categories=Office;" >> $pkgdir/usr/share/applications/manager-accounting.desktop

  # Generate main execution script
  echo "#!/bin/sh" > $pkgdir/usr/bin/manager-accounting
  echo "" >> $pkgdir/usr/bin/manager-accounting
  echo "cd /usr/lib/manager-accounting" >> $pkgdir/usr/bin/manager-accounting
  echo 'exec /usr/bin/mono /usr/lib/manager-accounting/ManagerDesktop.exe "$@"' >> $pkgdir/usr/bin/manager-accounting

  chmod 0755 $pkgdir/usr/bin/manager-accounting

  cp -r $srcdir/* $pkgdir/usr/lib/manager-accounting

  rm $pkgdir/usr/lib/manager-accounting/LICENSE
  rm $pkgdir/usr/lib/manager-accounting/Manager.zip
  rm $pkgdir/usr/lib/manager-accounting/manager-accounting.png

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 manager-accounting.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/manager-accounting.png"
}