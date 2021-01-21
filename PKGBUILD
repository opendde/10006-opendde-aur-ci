# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>
# Contributor: linuxer <linuxer@artixlinux.org>

pkgname=ananicy-s6
_alias=ananicy
pkgver=2.2.0.r55.g5559e01
pkgrel=1
pkgdesc="Ananicy - is Another auto nice daemon, with community rules support"
arch=('any')
url="https://github.com/Nefelim4ag/Ananicy"
license=('ISC')
depends=('ananicy' 's6' 'bash' 'schedtool')
makedepends=('git' 'make')
source=("ananicy.type"
        "ananicy.run"
        "ananicy.start"
        "ananicy.finish")
b2sums=('0d8b60c573270d0117b3613fa99b65d94b1a91c0029a07bfb1157d2a990e59636c4785b67dbf64bdf1cd17a77c55f71a041170c9a6edb81689053e6ee158d46e'
        '25551175031c7426bcb0a4169960a464494a0e16908865d9bd8abed8bb6ffb4958ebeded19fccd7483387f9ce02336582aa587ff7284ec85ae2ccfa663ffc89b'
        'SKIP'
        'SKIP')
install=$pkgname.install

package() {
  mkdir -p "$pkgdir/etc/s6/sv/$_alias"
  cp ananicy.run $pkgdir/etc/s6/sv/$_alias/run
  cp ananicy.type $pkgdir/etc/s6/sv/$_alias/type
  cp ananicy.start $pkgdir/etc/s6/sv/$_alias/start
  cp ananicy.finish $pkgdir/etc/s6/sv/$_alias/finish
  install=ananicy-s6.install
}
