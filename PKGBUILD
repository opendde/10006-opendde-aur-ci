# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=hunter-git
pkgver=1.1.0
pkgrel=2
pkgdesc='ranger-like file browser written in Rust (git)'
arch=(i686 x86_64)
url=https://github.com/rabite0/hunter
license=(WTFPL)
depends=(file)
makedepends=(git rust)
optdepends=('ranger: to open files using rifle')
provides=(hunter)
conflicts=(hunter hunter-holy hunter-holy-git)
source=(git+$url)
sha512sums=(SKIP)

pkgver() {
  cd hunter
  git describe --tags | sed 's/v//;s/-/+/g'
}

build() {
  cd hunter
  cargo build --release
}

package() {
  cd hunter
  install -D {target/release/hunter,extra/scope.sh} -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/hunter-holy
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/hunter
}
