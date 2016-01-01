# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: matthewbauer <mjbauer95+aur@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: cantabile <cantabile dot desu at gmail dot com>

_pkgname=xdg-utils
pkgname=$_pkgname-mimeo
pkgver=1.1.1
pkgrel=2
pkgdesc="Command line tools that assist applications with a variety of desktop integration tasks; patched to use mimeo"
arch=('any')
url="https://wiki.freedesktop.org/www/Software/xdg-utils/"
license=('MIT')
depends=('sh' 'xorg-xset') # xset needed inside xdg-screensaver
makedepends=('docbook-xsl' 'lynx' 'xmlto' 'git')
optdepends=('kdebase-runtime: for KDE4 support in xdg-open'
            'kde-cli-tools: for KDE Plasma5 support in xdg-open'
            'libgnome: for GNOME support in xdg-open'
            'exo: for Xfce support in xdg-open'
            'xorg-xprop: for Xfce support in xdg-open'
            'pcmanfm: for LXDE support in xdg-open'
            'mimeo: for mimeo support in xdg-open'
            'perl-file-mimeinfo: for generic support in xdg-open')
provides=($_pkgname)
conflicts=($_pkgname)
source=(http://portland.freedesktop.org/download/$_pkgname-$pkgver.tar.gz{,.asc}
        mimeo-detection.diff)
md5sums=('2d0aec6037769a5f138ff404b1bb4b15'
         'SKIP'
         '1cedb9e77167a5f1e2ae12506b214883')
validpgpkeys=('8B75CA7811367175D05F3B03C43570F80CC295E6') # "Per Olofsson <pelle@pqz.se>"


prepare() {
	cd $_pkgname-$pkgver
	patch -p1 -i "${srcdir}"/mimeo-detection.diff
}

build() {
	cd $_pkgname-$pkgver
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd $_pkgname-$pkgver
	make DESTDIR="${pkgdir}" install
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# install empty directory to prevent xdg-desktop-menu install *.desktop to fail, see FS#33316
	install -dm755 $pkgdir/usr/share/desktop-directories
}
