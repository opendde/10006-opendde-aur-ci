# Maintainer: Hiroshi Hatake <cosmo0920.wp[at]gmail.com>

pkgname=groonga
pkgver=10.0.3
pkgrel=1
pkgdesc="An opensource fulltext search engine."
arch=('i686' 'x86_64')
url="http://groonga.org/"
license=('LGPL2')
source=("http://packages.groonga.org/source/groonga/$pkgname-$pkgver.tar.gz"
        "groonga-httpd.service")
depends=('zlib' 'lz4' 'glib2' 'libedit' 'zeromq' 'arrow' 'autoconf-archive'
         'libevent' 'mecab' 'mecab-ipadic' 'msgpack-c' 'snowball-c-git')
optdepends=('cutter-test_framework' 'ruby' 'mercurial' 'kytea')

build() {
    # TODO: Enable to build arrow on AArch64/armv7h
    cd $srcdir/$pkgname-$pkgver
    ./configure --prefix=/usr \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --with-default-encoding=utf8 \
    --with-zlib \
    --with-lz4 \
    --enable-arrow \
    --enable-message-pack \
    --enable-shared=yes \
    --enable-static=yes \
    --with-mecab \
    --enable-mruby

    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR="$pkgdir" install

    # cleanup
    rm -r "${pkgdir}/var/run"

    install -Dm644 ../groonga-httpd.service "$pkgdir"/usr/lib/systemd/system/groonga-httpd.service
}
sha1sums=('316f6a0a3805dd11447fbf62d95aa420f83c956f'
          '56b68b5ebfc6785f08ce101b263d6f56acd74d8a')
