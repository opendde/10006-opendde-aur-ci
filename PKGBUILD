# Maintainer: ransome <mail@robbfolio.de>
pkgname="sleek"
pkgver=1.1.9
pkgrel=1
pkgdesc="Todo manager based on the todo.txt syntax for Linux, free and open-source (FOSS)"
arch=("x86_64")
url="https://github.com/ransome1/sleek/"
license=("MIT")
options=(!strip)
makedepends=("yarn" "nodejs" "unzip")
depends=("electron" "nodejs")

source=("${url}archive/refs/tags/v${pkgver}.zip" "sleek.desktop" "sleek")
sha512sums=('1cb3da6ed082fa197a1916763bf9543f5481356085171e1aa08e4ea4631c4d0ab7e4c0759f107edc5ce0f0ecf754cb1d9d5d90bf5a0414489081db9ad279e5c4'
            'c3ebfc99947ba484d8ba8a3cd9b4c4d5a984a95e7cb24faac1ac59506f7f144d4e9c92ea9fcfa585f4d9fee779366d4eb9db0795c910fb221bb266e3c9d5be24'
            'ea1d322bd56c7944a9eae97f4968a6a2e937b510eb3c1c21266428450c5b2ddcd8576718d0b66b69fbce5694ba94e80a692d04bda1e8c2b24a8d814a5ed50963')

build() {
  msg2 "Unzipping v${pkgver}.zip"
  unzip -o "v${pkgver}.zip"
  cd "$srcdir/$pkgname-${pkgver}"

  msg2 "Installing node modules"
  yarn install
}

package() {
  cd "$srcdir/$pkgname-${pkgver}"

  msg2 "Building sleek with packaged Electron"
  yarn run pack
  install -Dm644 "dist/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname.asar"
  install -d -Dm644 "${pkgdir}/usr/share"
  chmod 755 "${pkgdir}/usr/share"
  cp -r "dist/linux-unpacked/${pkgname}" "${pkgdir}/usr/share"

  msg2 "Installing LICENSE"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 "Installing startup script and desktop file"
  install -Dm755 "../${pkgname}" -t "$pkgdir/usr/bin/"
  install -Dm644 "../${pkgname}.desktop" -t "$pkgdir/usr/share/applications/"

  msg2 "Installing icons"
  for size in 22 24 32 48 64 128 256 512; do
    install -Dm644 "assets/icons/${size}x${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
  done
  install -Dm644 "assets/icons/512x512.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"
}
