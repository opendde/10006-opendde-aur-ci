pkgname=3proxy
pkgver=0.8.6
pkgrel=1
pkgdesc="A tiny crossplatform proxy server"
arch=('i686' 'x86_64')
url="http://www.3proxy.ru/"
license=('BSD')
depends=()
source=("https://github.com/z3APA3A/3proxy/archive/3proxy-$pkgver.tar.gz"
)
md5sums=('edadb0da813c514f8af0dfc2c7c4ae2a'
)
_prefix=/usr
_etcdir=/etc/3proxy
package() {
	cd "$srcdir/3proxy-3proxy-0.8.6"
	cp Makefile.Linux Makefile.Linux~ && sed 's/^\(CFLAGS =\)/\1 -Werror-implicit-function-declaration /' Makefile.Linux~ > Makefile.Linux || return 1
	make='make -f Makefile.Linux INSTALL=/usr/bin/install'
	$make prefix="$_prefix" ETCDIR="$_etcdir"
	$make prefix="$_prefix" install DESTDIR="$pkgdir" ETCDIR="${pkgdir}${_etcdir}"
	( cd ${pkgdir}${_prefix}/bin && mv proxy 3proxy-proxy ) || return 1
	rm -f ${pkgdir}${_etcdir}/counters ${pkgdir}${_etcdir}/passwd ${pkgdir}${_etcdir}/bandlimiters
	install -D -m644 copying ${pkgdir}${_prefix}/share/licenses/$pkgname/copying
	install -D -m644 cfg/3proxy.cfg.sample ${pkgdir}${_etcdir}/3proxy.cfg.sample
	install -D -m644 cfg/counters.sample ${pkgdir}${_etcdir}/counters.sample
}
