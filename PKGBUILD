# Maintainer:   Maximilian Weiss <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  Jeremy Rand <$(echo "YmlvbGl6YXJkODlAZ21haWwuY29tCg==" | base64 -d)>
# Contributor:  Daniel Kraft <$(echo "ZEBkb21vYi5ldQo=" | base64 -d)>
# Contributor:  The Namecoin Core Developers
# Contributor:  The Bitcoin Core Developers


pkgname=namecoin-core-wallet
pkgver=v0.19.0.1
pkgrel=4


# Epoch is always set to the most recent PKGBUILD update time.
# This allows for a forced downgrade without messing up versioning.
epoch=1582312105


# Release commit for 0.19.0.1
_commit=b41513db71d83c14a62cced2a0fb3284e8751907


pkgdesc='This package provides the Namecoin Core GUI client, CLI daemon, and daemon user service.'

arch=('i686' 'x86_64')
url='https://namecoin.org/'
license=('MIT')
depends=('desktop-file-utils' 'openssl' 'db4.8' 'boost' 'boost-libs' 'libevent'
         'qt5-base' 'qt5-tools' 'qrencode' 'miniupnpc' 'protobuf' 'zeromq')
makedepends=('git' 'gzip' 'patch' 'make' 'coreutils')
provides=('namecoin-core-wallet' 'namecoin-cli' 'namecoin-daemon'
          'namecoin-qt' 'namecoin-tx')
conflicts=('namecoin-core-wallet' 'namecoin-cli' 'namecoin-daemon'
           'namecoin-qt' 'namecoin-tx')
source=('git://github.com/namecoin/namecoin-core'
        "$pkgname-boost-1.72.patch::https://github.com/bitcoin/bitcoin/commit/a64e97dd476bda7c7981979d045b0d06d6f7ce47.patch"
        'namecoin.desktop'
        'namecoin1500x1500.png'
        'namecoind.service'
        'namecoind@.service')
sha256sums=('SKIP'
            '7881fce02696f64f03796ce3d09433e4dd029b32204d7f6c290a62fcce6b018d'
            '0226f5a570bbbde63f332d43d9d712287b316c726280f2ae9e21b1b365b3f0dc'
            'f1e0593b872e18e0aebbf399bb5d77be255cb0aa160964c0528698a33f89ba04'
            '0a8cb03f33a895ccaed63fb9d946db69bee7188b7a9f41bc92879167c2718dcf'
            '216bf1642feb5c37cc82a0801faf0717308f98e5aed86d75dac8fafd150a4b68')


prepare() {
    mkdir -p "$srcdir/tmp"
    cd "$srcdir/namecoin-core/"
    git checkout "$_commit"
    patch -Np1 -i ../$pkgname-boost-1.72.patch
}


build() {

    cd "$srcdir/namecoin-core/"
    ./autogen.sh

    # I have not tested the static build process on 32 bit machines yet,
    # so I'm leaving i686 with the normal dynamic build.
    if [ "$CARCH" == i686 ]; then
        ./configure --prefix=/usr --enable-upnp-default --enable-hardening \
                    --with-gui=qt5 --disable-tests --enable-bip70 \
                    --enable-ecmult-static-precomputation

        make DESTDIR="$srcdir/tmp"
        make DESTDIR="$srcdir/tmp" install


    # This should produce a static build that doesn't brick every time Arch
    # rolls out updates to the system libraries.
    elif [ "$CARCH" == x86_64 ]; then
        ./configure --prefix="${srcdir}/namecoin-core/depends/x86_64-pc-linux-gnu" \
                    --enable-glibc-back-compat \
                    --enable-reduce-exports \
                    --enable-upnp-default \
                    --enable-hardening \
                    --with-gui=qt5 \
                    --disable-tests \
                    --enable-bip70 \
                    --enable-ecmult-static-precomputation \
                    LDFLAGS="-static-libstdc++"

        make DESTDIR="$srcdir/tmp" STATIC=all
        make DESTDIR="$srcdir/tmp" STATIC=all install
    fi
}

package() {
    PREFIXDIR="${srcdir}/namecoin-core/depends/x86_64-pc-linux-gnu"
    install -Dm644 "$srcdir/namecoin.desktop"      "$pkgdir/usr/share/applications/namecoin.desktop"
    install -Dm644 "$srcdir/namecoin1500x1500.png" "$pkgdir/usr/share/pixmaps/namecoin1500x1500.png"
    install -Dm644 "$srcdir/namecoind@.service"    "$pkgdir/usr/lib/systemd/system/namecoind@.service"
    install -Dm644 "$srcdir/namecoind.service"     "$pkgdir/usr/lib/systemd/user/namecoind.service"
    install -Dm644 "$srcdir/namecoin-core/COPYING" "$pkgdir/usr/share/licenses/namecoin/COPYING"
    install -Dm755 "$srcdir/tmp/${PREFIXDIR}/bin/bench_namecoin" "$pkgdir/usr/bin/bench_namecoin"
    install -Dm755 "$srcdir/tmp/${PREFIXDIR}/bin/namecoin-qt"    "$pkgdir/usr/bin/namecoin-qt"
    install -Dm755 "$srcdir/tmp/${PREFIXDIR}/bin/namecoind"      "$pkgdir/usr/bin/namecoind"
    install -Dm755 "$srcdir/tmp/${PREFIXDIR}/bin/namecoin-cli"   "$pkgdir/usr/bin/namecoin-cli"
    install -Dm755 "$srcdir/tmp/${PREFIXDIR}/bin/namecoin-tx"    "$pkgdir/usr/bin/namecoin-tx"
    install -Dm644 "$srcdir/tmp/${PREFIXDIR}/include/namecoinconsensus.h"       "$pkgdir/usr/include/namecoinconsensus.h"
    install -Dm644 "$srcdir/tmp/${PREFIXDIR}/share/man/man1/namecoin-cli.1"     "$pkgdir/usr/share/man/man1/namecoin-cli.1"
    install -Dm644 "$srcdir/tmp/${PREFIXDIR}/share/man/man1/namecoind.1"        "$pkgdir/usr/share/man/man1/namecoind.1"
    install -Dm644 "$srcdir/tmp/${PREFIXDIR}/share/man/man1/namecoin-qt.1"      "$pkgdir/usr/share/man/man1/namecoin-qt.1"
    install -Dm644 "$srcdir/tmp/${PREFIXDIR}/share/man/man1/namecoin-tx.1"      "$pkgdir/usr/share/man/man1/namecoin-tx.1"
    install -Dm644 "$srcdir/tmp/${PREFIXDIR}/share/man/man1/namecoin-wallet.1"  "$pkgdir/usr/share/man/man1/namecoin-wallet.1"
    gzip "$pkgdir/usr/share/man/man1/namecoin-cli.1"
    gzip "$pkgdir/usr/share/man/man1/namecoind.1"
    gzip "$pkgdir/usr/share/man/man1/namecoin-qt.1"
    gzip "$pkgdir/usr/share/man/man1/namecoin-tx.1"
    gzip "$pkgdir/usr/share/man/man1/namecoin-wallet.1"
    install -Dm755 "$srcdir/tmp/${PREFIXDIR}/lib/libnamecoinconsensus.so.0.0.0" "$pkgdir/usr/lib/libnamecoinconsensus.so.0.0.0"
    cd "$pkgdir/usr/lib/"
    ln -s "libnamecoinconsensus.so.0.0.0" "libnamecoinconsensus.so.0"
    ln -s "libnamecoinconsensus.so.0.0.0" "libnamecoinconsensus.so"
}

