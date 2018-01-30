# $Id$
# Maintainer: Allen Zhong <moeallenz@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Miroslaw Szot <mss@czlug.icis.pcz.pl>

pkgname=tengine
pkgver=2.2.2
pkgrel=2
pkgdesc='A web server based on Nginx and has many advanced features, originated by Taobao.'
arch=('i686' 'x86_64')
url='http://tengine.taobao.org'
license=('custom')
depends=('pcre' 'zlib' 'openssl' 'geoip' 'mailcap')
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
conflicts=('tengine-extra')
provides=('nginx')
source=($url/download/tengine-$pkgver.tar.gz
        service
        logrotate
       )
sha256sums=('7ba9dabc17d68b43fd777c7bb3e4bf6a2296540d4bfe18e18f7fddf386fb2394'
            'bbc2a744fcc65b496549a312a19aba2ee87840ad36a523c2e6bc2a585861bbcd'
            '7d4bd60b9210e1dfb46bc52c344b069d5639e1ba08cd9951c0563360af238f97')

build() {
    cd tengine-$pkgver


    ./configure \
        --prefix=/etc/tengine \
        --conf-path=/etc/tengine/tengine.conf \
        --sbin-path=/usr/bin/tengine \
        --dso-path=/etc/tengine/modules \
        --dso-tool-path=/usr/bin/dso_tool \
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
        --with-http_dav_module \
        --with-http_gunzip_module \
        --with-http_gzip_static_module \
        --with-http_realip_module \
        --with-http_ssl_module \
        --with-http_v2_module \
        --with-http_stub_status_module \
        --with-http_addition_module \
        --with-http_degradation_module \
        --with-http_flv_module \
        --with-http_mp4_module \
        --with-http_secure_link_module \
        --with-http_sub_module \
        --with-http_geoip_module

    make
}

package() {
    cd tengine-$pkgver
    make DESTDIR="$pkgdir" install

    install -Dm644 contrib/vim/ftdetect/nginx.vim \
      "$pkgdir"/usr/share/vim/vimfiles/ftdetect/tengine.vim
    install -Dm644 contrib/vim/syntax/nginx.vim \
      "$pkgdir"/usr/share/vim/vimfiles/syntax/tengine.vim
    install -Dm644 contrib/vim/indent/nginx.vim \
      "$pkgdir"/usr/share/vim/vimfiles/indent/tengine.vim

    sed -e 's|\<user\s\+\w\+;|user html;|g' \
        -e '44s|html|/usr/share/tengine/html|' \
        -e '54s|html|/usr/share/tengine/html|' \
        -i "$pkgdir"/etc/tengine/tengine.conf
    rm "$pkgdir"/etc/tengine/*.default
    rm "$pkgdir"/etc/tengine/mime.types # in mailcap
    ln -s /etc/nginx/mime.types "$pkgdir"/etc/tengine/mime.types # from mailcap

    install -d "$pkgdir"/var/lib/tengine
    install -dm700 "$pkgdir"/var/lib/tengine/proxy

    chmod 755 "$pkgdir"/var/log/tengine
    chown root:root "$pkgdir"/var/log/tengine

    install -d "$pkgdir"/usr/share/tengine
    mv "$pkgdir"/etc/tengine/html/ "$pkgdir"/usr/share/tengine

    install -Dm644 "$srcdir"/logrotate "$pkgdir"/etc/logrotate.d/tengine
    install -Dm644 "$srcdir"/service "$pkgdir"/usr/lib/systemd/system/tengine.service
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/tengine/LICENSE
    rmdir "$pkgdir"/run

    install -d "$pkgdir"/usr/share/man/man8/
    gzip -9c man/nginx.8 > "$pkgdir"/usr/share/man/man8/tengine.8.gz
}

