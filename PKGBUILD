# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Poached from Arch Strike
# Original: ArchStrike <team@archstrike.org>

pkgname=polenum
pkgver=1.6.1
pkgrel=2
pkgdesc="A python script to extract the password policy information from a windows machine."
arch=('any')
url="https://github.com/Wh1t3Fox/polenum"
license=('GPLv3')
depends=('impacket' 'python')
source=("https://github.com/Wh1t3Fox/polenum/archive/${pkgver}.tar.gz")
sha512sums=('adef8bd74d51e1b8e6bf79bb1acce3728ac6dd2480ced231a76633d5ecb18d791a2f1de39d6f21a07808c9e3314ea561239d9c4507206cbdaecf87318a1e34a3')

package() {
  cd "$srcdir/polenum-${pkgver}"

  # Bin.
  install -Dm755 polenum.py "${pkgdir}/usr/bin/polenum"

}
