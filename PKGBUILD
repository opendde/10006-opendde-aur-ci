# Maintainer:  Alex Mekkering <amekkering at gmail dot com>
# Contributor: Bjoern Franke <bjo@nord-west.org>

pkgname=tvheadend

pkgver=4.2.4
pkgrel=1
pkgdesc="TV streaming server for Linux"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://tvheadend.org/projects/tvheadend"
license=('GPL3')
depends=('avahi' 'linuxtv-dvb-apps' 'ffmpeg' 'uriparser' 'openssl' 'tar')
makedepends=('git' 'wget' 'python')
optdepends=('xmltv: For an alternative source of programme listings'
	    'libiconv: For conversion of character encodings')
provides=('tvheadend')
conflicts=('tvheadend-git')
install=tvheadend.install

source=("https://github.com/tvheadend/tvheadend/archive/v$pkgver.tar.gz" 
	'tvheadend.service'
)
sha512sums=('333a3509da198f5d96316f30fd010a216262315614db302c83405de78d29b32b1d878c0abd7fae2214713107e6955478ee3222b18888a84c57810035af882df4'
            '456084a08ce0e02a4a32d67a8a7937d45695cb4b08b29297ead8a7e9d2a92963335f653f56d4c9346f4b2729868408fafbcd4caebf9fc8cdaa90171514cf4a57')
 
prepare() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr --python=python3 \
        --disable-ffmpeg_static \
        --disable-libx264_static \
        --disable-libx265_static \
        --disable-libvpx_static \
        --disable-libtheora_static \
        --disable-libvorbis_static \
        --disable-libfdkaac_static
}

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir" install
    chmod 0644 ${pkgdir}/usr/share/man/man1/tvheadend.1
    install -D -m 644 "$srcdir/tvheadend.service" "$pkgdir/usr/lib/systemd/system/tvheadend.service"
}
