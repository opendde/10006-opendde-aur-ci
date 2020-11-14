# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

_pkgname=terminal-typeracer
pkgname=typeracer-bin
pkgver=2.0.4
pkgrel=1
pkgdesc="Terminal typing speed tester"
arch=('x86_64')
url="https://gitlab.com/ttyperacer/terminal-typeracer"
license=('GPL3')
depends=('openssl' 'zlib')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/uploads/f8b8d4b1c7fca37aca68c36452df1e3a/${pkgname%-bin}"
              "$pkgname-$pkgver-README.md::$url/-/raw/v$pkgver/README.md")
sha512sums_x86_64=('623cdcf28d1218ac74fe968ecc349fdc612b5934f3646e96a76857cafd637755dbfd573d50107ac24ac15ba3437e8699b0e06d823347045274a75c99167ec3e1'
                   'ceb9c22dfba27efc85d47451ab06a66fc8bf650f7bb579c86164e7fc2059d69e0274992fcd405689cca5d58a2c424f897ef583b557e9cfa5e55c8857d8889cb7')

package() {
  install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
}
