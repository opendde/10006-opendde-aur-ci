# Contributor: Juanma Hernandez <juanmah@gmail.com>
# Maintainer: Juanma Hernandez <juanmah@gmail.com>

pkgname=zotero
pkgver=5.0.1
pkgrel=1
pkgdesc="Zotero Standalone. Is a free, easy-to-use tool to help you collect, organize, cite, and share your research sources."
arch=('i686' 'x86_64')
url="http://www.zotero.org/download"
license=('GPL3')
depends=('dbus-glib' 'alsa-lib' 'gtk2' 'gcc-libs' 'nss')
if [[ $CARCH == "x86_64" ]]
then
  _arch=x86_64
  md5sums=('969dbbc0bfaf1385d455d7fcae22e109'
           'f227abe95940abd63367716928c6e379')
else
  _arch=i686
  md5sums=('a8dc90f2c894581afd0afb11294f8882'
           'f227abe95940abd63367716928c6e379')
fi
install='zotero.install'
source=("http://download.zotero.org/standalone/$pkgver/Zotero-${pkgver}_linux-${_arch}.tar.bz2"
        "zotero.desktop")
        
package() {
  mkdir -p "$pkgdir"/usr/{bin,lib/zotero}
  mv "$srcdir"/Zotero_linux-$_arch/* "$pkgdir"/usr/lib/zotero
  ln -s /usr/lib/zotero/zotero "$pkgdir"/usr/bin/zotero
  install -Dm644 "$srcdir"/zotero.desktop "$pkgdir"/usr/share/applications/zotero.desktop
  # Copy zotero icons to a standard location
  install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default16.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/zotero.png
  install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/zotero.png
  install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default48.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/zotero.png
  install -Dm644 "$pkgdir"/usr/lib/zotero/chrome/icons/default/default256.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/zotero.png
}
