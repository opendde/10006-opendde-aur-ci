# Maintainer: Šarūnas Gliebus <ssharunas at yahoo.co.uk>
pkgname=boram
pkgver=0.4.0
pkgrel=1
pkgdesc="Cross-platform WebM converter"
arch=('x86_64')
url="https://github.com/Kagami/boram"
license=('CC0-1.0')
depends=('mpv' 'ffmpeg')
source=(https://github.com/Kagami/boram/releases/download/v$pkgver/$pkgname-v$pkgver-linux-x64.7z)
md5sums=('b5f9bc1f85209ce16eb75522edb58958')

package() {
  mkdir -p "$pkgdir/opt/"
  mkdir -p "$pkgdir/usr/bin/"
  
  cp -r "$srcdir/$pkgname-v$pkgver-linux-x64/" "$pkgdir/opt/$pkgname"
  find "$pkgdir/opt/$pkgname" -type f -exec chmod 644 -- {} +
  find "$pkgdir/opt/$pkgname" -type d -exec chmod 755 -- {} +
  
  chmod 655 "$pkgdir/opt/$pkgname/boram"
  chmod 655 "$pkgdir/opt/$pkgname/resources/app/checklib"
  
  ln -s "/opt/$pkgname/boram" "$pkgdir/usr/bin/boram"
}
