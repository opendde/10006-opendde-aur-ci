# Maintainer: <andrew dot myers at wanadoo  dot fr>
pkgname=storecards
pkgver=0.2
pkgrel=1
pkgdesc="Keep all your store cards on your linux phone"
arch=('any')
url="https://github.com/fdservices/storecards"
license=('GPL')
depends=('tcl' 'tk' 'zint')
optdepends=('sane: for scanning Store Cards'
	    'imagemagick: for converting scanned images'
	    'pinephone-toolkit: to raise the backlight for barcode scanning'
	)
source=(http://github.com/fdservices/$pkgname/archive/$pkgver.tar.gz)
md5sums=('32ada989b7be87b06c3e1eb2b51ff59a')

package() {
    cd "$srcdir/$pkgname-$pkgver"
#   /usr/share/pixmaps/storecards
    install -d "$pkgdir"/usr/share/pixmaps/storecards
    install -m644 icons/* "$pkgdir"/usr/share/pixmaps/storecards
#   /usr/bin
    install -d "$pkgdir"/usr/bin
    install -m755 storecards "$pkgdir"/usr/bin/
#   /usr/share/applications
    install -d "$pkgdir"/usr/share/applications
    install -m644 storecards.desktop "$pkgdir"/usr/share/applications/
#   ~/.local/share/storecards
    path="${HOME}/.local/share"
    group=`id -gn ${USER}`
    install -d -o ${USER} -g ${group} "$pkgdir"$path/storecards
    install -m644 -o ${USER} -g ${group} data/* "$pkgdir"$path/storecards
}
