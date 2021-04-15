# Maintainer: Ben Mitchell <dezyh@outlook.com>
pkgname=patchup-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A tool to compute and apply binary patches for files and directories"
url="https://github.com/dezyh/patchup/cli"
license=("MIT")
arch=("x86_64")
provides=("patchup")
source=("https://github.com/dezyh/patchup/cli/releases/download/v$pkgver/patchup-$pkgver-x86_64.tar.gz")
sha256sums=("193357a14205e8d74df5d691d6f8566e5a0eb70dd1d55d5dab26c70a5405c62a")

package() {
    install -Dm755 patchup -t "$pkgdir/usr/bin/"
}
