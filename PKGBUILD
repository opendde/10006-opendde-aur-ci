# Maintainer: Jeremy Pope <jpope at jpope dot org> PGP-Key: E00B4261
pkgname=breeze-purple-cursor-theme
pkgver=1.0
pkgrel=3
pkgdesc="Breeze Purple cursor theme."
arch=('any')
url="https://kver.wordpress.com/2015/01/09/curses-i-mean-cursors/"
license=('GPL')
source=("https://code.jpope.org/jpope/breeze_cursor_sources/raw/master/breeze-purple-cursor-theme.zip")
makedepends=('unzip')

sha256sums=('ed7944b0175b455b5ebce8b0937936a5defda992f54830d5ef98b90a8d422b11')

package() {
    cd $srcdir/Breeze_Purple
    install -d $pkgdir/usr/share/icons/Breeze_Purple
    cp -rf *   $pkgdir/usr/share/icons/Breeze_Purple
    chmod -R 644 $pkgdir/usr/share/icons/Breeze_Purple/*
    chmod 755 $pkgdir/usr/share/icons/Breeze_Purple
    chmod 755 $pkgdir/usr/share/icons/Breeze_Purple/cursors
}
