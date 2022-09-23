# Maintainer: Bryan Malyn <bim9262 at gmail dot com>

pkgname=wl-gammarelay-rs
pkgver=0.3.0
pkgrel=1
pkgdesc="Like wl-gammarelay, but written in rust, runs on a single thread, has three times less SLOC and uses DBus (for simplicity)"
makedepends=('cargo')
arch=('any')
url="https://github.com/MaxVerevkin/wl-gammarelay-rs"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f4f48afd26fc0b0e8ec4aa69e7f39f7a8d596eff6c22aaeca84e1cb202f18f80')
sha512sums=('09344b2ef69f8514477a87f26d776280d48675845557936ab8d237b73b7b8425fc2e5a017622a198462279b8dc9efe4016a5767c39dbd8804d9a8e6f19cbc4a4')
b2sums=('4333c037574ad3f678a1d381a2926d9e0cfc00906eee0defe615551dfc4df93b650af7c43a8faaca0a24781ec2a452d7ef4ef6a11274758c4bd70eae56144b28')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
