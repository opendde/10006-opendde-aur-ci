# Maintainer: alexiobash <me @ alexiobash.com>

pkgname=conky-top
pkgver=1.6
pkgrel=1
pkgdesc="A Top conky-lua for ArchLinux"
arch=('any')
url="http://alexiobash.com/conky-top-monitor-di-sistema-a-pannello/"
license=('GPL')
depends=('conky-lua' 'perl-mail-imapclient' 'perl-io-socket-ssl' )
source=("$pkgname::git+http://git.alexiobash.com/git/$pkgname")
install="${pkgname}.install"
md5sums=('SKIP')

package() {
	cd $srcdir/$pkgname
	make DESTDIR=${pkgdir} install
}


