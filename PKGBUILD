# Maintainer: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>
pkgname=webex-bin
pkgver=42.3.0.21576
pkgrel=2
pkgdesc="Webex for Linux"
arch=('x86_64')
url="https://www.webex.com/"
license=('custom')
depends=('alsa-lib'
         'at-spi2-atk'
         'at-spi2-core'
         'atk'
         'binutils'
         'krb5'
         'libcups'
         'libnotify'
         'libpulse'
         'libsecret-mr94'
         'libxcb'
         'libxcrypt-compat'
         'libxkbcommon-x11'
         'mesa'
         'nspr'
         'nss'
         'pango'
         'systemd-libs'
         'upower'
         'wayland'
         'xcb-util-image'
         'xcb-util-keysyms'
         'xcb-util-renderutil'
         'xcb-util-wm'
         'xdg-utils')
source=("$pkgname-$pkgver.deb::https://binaries.webex.com/WebexDesktop-Ubuntu-Gold/20220302031155/Webex.deb"
        'webex.xml')
sha256sums=('5c54df0f70804ad1e8c8e49db8a207941fc038a15afeaf550614ae5ed1aad42d'
            '0d0b2664ac4aeb9a4a4b9f530dee4a14c13875735b87a3d96bf81f43eeec00ab')
options=('!strip')

prepare() {
    mkdir -p "$pkgname-$pkgver"
    tar -Jxf data.tar.xz -C "$pkgname-$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    cp -dpr --no-preserve=ownership opt/ "$pkgdir/"
    rm "$pkgdir/opt/Webex/lib/libstdc++.so.6"

    mkdir -p "$pkgdir/usr/share/applications/"
    mv "$pkgdir/opt/Webex/bin/webex.desktop" "$pkgdir/usr/share/applications/"

    mkdir -p "$pkgdir/usr/share/mime/packages/"
    install -m0644 "${srcdir}/webex.xml" "${pkgdir}/usr/share/mime/packages/"

    mkdir -p "$pkgdir/usr/bin/"
    ln -s "/opt/Webex/bin/CiscoCollabHost" "$pkgdir/usr/bin/webex"
}
