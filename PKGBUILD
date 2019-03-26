#Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname="mongodb-tools-bin"
pkgver="4.0.7"
basever="4.0"
pkgrel="1"
pkgdesc="The MongoDB tools provide import, export, and diagnostic capabilities."
arch=("x86_64")
url="https://github.com/mongodb/mongo-tools"
license=("Apache")
provides=("mongodb-tools=$pkgver")
conflicts=("mongodb-tools")
depends=("openssl")
optdepends=("mongodb-compass: The MongoDB GUI")
source=("https://repo.mongodb.org/apt/ubuntu/dists/bionic/mongodb-org/${basever}/multiverse/binary-amd64/mongodb-org-tools_${pkgver}_amd64.deb")

sha256sums=('11eb093303530af9864874a5cecb2058519448990a32e38206c5e0a566714457')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/output"
  tar -xvf "${srcdir}/data.tar.xz" -C "${srcdir}/output"
}

package() {
  mkdir -p "$pkgdir/usr"
  mkdir -p "$pkgdir/usr/share/man"
  cp -r "$srcdir/output/usr/bin" "$pkgdir/usr/"
  cp -r "$srcdir/output/usr/share/man/man1" "$pkgdir/usr/share/man/"
  rm "$pkgdir/usr/bin/install_compass"
}
