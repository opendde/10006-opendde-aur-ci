# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Attila Bukor <r1pp3rj4ck[at]w4it[dot]eu>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Slava Volkov <sv99sv[at]gmail[dot]com>

pkgname=phpstorm
_pkgname=PhpStorm
pkgver=2016.2
_pkgver=162.1121.38
pkgrel=1
pkgdesc="Lightweight and Smart PHP IDE"
arch=('x86_64' 'i686')
options=('!strip')
url="http://www.jetbrains.com/${pkgname}/"
license=('Commercial')
optdepends=('java-environment>=8: use system java'
            'java-runtime-common: use system java')
source=(https://download.jetbrains.com/webide/${_pkgname}-${pkgver}.tar.gz
        jetbrains-phpstorm.desktop
        phpstorm.sh)
sha512sums=('43b25651ecb51f7754124d8c401d8facfa87148f8ddce4e7b5e545fbdd787ac596fff90f5cdc695a3c57ef486e5f8e52607b042f72f77bb8df93dbc7fdd2bef3'
            'b258ff195aa7d49e2e8e7b3eda4fc5d69f09e287411d912d8961b787d69b5d0f327589fc2cdce442edbaee7c685eadf2bf6d54d3ae5c720ba02bd1b5cdba3e74'
            '1a3dfed871b4a23071830792b682fba7263c1c9cbd10f0948fb83ad75b4e1ef33f1ad15f5eb89c690f99ae787be1933906eeec0fd15be97ead72ca913d3c2aee')

package() {
  install -d -m 755 ${pkgdir}/opt/
  install -d -m 755 ${pkgdir}/usr/bin/
  install -d -m 755 ${pkgdir}/usr/share/applications/
  install -d -m 755 ${pkgdir}/usr/share/pixmaps/
  install -d -m 755 ${pkgdir}/etc/profile.d/

  cp -a ${srcdir}/${_pkgname}-${_pkgver} $pkgdir/opt/${pkgname}
  # if using system java you may remove the bundled jre and save about 100M
  #rm -rf $pkgdir/opt/${pkgname}/jre

  ln -s /opt/$pkgname/bin/${pkgname}.sh $pkgdir/usr/bin/${pkgname}
  install -D -m 644 ${srcdir}/jetbrains-${pkgname}.desktop ${pkgdir}/usr/share/applications/
  install -D -m 644 ${srcdir}/${pkgname}.sh ${pkgdir}/etc/profile.d/
  install -D -m 644 "${pkgdir}/opt/${pkgname}/bin/webide.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
