# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-desktop-wallet
_pkgname=cro-chain-desktop
pkgname=cro-chain-desktop-bin
pkgdesc='Crypto.com DeFi Desktop Wallet (AppImage version)'
license=('Apache')
url='https://github.com/crypto-com/chain-desktop-wallet'
pkgver=1.3.1
pkgrel=1
arch=('x86_64')
provides=('cro-chain-desktop')
conflicts=('cro-chain-desktop')
_pkgsrc="Crypto.com-DeFi-Desktop-Wallet-${pkgver}.AppImage"
source=(
  "${_pkgsrc}::${url}/releases/download/v${pkgver}/${_pkgsrc}"
  "LICENSE::https://raw.githubusercontent.com/crypto-com/chain-desktop-wallet/v${pkgver}/LICENSE"
)
sha512sums=('38e57875a129bbdab200cff2b40e69b0c86802e635bff50aa3e6e8111d6d46a851f3c106502887b49f0e475299fe9852aaa61ae4d1eb157a022ef5eb8e3ea246'
            'e21a90ebc22283c19f4535f263a0297a2428633572ddf19ec515496bd33fe70eacf3c3de63395307cd268330e8325b80e985190b2e92bbbf0079440aa84e89ea')

build() {
  # Extract files
  chmod +x "$srcdir/$_pkgsrc"
  $srcdir/$_pkgsrc --appimage-extract

  # Correct .desktop, icon
  mv -f "$srcdir/squashfs-root/usr/share/icons/hicolor/0x0" "$srcdir/squashfs-root/usr/share/icons/hicolor/512x512"
  sed -e "s/AppRun/${_pkgbin}/g" -i "$srcdir/squashfs-root/$_pkgbin.desktop"
}

package() {
  install -d "$pkgdir/opt/$_pkgname"
  cp -a "$srcdir/squashfs-root/." "$pkgdir/opt/$_pkgname/"
  rm -rf "${pkgdir}/opt/${_pkgname}/usr/share"
  rm -f "${pkgdir}/opt/${_pkgname}/chain-desktop-wallet.png"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgname/$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"

  install -d "$pkgdir/usr/share"
  cp -r "$srcdir/squashfs-root/usr/share/." "${pkgdir}/usr/share/"

  find "$pkgdir" -type d -exec chmod 755 {} +

  install -Dm644 "$srcdir/squashfs-root/$_pkgbin.desktop" "$pkgdir/usr/share/applications/$_pkgbin.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
