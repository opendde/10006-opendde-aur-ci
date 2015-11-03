# Maintainer: Max Stabel <max dot stabel03 at gmail dot com>

pkgname=ltspice
pkgver=4.23h
pkgrel=1
pkgdesc="SPICE simulator, schematic capture and waveform viewer of electronic circuits."
arch=('i686' 'x86_64')
url="http://www.linear.com/designtools/software/"
license=('custom')
depends=('wine')
makedepends=('git')
source=("$pkgname::https://github.com/M4a1x/$pkgname/tarball/$pkgver"
        "$pkgname.sh"
        "$pkgname-help.sh")
sha256sums=('ec39330bc2d1baabb1c1ea6a66d7a31369f6240119b664995d5ed65196c7ed6d'
            '49474c013b674773a5509c226cf62fb75e4aaa91acf03f4501df6784b5efd513'
            'e7f7ff195bf21b36fd1c27108c2715da83620012cd00cd89046d96da0fee3f3a')

package()
{
    # Get commit hash automagically?
    cd "$srcdir/M4a1x-$pkgname-e7f9c64"

    # Install License
    install -D -m644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm License.txt

    # Install binary files to /usr/share
    mkdir -p "$pkgdir/usr/share/$pkgname"
    cp -r * "$pkgdir/usr/share/$pkgname"
    chmod 755 -R "$pkgdir/usr/share/$pkgname"

    #Install /usr/bin startscript
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm755 "$srcdir/$pkgname-help.sh" "$pkgdir/usr/bin/$pkgname-help"
}
