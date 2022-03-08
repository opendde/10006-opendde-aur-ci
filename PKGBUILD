# Maintainer: hannut
# Contributor: Leo_Verto
# Contributor: tsuflux
# Contributor: sekret

pkgname=roomeqwizard
pkgver=5.20.5
_pkgver=5_20_5
pkgrel=1
pkgdesc="A room acoustics analysis software for measuring and analysing room and loudspeaker responses"
arch=('any')
url="https://www.roomeqwizard.com"
license=('custom')
depends=('java-runtime=8' 'xdg-utils')
makedepends=('java-environment=8' 'fontconfig' 'freetype2')
source=("https://www.roomeqwizard.com/installers/REW_linux_$_pkgver.sh")
sha512sums=('68a8059295f197a1102fac091dec27f74deb05d2fb5cba1fbc23e113546bb9f832995136015200188eff0fe3a1a6695d4b9fe08a0c3eee6cf53ccfd514fcfec2')

package() {
  export INSTALL4J_JAVA_HOME_OVERRIDE=/usr/lib/jvm/default

  sh REW_linux_$_pkgver.sh -q -dir "$pkgdir/usr/share/java/$pkgname"

  mkdir -p "$pkgdir/usr/bin" \
           "$pkgdir/usr/share/icons" \
           "$pkgdir/usr/share/licenses/$pkgname" \
           "$pkgdir/usr/share/doc/$pkgname" \
           "$pkgdir/usr/share/applications/$pkgname"


  ln -s "/usr/share/java/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  mv "$pkgdir/usr/share/java/$pkgname/EULA.html" "$pkgdir/usr/share/licenses/$pkgname/"
  cp -L "$pkgdir/usr/share/java/$pkgname/REW.desktop" "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"
  rm "$pkgdir/usr/share/java/$pkgname/REW.desktop"

  cp "$pkgdir/usr/share/java/$pkgname/.install4j/i4j_extf_3_1byc03v_1rq5vvq.png" "$pkgdir/usr/share/icons/$pkgname.png"

  # repair
  sed "s%$pkgdir%%g" -i "$pkgdir/usr/share/java/$pkgname/.install4j/response.varfile"
  sed "s%$pkgdir%%g" -i "$pkgdir/usr/share/java/$pkgname/.install4j/install.prop"
  sed "s%$pkgdir%%g" -i "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"

  sed "s/REW/Room EQ Wizard/g" -i "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"
  echo "Icon=/usr/share/icons/$pkgname.png" >> "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"

  # fix waterfall crash
  # https://www.avnirvana.com/threads/rew-for-linux-waterfall-drawing-problem.2956/
  sed "s/^-Dsun.java2d.opengl=.*$/-Dsun.java2d.opengl=True/" -i "$pkgdir/usr/share/java/$pkgname/$pkgname.vmoptions"

  # basic cleanup
  rm -f "$pkgdir/usr/share/java/$pkgname/.install4j/files.log"
  rm -f "$pkgdir/usr/share/java/$pkgname/.install4j/installation.log"
  rm -f "$pkgdir/usr/share/java/$pkgname/.install4j/uninstall.png"
  rm -f $pkgdir/usr/share/java/$pkgname/.install4j/*.desktop
  rm -rf "$pkgdir/usr/share/java/$pkgname/uninstall"
}
