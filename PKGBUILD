# Maintainer: David Barri <japgolly@gmail.com>
pkgname=atomicwallet
pkgver=2.30.0
pkgrel=1
_pkgver_suffix=137
pkgdesc="Atomic Wallet is a decentralized Cryptocurrency wallet that supports more than 500 coins and tokens, providing simplicity, safety, and convenience for its users."
arch=('x86_64')
url="https://atomicwallet.io"
license=('unknown')
source=("https://get.atomicwallet.io/download/atomicwallet-$pkgver-$_pkgver_suffix.rpm")
sha256sums=('e9bd63f892481c12d39e3e21b367edc241c9d0acd094e0d52de9f532d7e1bfc3')

package() {
  set -e

  mv opt usr "$pkgdir"

  cd "$pkgdir/usr"
  mkdir bin
  cd bin
  ln -s "../../opt/Atomic Wallet/atomic" atomicwallet
}
