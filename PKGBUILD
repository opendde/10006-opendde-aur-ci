# Maintainer: Herbert Knapp <herbert.knapp@edu.uni-graz.at>
pkgname=waterfox-bin
pkgver=54.0.1
pkgrel=1
pkgdesc="64-Bit optimized Firefox, no data collection, allows unsigned extensions"
arch=('x86_64')
url="https://www.waterfoxproject.org/"
license=('GPL')
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'gtk3' 'sqlite' 'dbus-glib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=('waterfox.desktop' 'https://storage-waterfox.netdna-ssl.com/releases/linux64/installer/waterfox-'"${pkgver}"'.en-US.linux-x86_64.tar.bz2')
md5sums=('0e8dbbeaf61ad27b0f0d6c31038b529e' '672d8bf31906b36a2e5945b80520d428')

package() {
  install -d "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  install -m644 "${srcdir}"/waterfox.desktop "${pkgdir}"/usr/share/applications/
  install -m644 "${srcdir}"/waterfox/browser/icons/mozicon128.png "${pkgdir}"/usr/share/pixmaps/waterfox-icon.png
  cp -r waterfox "${pkgdir}"/opt/
  ln -s /opt/waterfox/waterfox "${pkgdir}"/usr/bin/
}
