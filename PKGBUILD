# $Id$
# Maintainer: Allen Zhong <moeallenz@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Miroslaw Szot <mss@czlug.icis.pcz.pl>

pkgname=tengine-extra
pkgver=2.0.3
pkgrel=4
pkgdesc='A web server based on Nginx and has many advanced features, originated by Taobao. Some extra modules enabled.'
arch=('i686' 'x86_64')
url='http://tengine.taobao.org'
license=('custom')
depends=('pcre' 'zlib' 'openssl' 'gperftools')
makedepends=('lua51' 'geoip')
backup=('etc/tengine/fastcgi.conf'
        'etc/tengine/fastcgi_params'
        'etc/tengine/koi-win'
        'etc/tengine/koi-utf'
        'etc/tengine/mime.types'
        'etc/tengine/tengine.conf'
        'etc/tengine/scgi_params'
        'etc/tengine/uwsgi_params'
        'etc/tengine/win-utf'
        'etc/logrotate.d/tengine')
install=tengine.install
conflicts=('tengine' 'tengine-dev')
optdepends=(
	'lua51: needed by http_lua_module'
	'geoip: needed by http_geoip_module'
	'memcached: needed by http_memcached_module')
source=($url/download/tengine-$pkgver.tar.gz
        service
        logrotate)
sha256sums=('ed024b6040e8f03df575fe7d7a9d274159e2543cd6854d89e173935e930fdfdb'
            'acbd46c74a4caa55635855a033c0a37e0452194335259e7f827b24208199ad6a'
            '245c23906db2a9642fed996ff969e127989a6dcae865c1dd8b422e23ebc94f42')

build() {
    cd tengine-$pkgver

    ./configure \
        --prefix=/etc/tengine \
        --conf-path=/etc/tengine/tengine.conf \
        --sbin-path=/usr/bin/tengine \
	--dso-path=/etc/tengine/modules \
	--dso-tool-path=/sbin/dso_tool \
        --pid-path=/run/tengine.pid \
        --lock-path=/run/lock/tengine.lock \
        --user=http \
        --group=http \
        --http-log-path=/var/log/tengine/access.log \
        --error-log-path=stderr \
        --http-client-body-temp-path=/var/lib/tengine/client-body \
        --http-proxy-temp-path=/var/lib/tengine/proxy \
        --http-fastcgi-temp-path=/var/lib/tengine/fastcgi \
        --http-scgi-temp-path=/var/lib/tengine/scgi \
        --http-uwsgi-temp-path=/var/lib/tengine/uwsgi \
        --with-imap \
        --with-imap_ssl_module \
        --with-ipv6 \
        --with-pcre-jit \
        --with-file-aio \
	--with-google_perftools_module \
        --with-http_dav_module \
	--with-http_geoip_module=shared \
        --with-http_gunzip_module \
        --with-http_gzip_static_module \
	--with-http_lua_module=shared \
	--with-http_memcached_module=shared \
        --with-http_realip_module \
	--with-http_secure_link_module=shared \
        --with-http_spdy_module \
        --with-http_ssl_module \
        --with-http_stub_status_module \
        --with-http_addition_module \
        --with-http_degradation_module \
        --with-http_flv_module=shared \
        --with-http_mp4_module=shared\
        --with-http_secure_link_module \
        --with-http_sub_module=shared

    make
}

package() {
    cd tengine-$pkgver
    make DESTDIR="$pkgdir" install
    make DESTDIR="$pkgdir" dso_install

    sed -e 's|\<user\s\+\w\+;|user html;|g' \
        -e '44s|html|/usr/share/tengine/html|' \
        -e '54s|html|/usr/share/tengine/html|' \
        -i "$pkgdir"/etc/tengine/tengine.conf
    rm "$pkgdir"/etc/tengine/*.default

    install -d "$pkgdir"/var/lib/tengine
    install -dm700 "$pkgdir"/var/lib/tengine/proxy

    chmod 750 "$pkgdir"/var/log/tengine
    chown http:log "$pkgdir"/var/log/tengine

    install -d "$pkgdir"/usr/share/tengine
    mv "$pkgdir"/etc/tengine/html/ "$pkgdir"/usr/share/tengine

    install -Dm644 "$srcdir"/logrotate "$pkgdir"/etc/logrotate.d/tengine
    install -Dm644 "$srcdir"/service "$pkgdir"/usr/lib/systemd/system/tengine.service
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/tengine/LICENSE
    rmdir "$pkgdir"/run

    install -d "$pkgdir"/usr/share/man/man8/
    gzip -9c man/nginx.8 > "$pkgdir"/usr/share/man/man8/nginx.8.gz
}

