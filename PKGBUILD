# Maintainer: robertfoster

pkgname=megabasterd-bin
pkgver=7.54
pkgrel=1
pkgdesc="Yet another (unofficial) cross-platform MEGA downloader/uploader/streaming suite"
arch=('any')
url="https://github.com/tonikelope/megabasterd"
license=('GPL3')
depends=('java-runtime')
source=("https://github.com/tonikelope/megabasterd/releases/download/v${pkgver}/MegaBasterd_${pkgver}.jar"
  "${pkgname%%-bin}.sh"
  "${pkgname%%-bin}.desktop"
)

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/java/${pkgname%%-bin}"
  cp "MegaBasterd_$pkgver.jar" "$pkgdir/usr/share/java/${pkgname%%-bin}/${pkgname%%-bin}.jar"
  install -Dm755 "${pkgname%%-bin}.sh" "$pkgdir/usr/bin/${pkgname%%-bin}"
  install -Dm644 "images/pica_roja_big.png" "$pkgdir/usr/share/pixmaps/${pkgname%%-bin}.png"
  install -Dm644 "${pkgname%%-bin}.desktop" "$pkgdir/usr/share/applications/${pkgname%%-bin}.desktop"
}

sha256sums=('47df9d985bf6dbf05be564a4fd4188c7060f328b1498c14f40576c364d9f9c84'
            '72c7a1db49c5e58a6e6400a445758f7779a594789705dfeac954171d457af103'
            'a85b49dab7f58ab3c3b3e609a1c3c8e0fab2bedf5597a179aae82773681e7753')
