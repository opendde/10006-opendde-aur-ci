# Maintainer: Det <nimetonmaili g-mail>
# Contributors: t3ddy, Lex Rivera aka x-demon, ruario

# Check for new Linux releases in: http://googlechromereleases.blogspot.com/search/label/Stable%20updates
# or use: $ curl -s https://dl.google.com/linux/chrome/rpm/stable/x86_64/repodata/other.xml.gz | gzip -df | awk -F\" '/pkgid/{ sub(".*-","",$4); print $4": "$10 }'

pkgname=google-chrome
pkgver=45.0.2454.85
pkgrel=1
pkgdesc="An attempt at creating a safer, faster, and more stable browser (Stable Channel)"
arch=('i686' 'x86_64')
url="https://www.google.com/chrome/index.html"
license=('custom:chrome')
depends=('alsa-lib' 'desktop-file-utils' 'flac' 'gconf' 'gtk2' 'harfbuzz' 'harfbuzz-icu' 'hicolor-icon-theme'
         'icu' 'libpng' 'libxss' 'libxtst' 'nss' 'opus' 'snappy' 'speech-dispatcher' 'ttf-font' 'xdg-utils')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE'
            'ttf-liberation: fix fonts for some PDFs')
makedepends=('pacman>=4.2.0')
provides=('google-chrome' 'pepper-flash')
options=('!emptydirs' '!strip')
install=$pkgname.install
_channel=stable
source=('google-chrome-stable'
        'eula_text.html')
source_i686=("google-chrome-${_channel}_${pkgver}_i386.deb::https://dl.google.com/linux/direct/google-chrome-${_channel}_current_i386.deb")
source_x86_64=("google-chrome-${_channel}_${pkgver}_amd64.deb::https://dl.google.com/linux/direct/google-chrome-${_channel}_current_amd64.deb")
md5sums=('9c9bd494c7cc5c98feff767be140a853'
         'b7e752f549b215ac77f284b6486794b6')
md5sums_i686=('2fc404c0fdd90c45acb5ed4d2cf38877')
md5sums_x86_64=('25d88e62552920168e5390040cc062f5')

package() {
  msg2 "Extracting the data.tar.lzma..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  msg2 "Moving stuff in place..."
  # Launcher
  install -m755 google-chrome-stable "$pkgdir"/usr/bin/

  # Icons
  for i in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
    install -Dm644 "$pkgdir"/opt/google/chrome/product_logo_${i/x*}.png \
                   "$pkgdir"/usr/share/icons/hicolor/$i/apps/google-chrome.png
  done

  # Man page
  gzip "$pkgdir"/usr/share/man/man1/google-chrome.1

  # License
  install -Dm644 eula_text.html "$pkgdir"/usr/share/licenses/google-chrome/eula_text.html

  msg2 "Fixing Chrome icon resolution..."
  sed -i "/Exec=/i\StartupWMClass=Google-chrome-$_channel" "$pkgdir"/usr/share/applications/google-chrome.desktop

  msg2 "Fixing permissions of documentation folder..."
  chmod 755 "$pkgdir"/usr/share/doc/google-chrome-$_channel/

  msg2 "Removing unnecessities (e.g. Debian Cron job)..."
  rm -r "$pkgdir"/etc/cron.daily/ "$pkgdir"/opt/google/chrome/cron/
  rm "$pkgdir"/opt/google/chrome/product_logo_*.png
}
