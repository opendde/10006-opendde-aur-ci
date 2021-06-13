# Maintainer: Philipp Klein <philipptheklein AT gmail DOT com>

pkgname=fazua-toolbox
pkgver=2.11
pkgrel=1
pkgdesc="Toolbox Software to update and customize the Fazua Energy Ride System"
arch=('x86_64')
url="https://fazua.com/de/support/help-center/toolbox-software/entry-toolbox-software/"
license=('unknown')
_filename="FAZUA_Toolbox_basic-linux-x86_64"

source=("https://fazua.com/documents/991/$_filename-$pkgver.zip"
        'fazua-toolbox.desktop'
        'logo-symbol.svg')

sha256sums=('6387c30f06d5c7955f8f559ce52f1eba5a3cd3ae533aae669830bd5fe67b7d9e'
            '4ccb4ac9cb702c208b76715af6cd125caca655b7378cfb528c103cb55db8b99c'
            '59e35260d3b42927040e6369c483998e7acedd112b26d89d1e226dbd9501169d')

package() {
    cd "$srcdir"

    install -Dm 644 99-ebike.rules "$pkgdir/usr/lib/udev/rules.d/99-ebike.rules"

    install -Dm 755 "$_filename-$pkgver" "$pkgdir/usr/bin/$pkgname"

    install -Dm 644 logo-symbol.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm 644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

