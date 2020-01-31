# Maintainer: Guten Ye <ywzhaifei at gmail dot com>
# Contributor: Marcel O'Neil <marcel at marceloneil dot com>
# Contributor: Paulo Ouverney <ph.ouverney at gmail dot com>

pkgname=exodus
pkgver=20.1.30
pkgrel=1
pkgdesc="All-in-one app to secure, manage and exchange blockchain assets"
arch=('x86_64')
url="https://exodus.io"
license=('custom')
depends=('gtk2' 'nss' 'libxss' 'glibc>=2.28-4')
source=("https://exodusbin.azureedge.net/releases/exodus-linux-x64-${pkgver}.zip"
	"${pkgname}.svg"
	"${pkgname}.desktop"
        "LICENSE")
sha256sums=('14db72a98c9c6de2510e5d11720fac239cf5cc7c0bbeeb51b0f8812af12fda4a'
            'ffafdcd0869f1c9338ba25e447698c4cfa3c8714123459ae3e63686a5312ef2e'
            '04676d81272a35a91150a7eec4640e69ca50f2e479d29fad8be90160ee74122c'
            '582d6782c9412cd961c55d105f38ed5c911bf8509be040b8d23a836504a25d0b')

package() {
  cd $srcdir/Exodus-linux-x64

  install -d $pkgdir/{opt/$pkgname,usr/bin}
  cp -a * $pkgdir/opt/$pkgname
  rm $pkgdir/opt/$pkgname/{LICENSE*,version}
  ln -s /opt/$pkgname/Exodus $pkgdir/usr/bin/$pkgname
  
  # Launcher
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  # Icons
  install -Dm644 $srcdir/$pkgname.svg \
                 $pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg

  # License
  install -Dm644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  chmod -R ugo+rX $pkgdir/opt
}
