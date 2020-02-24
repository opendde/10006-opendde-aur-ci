# Maintainer: Tyler Wolf <tjwolf0305@protonmail.com>

_commit=d97369a7ef153f6582f93e6d86d02cdf61f536f9
pkgname=wego-darksky
_pkgname=wego
pkgver=1.0
pkgrel=1
pkgdesc='Weather app for the terminal'
url=https://github.com/tylerwolf35/wego
arch=('x86_64')
license=('ISC')
depends=('glibc')
conflicts=('wego')
makedepends=('git' 'go')
source=("wego-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('c2088de3557738a269736aee1e8811d78a7ee6fc9e34e9a4d56c942a79b527e5')

prepare() {
  mkdir -p src/github.com/tylerwolf35
  ln -rsnf wego-$_commit src/${url#*//}
}

build() {
  cd wego-$_commit
  export GOPATH="$srcdir"
  go get -u -v github.com/schachmat/ingo
  go get -u -v github.com/mattn/go-colorable
  go get -u -v github.com/mattn/go-runewidth
  go build -v
}

package() {
  cd wego-$_commit
  install -Dm755 wego-$_commit "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}

# vim:set ts=2 sw=2 et: