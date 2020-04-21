# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=dovecot-fts-elastic
_reponame=fts-elastic
pkgver=0.164ef965b
pkgrel=1
pkgdesc="Dovecot FTS plugin for elasticsearch"
arch=(x86_64)
url="https://github.com/filiphanes/fts-elastic"
license=(MIT)
depends=(dovecot elasticsearch json-c)
makedepends=(git)
backup=('etc/dovecot/conf.d/90-fts.conf')

source=("git+https://github.com/filiphanes/fts-elastic"
	    "90-fts.conf")

sha256sums=('SKIP'
            '3442fa7350055c7328bcdf2f666727b9a5d8c942a0bfe93044db344c80ad7e69')
install=dovecot-fts-elastic.install

build() {
	cd "${_reponame}"

	./autogen.sh
	./configure \
		--prefix=/usr \
		--with-dovecot=/usr/lib/dovecot

	make
}

package() {
	install -Dm644 90-fts.conf "$pkgdir"/etc/dovecot/conf.d/90-fts.conf
	cd "${_reponame}"

	make DESTDIR="${pkgdir}" install
	mkdir -p "${pkgdir}"/usr/lib/dovecot/modules
	ln -s /usr/lib/dovecot/lib21_fts_elastic_plugin.so "${pkgdir}"/usr/lib/dovecot/modules/lib21_fts_elastic_plugin.so
    install -Dm644 elastic7-schema.json "${pkgdir}"/usr/share/doc/dovecot/elastic7-schema.json
	sed -i -e 's/LLL/MMM/g' "${pkgdir}"/usr/share/doc/dovecot/elastic7-schema.json
	install -Dm644 COPYING.MIT "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING.MIT
}

# vim: set tabstop=4:softtabstop=4:shiftwidth=4:noexpandtab
