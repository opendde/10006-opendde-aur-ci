# Maintainer: Kevin Stolp <kevinstolp@gmail.com>
# Contributor: aksel <aksel@akseltorgard.com>

pkgname=aws-sam-cli-bin
pkgver=1.62.0
pkgrel=1
pkgdesc="CLI tool to build, test, debug, and deploy Serverless applications using AWS SAM"
arch=("x86_64")
url="https://github.com/aws/aws-sam-cli"
license=("Apache")
optdepends=("docker")
provides=("aws-sam-cli")
conflicts=("aws-sam-cli")
source=("aws-sam-cli-linux-$pkgver-x86_64.zip::https://github.com/aws/aws-sam-cli/releases/download/v$pkgver/aws-sam-cli-linux-x86_64.zip")
sha256sums=("90432cfe161f67cbc242d75dd2488e31eabacc3ff1ac51deb1726805beeb5586")

_remove_pkgdir_from_link() {
  local current_target="$(readlink "$1")"
  rm "$1"
  ln -s "${current_target#"$pkgdir"}" "$1"
}

package() {
  # Install
  $srcdir/install -i "$pkgdir/usr/share/aws-sam-cli" -b "$pkgdir/usr/bin" >/dev/null

  # Fix symlink for current version directory
  _remove_pkgdir_from_link "$pkgdir/usr/share/aws-sam-cli/current"

  # Fix symlinks in bin directory
  for i in $pkgdir/usr/bin/*; do
    _remove_pkgdir_from_link "$i"
  done
}
