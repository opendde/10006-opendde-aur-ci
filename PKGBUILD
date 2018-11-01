# maintainer : marin <turquoise.hexagon@protonmail.com>

pkgname=cherry-font
pkgver=1.1
pkgrel=1
pkgdesc="cherry, yet another bitmap font"
url="https://github.com/turquoise-hexagon/cherry"
source=("$pkgname::git+https://github.com/turquoise-hexagon/cherry")
licence=('MIT')
arch=('any')
makedepends=('git' 'xorg-font-utils')
install="$pkgname.install"
md5sums=('SKIP')
sha256sums=('SKIP')

build ()
{
    cd "$srcdir/$pkgname" || exit

    for b in *.bdf; do
        bdftopcf -o "${b/.bdf/.pcf}" "$b"
    done
}

package ()
{
    cd "$srcdir/$pkgname" || exit

    install -d -m755 "$pkgdir/usr/share/fonts/misc"
    install -D -m644 *.pcf "$pkgdir/usr/share/fonts/misc"
    install -D -m644 LICENSE "$pkgdir/usr/share/licences/$pkgname/LICENSE"
}
