# Contributor: Spider.007 <archlinux AT spider007 DOT net>
pkgname=kibana
pkgver=4.5.1
pkgrel=1
pkgdesc="browser based analytics and search dashboard for Elasticsearch. Please note; this package replaces the distributed precompiled binary 'node'"
arch=('any')
url="https://www.elastic.co/products/kibana"
license=('apache')
depends=('nodejs')
optdepends=('elasticsearch>=2.2')
backup=('etc/elasticsearch/kibana/kibana.yml')
install=kibana.install
source=(
	"https://download.elasticsearch.org/kibana/kibana/$pkgname-$pkgver-linux-x64.tar.gz"
	kibana.service)
sha256sums=('4381c39665c22960bf4db9381a4d9fd9bde159b4d4b13476352bcd2edc960f78'
			'SKIP')

package() {
	cd "$srcdir/`basename ${source[0]%.tar.gz}`"

	mkdir -p $pkgdir/usr/lib/kibana/
	install -Dm644 "$srcdir/kibana.service" "$pkgdir/usr/lib/systemd/system/kibana.service"
	install -Dm644 "config/kibana.yml" "$pkgdir/etc/elasticsearch/kibana/kibana.yml"
	touch $srcdir/.babelcache.json
	install -Dm644 -o nobody $srcdir/.babelcache.json $pkgdir/usr/lib/kibana/optimize/.babelcache.json

	rm -R ./node/
	chmod +r -R src/
	find src -type d -exec chmod +x {} \;
	cp -Rp * "$pkgdir/usr/lib/kibana/"
}
