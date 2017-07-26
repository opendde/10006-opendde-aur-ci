# Maintainer: Håvard Pettersson <mail@haavard.me>

pkgname=simplicitystudio3
pkgver=3.3
pkgrel=3
pkgdesc='Design tools, documentation, software and support resources for EFM32™, EFM8™, 8051, Wireless MCUs and Wireless SoCs.'
arch=(i686 x86_64)
url='https://www.silabs.com/products/development-tools/software/simplicity-studio-version3'
license=('unknown')

# should probably put something here but most dependencies are included
depends_i686=(gtk2 libxtst)
depends_x86_64=(lib32-gtk2 lib32-libxtst)

options=('!strip')

source=(http://www.silabs.com/Support%20Documents/Software/SimplicityStudio.tgz
        simplicitystudio3)
sha256sums=('06d675b4d498cc939aaffcdae5abbb9ae7dc3bb1238117bc467b2db8f21de51b'
            'ce8ba5d1b75f19da2f5f27b18c811fa7348cfda12684575175770c1aeb5507c6')

prepare() {
    # create desktop file and run script
    gendesk -f -n --pkgname ${pkgname} --pkgdesc "${pkgdesc}" --exec="${pkgname}"
}

package() {
    install -dm755 "$pkgdir/opt/"
    install -dm755 "$pkgdir/usr/share/applications/"
    install -dm755 "$pkgdir/etc/udev/rules.d"

    cp -a $srcdir/SimplicityStudio_v3/common/tcf/plugins/*.rules "$pkgdir/etc/udev/rules.d/"
    cp -a "$srcdir/SimplicityStudio_v3" "$pkgdir/opt/$pkgname"

    # installation directory has to be writable
    find "$pkgdir/opt/$pkgname" -type d -exec chmod a+w {} +
    find "$pkgdir/opt/$pkgname" -type f -exec chmod a+w {} +

    install -Dm755 "$srcdir/simplicitystudio3" "$pkgdir/usr/bin/$pkgname"
    sed -i "s/^pkgname=.*/pkgname=$pkgname/" "$pkgdir/usr/bin/$pkgname"

    # install .desktop file and icon
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "$srcdir/SimplicityStudio_v3/icon.xpm" "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
}
