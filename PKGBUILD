# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=fish-fzf
pkgver=7
pkgrel=1
pkgdesc="fzf key-bindings into fish"
arch=('any')
url="https://github.com/PatrickF1/fzf.fish"
license=('MIT')
groups=('fish-plugins')
depends=('fish>=3.2' 'fzf>=0.25')
optdepends=('fd>=7.5.0: faster, friendlier alternative to find'
            'bat>=0.16.0: smarter cat with syntax highlighting'
            'git')
makedepends=('git')
# checkdepends=('fish-fishtape')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e633716251bb066e2ac7805f24fd261f430c03820b63d35cd3bee90ec5ff936960e50a1775fb1655313a17fe66c11e6f498ed01ee60bc51d7d7e9602276cb3c8')

# check() {
#   cd "fzf.fish-$pkgver/"
#   find tests -type f -exec fish -Pc 'fishtape {}' \;
# }

package() {
  cd "fzf.fish-$pkgver/"
  install -Dm 644 conf.d/fzf.fish "$pkgdir/etc/fish/conf.d/fzf.fish"
  find functions -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/fish/{}" \;
  install -Dm 644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
