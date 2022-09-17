# Maintainer: Lorenz Steinert <lorenz@steinerts.de>

pkgname=mympd
_pkgname=myMPD
pkgver=9.5.4
pkgrel=1
pkgdesc="A standalone and lightweight MPD web client."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/jcorporation/myMPD"
license=('GPL2')
depends=('pcre2'  'openssl' 'libid3tag' 'flac' 'lua')
optdepends=()
makedepends=('cmake' 'perl')
install=mympd.install
source=("https://github.com/jcorporation/myMPD/archive/v$pkgver.tar.gz"
        sysusers-mympd.conf
        mympd.tmpfiles)
sha256sums=('ce502c62aabe18199f6cfc188d7ef35d0334facd57df561fd336a338f6b70af7'
            'b01e22c4a1868c6a25da0633f600c9e8796a3f5ccc7857472f98bc03927d1e1c'
            'a407012d0137ddd2d32827d8f02c28b54f555009f74e1a3e89593ec5367112b0')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    install -d release
    ./build.sh createassets
    cd release
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=RELEASE ..
    make
}

package() {
    cd "$srcdir/$_pkgname-$pkgver/release"
    make DESTDIR="$pkgdir/" install

    install -Dm644 "$srcdir/sysusers-mympd.conf" "$pkgdir/usr/lib/sysusers.d/mympd.conf"
    install -Dm644 "$srcdir/mympd.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/mympd.conf"
}
