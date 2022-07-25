# Maintainer : Andrew Sachen <webmaster@RealityRipple.com>

pkgname=secondfaqtor
_realname=SecondFaqtor
pkgdesc="Two-Factor Authenticator"
pkgver=1.2.1
pkgrel=4
arch=('any')
url="https://realityripple.com/Software/Applications/SecondFactor/For-Linux/"
changelog=ChangeLog
license=('Unlicense')
depends=('gambas3-gb-image>=3.15' 'gambas3-gb-image<=3.99.0' 'gambas3-gb-qt5>=3.15' 'gambas3-gb-qt5<=3.99.0' 'gambas3-gb-form>=3.15' 'gambas3-gb-form<=3.99.0' 'gambas3-gb-data>=3.15' 'gambas3-gb-data<=3.99.0' 'gambas3-gb-dbus>=3.15' 'gambas3-gb-dbus<=3.99.0' 'gambas3-gb-desktop>=3.15' 'gambas3-gb-desktop<=3.99.0' 'gambas3-gb-form-stock>=3.15' 'gambas3-gb-form-stock<=3.99.0' 'gambas3-gb-openssl>=3.15' 'gambas3-gb-openssl<=3.99.0' 'gambas3-gb-sdl2-audio>=3.15' 'gambas3-gb-sdl2-audio<=3.99.0' 'gambas3-gb-util-web>=3.15' 'gambas3-gb-util-web<=3.99.0' 'gambas3-gb-desktop-x11>=3.15' 'gambas3-gb-desktop-x11<3.99.0' 'zbar')
makedepends=('gambas3-dev-tools')
source=("https://realityripple.com/Software/Applications/SecondFactor/For-Linux/AUR/SecondFaqtor-$pkgver.tar.bz2"{,.sig} "https://realityripple.com/Software/Applications/SecondFactor/For-Linux/AUR/secondfaqtor.desktop"{,.sig})
sha256sums=('abf04dd8a4d6d357a60a758e713308b467dd7bf0a2dfa45b86d769e29acff104' '7167084ffa987af932acfe0bd05e7b4306df7fff4909a6ec9831ffac152c6a6d' '70e6ce665d759ed7e6057ad3b5fbbd34413fdc50cbf7b813b4a80a83e8f3610d' '63d453bf8db7cfcbf1ec029a6ec57df9d35b66d35c908f206db6cf4f82514ac0')

validpgpkeys=('2BE391EF8EF9DB1E9BF546620B7C73813443493A') # Andrew Sachen

build() {
  cd ${srcdir}/SecondFaqtor

  gbc3 -e -a -g -t -x  && gba3
}

package() {
  cd ${srcdir}/SecondFaqtor

  install -d ${pkgdir}/usr/bin
  install -m755 SecondFaqtor.gambas ${pkgdir}/usr/bin/SecondFaqtor
  ln -s 'SecondFaqtor' "${pkgdir}"/usr/bin/'secondfaqtor'
  install -D icon.png \
    ${pkgdir}/usr/share/pixmaps/SecondFaqtor.png
  install -D ../secondfaqtor.desktop \
    ${pkgdir}/usr/share/applications/secondfaqtor.desktop
}
