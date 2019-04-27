# Maintainer: <andrew dot myers at wanadoo  dot fr>
pkgname=vpacman
pkgver=1.3.3
pkgrel=1
pkgdesc="A Graphical front end for pacman and the AUR"
arch=('any')
url="https://github.com/fdservices/vpacman"
license=('GPL')
depends=('tcl' 'tk' 'wmctrl')
optdepends=('pkgfile: for faster retrieval of package files'
			'xorg-xwininfo: for fine control of terminal windows'
			'gnome-terminal: preconfigured terminal emulator'
			'konsole: preconfigured terminal emulator'
			'lxterminal: preconfigured terminal emulator'
			'mate-terminal: preconfigured terminal emulator'
			'qterminal: preconfigured terminal emulator'
			'roxterm: preconfigured terminal emulator'
			'vte: preconfigured terminal emulator'
			'xfce4-terminal: preconfigured terminal emulator'
			'xterm: preconfigured terminal emulator (default)'
			)
source=(http://github.com/fdservices/$pkgname/archive/$pkgver.tar.gz)
md5sums=('9d48aa5963e5bb7479a36619308c9347')

package() {
    cd "$srcdir/$pkgname-$pkgver"
#   /usr/share/vpacman
    install -d "$pkgdir"/usr/share/vpacman
    install -m755 vpacman.tcl "$pkgdir"/usr/share/vpacman
    install -m644 README.txt "$pkgdir"/usr/share/vpacman
#   /usr/share/pixmaps/vpacman
    install -d "$pkgdir"/usr/share/pixmaps/vpacman
    install -d "$pkgdir"/usr/share/pixmaps/vpacman/medium
    install -d "$pkgdir"/usr/share/pixmaps/vpacman/small
    install -d "$pkgdir"/usr/share/pixmaps/vpacman/tiny
    install -m644 icons/medium/* "$pkgdir"/usr/share/pixmaps/vpacman/medium
    install -m644 icons/small/* "$pkgdir"/usr/share/pixmaps/vpacman/small
    install -m644 icons/tiny/* "$pkgdir"/usr/share/pixmaps/vpacman/tiny
#   /usr/bin
    install -d "$pkgdir"/usr/bin
    install -m755 vpacman "$pkgdir"/usr/bin/
#   /usr/share/applications
    install -d "$pkgdir"/usr/share/applications
    install -m644 vpacman.desktop "$pkgdir"/usr/share/applications/
}

























