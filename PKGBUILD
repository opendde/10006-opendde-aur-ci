# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>
# Maintainer: Henry Pham <huy at tableplus dot com>

pkgname=tableplus
pkgver=0.1.38
pkgrel=1
pkgdesc="Modern, native, and friendly GUI tool for relational databases (Alpha)"
arch=('x86_64')
url="https://tableplus.com/"
license=('custom')
depends=('gtksourceview3' 'libgee')
source=('LICENSE'
        "https://deb.tableplus.com/debian/pool/main/t/tableplus/tableplus_${pkgver}_amd64.deb"
)
sha256sums=('76f924b1ebad5309ccf0dd7f3fe3d1b57ff3088b208a603900b0e240fdb5debb'
            '0827911de46af378468914c2f913e1119c54ede32ecc1f7adcbde1cbe3b71e37'
)

prepare() {
    cd "$srcdir"
    tar -xf data.tar.xz
}

package() {
    cd "$srcdir"

    install -d "$pkgdir/usr/local/bin/"
    install -d "$pkgdir/usr/share/applications/"
    install -d "$pkgdir/opt/tableplus/"

    install -Dm755 opt/tableplus/tableplus "$pkgdir/usr/local/bin/"
    install -Dm644 opt/tableplus/tableplus.desktop "$pkgdir/usr/share/applications/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cp -r opt/tableplus/resource "$pkgdir/opt/tableplus/"
    find opt/tableplus/ -type d -exec chmod 755 {} \;
    find opt/tableplus/ -type f -exec chmod 644 {} \;
}
