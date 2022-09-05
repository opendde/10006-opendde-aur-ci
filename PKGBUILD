# Maintainer: Malte Jürgens <maltejur@dismail.de>

pkgname=revanced-builder
pkgver=3.4.2
pkgrel=5
pkgdesc="A NodeJS ReVanced builder"
arch=("x86_64")
url="https://github.com/reisxd/revanced-builder"
license=("GPL-3.0")
depends=("nodejs" "jdk-openjdk")
makedepends=("npm")
optdepends=(
  "android-tools: required only for rooted phones"
  "electron: for opening revanced-builder in a seperate window"
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/reisxd/revanced-builder/archive/refs/tags/v3.4.2.tar.gz"
  "revanced-builder.sh"
  "revanced-builder.desktop"
  "revanced.png::https://user-images.githubusercontent.com/13122796/178031589-aa43db16-46b0-4b75-bff9-cc889fbfbb40.png"
)
sha256sums=(
  "d7b9b251bddf0df755d89873e0949af5cae04c76e8dc40e0ab9086790d0800e6"
  "SKIP"
  "SKIP"
  "a619654e2e2d0c017c8a270d0463edf66c1e9d73ab105e52d89434b1356b1f7a"
)

build() {
  cd $pkgname-$pkgver
  npm i
}

package() {
  rm -rf "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/icons/hicolor/64x64/apps"
  mv -v $pkgname-$pkgver "$pkgdir/opt/$pkgname"
  mv -v revanced-builder.sh "$pkgdir/usr/bin/revanced-builder"
  mv -v revanced-builder.desktop "$pkgdir/usr/share/applications"
  mv -v revanced.png "$pkgdir/usr/share/icons/hicolor/64x64/apps"
}
