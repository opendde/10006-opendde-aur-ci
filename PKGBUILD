# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Poached from Arch Strike
# Original: ArchStrike <team@archstrike.org>

pkgname=enum4linux
pkgver=0.8.9
pkgrel=1
pkgdesc="A tool for enumerating information from Windows and Samba systems."
arch=('any')
url="http://labs.portcullis.co.uk/application/enum4linux/"
license=('GPL')
depends=('perl' 'smbclient' 'polenum' 'openldap')
source=(http://labs.portcullis.co.uk/download/enum4linux-$pkgver.tar.gz)
sha512sums=('3c3973ed85cbd585f5534a6871c4c07111d112d0be4e776780974e06ad4f0e47132a7d22e6c68658af5903811e9b87ef77e0b48e3dad848e2ebef5058b46ac83')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's|polenum.py|polenum|' ${pkgname}.pl
}

package() {
  cd "$srcdir/enum4linux-$pkgver"

  install -Dm755 enum4linux.pl "$pkgdir/usr/bin/enum4linux"
  install -Dm644 share-list.txt "$pkgdir/usr/share/enum4linux/share-list.txt"
}
