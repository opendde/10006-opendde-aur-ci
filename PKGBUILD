# Maintainer: tdewolff <tacodewolff@gmail.com>
# Maintainer: 4679kun <4679kun@outlook.com>
# Maintainer: meepzh <meep.aur@meepzh.com>

pkgname=minify
pkgver=2.7.1
pkgrel=1
pkgdesc="Minifier CLI for HTML, CSS, JS, JSON, SVG and XML"
arch=('x86_64')
url="https://github.com/tdewolff/minify"
license=('MIT')
makedepends=('go-pie')
optdepends=('bash-completion: command-line autocomplete with bash')
source=("https://github.com/tdewolff/minify/archive/v$pkgver.tar.gz")
sha256sums=('21bac6097f74d8ee000a351c48b21b16fb70a34676d14fb50512954b7930e93f')

build() {
  cd "$pkgname-$pkgver/cmd/minify"
  go build -ldflags "-X 'main.Version=v$pkgver' -extldflags $LDFLAGS" -trimpath -o minify .
  source minify_bash_tab_completion
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "cmd/minify/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "cmd/minify/minify_bash_tab_completion" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}

