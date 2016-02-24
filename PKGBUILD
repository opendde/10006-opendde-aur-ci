# Maintainer: 4679kun <btchina@live.com>
# Contributors: osfans <waxaca at 163.com>

pkgname=firefox-beta-bin-zh
_pkgname=firefox-beta
pkgver=45.0b8
_major=${pkgver/rc*}
_build=${pkgver/*rc}
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org - Beta with Simplified Chinese language"
arch=('i686' 'x86_64')
url="https://www.mozilla.org/zh-CN/firefox/channel/#beta"
license=('MPL' 'GPL' 'LGPL')
depends=('alsa-lib' 'dbus-glib' 'desktop-file-utils' 'gtk2' 'gtk3' 'hicolor-icon-theme'
         'icu' 'libevent' 'libvpx' 'libxt' 'mime-types' 'nss' 'sqlite')
optdepends=('ffmpeg: additional video and audio decoders'
            'libpulse: PulseAudio driver'
            'networkmanager: Location detection via available WiFi networks')
makedepends=('pacman>=4.2.0')
provides=("firefox=$pkgver")
install=$pkgname.install
source=("$pkgname.desktop"
        "$pkgname-safe.desktop")
source_i686=("https://ftp.mozilla.org/pub/firefox/releases/$pkgver/linux-i686/zh-CN/firefox-$pkgver.tar.bz2")
source_x86_64=("https://ftp.mozilla.org/pub/firefox/releases/$pkgver/linux-x86_64/zh-CN/firefox-$pkgver.tar.bz2")
# RC
if [[ $_build = ? ]]; then
  source_i686=("https://ftp.mozilla.org/pub/firefox/candidates/$_major-candidates/build$_build/linux-i686/zh-CN/firefox-$_major.tar.bz2")
  source_x86_64=("https://ftp.mozilla.org/pub/firefox/candidates/$_major-candidates/build$_build/linux-x86_64/zh-CN/firefox-$_major.tar.bz2")
fi
sha512sums=('80c74b084034de91bc9ec24aa8f858660428b3f33cf991c9a28728217fa7aedc856fe9e44bd0dc683edba3f3c960908998adb5498cc17441f15eb9c2c339fcdd'
            'ff658992ce05b74c63d2ed945e768d25a59dd4ee41054db07c66a2e38ddbf6132e206071e9995192e46d55210f6c41b1e641609d78c97016183e54edcf1b4625')
sha512sums_i686=('440f490f516d6f59914dd03ad8d95d343c32fab5250cf16349214e0c8259d8664dec21d406b2979eb4768d2b0a1b708e34ca316ccbc79633767f6c224cdf630d')
sha512sums_x86_64=('1e5c205c7a108e8bcac9a96f244e7b2e36aa1a433e879425cbcc26ea488cc500104e349c917c934ce0d404cc678b90df0cfd5bb97cc40983e4db97ad76433710')

package() {
  # Create directories
  msg2 "Creating directory structure..."
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications
  mkdir -p "$pkgdir"/usr/share/icons/hicolor/128x128/apps
  mkdir -p "$pkgdir"/opt

  msg2 "Moving stuff in place..."
  # Install
  cp -r firefox/ "$pkgdir"/opt/$_pkgname

  # /usr/bin symlinks
  ln -s /opt/$_pkgname/firefox "$pkgdir"/usr/bin/$_pkgname
  ln -s /opt/$_pkgname/firefox "$pkgdir"/usr/bin/$pkgname  # compatibility

  # Desktops
  install -m644 *.desktop "$pkgdir"/usr/share/applications/

  # Icons
  for i in 16x16 22x22 24x24 32x32 48x48 256x256; do
    install -d "$pkgdir"/usr/share/icons/hicolor/$i/apps/
    ln -s /opt/$_pkgname/browser/chrome/icons/default/default${i/x*}.png \
          "$pkgdir"/usr/share/icons/hicolor/$i/apps/$_pkgname.png
  done

  # 128x128
  ln -s /opt/$_pkgname/browser/icons/mozicon128.png \
        "$pkgdir"/usr/share/icons/hicolor/128x128/apps/$_pkgname.png
}
