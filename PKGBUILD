# Maintainer: Florian Jacob <projects+arch AT florianjacob )DOT( de>
pkgname=earlyoom
pkgver=0.12
pkgrel=1
pkgdesc="Early OOM Daemon for Linux"
arch=('any')
url="https://github.com/rfjakob/earlyoom"
license=('MIT')
source=(
	"https://github.com/rfjakob/$pkgname/archive/v$pkgver.tar.gz"
)
sha256sums=('854c4b2d02cf630db6128eb46275416b97fc48c917c7f9f9af9b84c8065da09e')

build() {
	cd "$pkgname-$pkgver"
	# earlyoom tries to get the version number from the git repo, but we're packaging tarballs here, so that would fail.
	make VERSION=$pkgver
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="${pkgdir}"
	PREFIX="/usr"
	SYSTEMDDIR="${PREFIX}/lib/systemd"
	export DESTDIR
	export PREFIX
	export SYSTEMDDIR

	make install
	# make install doesn't install the manpage for some reason
	gzip earlyoom.1
	install -Dm644 earlyoom.1.gz "${DESTDIR}${PREFIX}/share/man/man1/earlyoom.1.gz"
}
