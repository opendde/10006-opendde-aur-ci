# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=oxy
pkgver=3.0.0+dev1+102+g2f2abc9
_commit=2f2abc9e351b52656e08b343976fd8cefc318657
pkgrel=1
pkgdesc='SSH-alike that uses the Noise protocol'
arch=(i686 x86_64)
url=https://github.com/oxy-secure/oxy
license=(BSD)
makedepends=(git rust)
conflicts=(oxy-git)
source=(git+$url#commit=$_commit)
sha512sums=(SKIP)

pkgver() {
  cd oxy
  echo "$(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2 | sed s/-/+/)+$(git rev-list --count HEAD)+g$(git describe --always)"
}

build() {
  cd oxy
  cargo build --release --locked
}

check() {
  cd oxy
  cargo test --release --locked || true
}

package() {
  cd oxy
  install -D target/release/oxy "$pkgdir"/usr/bin/oxy
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/oxy/LICENSE
}
