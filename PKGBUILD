# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=mediarepo
pkgver=1.0.0_rc.4
pkgrel=1
pkgdesc='A tag based media management tool for images, videos, audio and more'
arch=(x86_64)
url=https://github.com/trivernis/mediarepo
license=(GPL3)
optdepends=('mediarepo-daemon=1.0.0_rc.4: backend for local repositories')
makedepends=(curl wget openssl appmenu-gtk-module gtk3 libappindicator-gtk3 webkit2gtk patchelf libvips clang cargo yarn nodejs-lts-gallium npm python node-gyp)

options=(!strip)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/Trivernis/mediarepo/archive/v1.0.0-rc.4.tar.gz
  mediarepo.desktop
)
sha512sums=(
  '23c3688bd944b946456b824e12b8d52445eac553f7df4a3f275db69f3bafdfd88d9912b871c17b8256e13fb41f6a114b657b65230f71d52039716debe058d15c'
  'be877fb4e9571ca174e1fb38eb87e4d2fd2aac95938aa19466f7f5677da1957607a75acc5c1b2c2ae0bd76d389f9958ff4e0563339233e8f33e834ba4a8d398b'
)

prepare() {
  cd $pkgname-1.0.0-rc.4/mediarepo-ui
  yarn add -D @tauri-apps/cli
  yarn install
  cd src-tauri
  cargo fetch
}

build() {
  cd $pkgname-1.0.0-rc.4/mediarepo-ui
  yarn tauri build --bundles "deb"
}

package() {
  cd $pkgname-1.0.0-rc.4/mediarepo-ui/src-tauri/target/release

  install -d "$pkgdir"/usr/{lib,bin}
  cp -a mediarepo-ui "$pkgdir"/usr/lib/mediarepo-ui
  ln -s /usr/lib/mediarepo-ui "$pkgdir"/usr/bin
  cd ../../../..

  install -Dm 644 ../mediarepo.desktop -t "$pkgdir"/usr/share/applications
  for i in 32 64 128; do
    install -Dm 644 mediarepo-ui/src-tauri/icons/${i}x${i}.png \
      "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/mediarepo.png
  done
  install -Dm 644 mediarepo-ui/src/assets/icon.svg \
    "$pkgdir"/usr/share/icons/hicolor/scalable/apps/mediarepo.svg
}
