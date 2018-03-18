# Maintainer: hexchain <i at hexchain.org>

pkgname="tpm2-abrmd"
pkgver="1.3.0"
pkgrel=1
pkgdesc="TPM2 Access Broker & Resource Manager"
license=('BSD')
arch=('x86_64')
depends=('glib2' 'tpm2-tss' 'dbus')
makedepends=('autoconf-archive' 'automake' 'cmocka' 'python')
url="https://github.com/intel/tpm2-abrmd"
source=("https://github.com/tpm2-software/tpm2-abrmd/releases/download/$pkgver/tpm2-abrmd-$pkgver.tar.gz"
        "tss.sysusers")
sha256sums=('e32e19de93b539374a485d9df7fe9415ce147ec03c8d9ba6593e50f7a67a7a51'
            '67d89be143dc129a95b0c1a42b3e92367a151289fb6c0655c054fccd62cd9a0e')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --disable-static --with-pic
}

check() {
    msg2 "Skipping check for now..."
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd "$srcdir"
    install -Dm644 "tss.sysusers" "$pkgdir/usr/lib/sysusers.d/tss.conf"
}
