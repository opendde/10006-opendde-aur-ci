# Maintainer: Josh Ellithorpe <quest@mac.com>

pkgname=bitcoin-cash-node
pkgver=24.1.0
pkgrel=0
pkgdesc="Bitcoin Cash Node with bitcoind, bitcoin-tx, bitcoin-seeder and bitcoin-cli"
arch=('i686' 'x86_64')
url="https://bitcoincashnode.org"
depends=('boost-libs' 'libevent' 'openssl' 'zeromq' 'miniupnpc')
makedepends=('cmake' 'ninja' 'boost' 'help2man')
license=('MIT')
source=(https://github.com/bitcoin-cash-node/bitcoin-cash-node/archive/v$pkgver.tar.gz
        bitcoin.conf
        bitcoin.logrotate
        bitcoin.service
        bitcoin-reindex.service
        bitcoin.install)
sha256sums=('2f2ff3c3759480b1c8f2d0d4b80c2b9f3c10d58d5e8ee9125584f2b5491c793d'
            'c30e5c7e0e97b001fdeac5f4510d5ebc0e0499ec086325e845db609a24f2e22f'
            '8f05207b586916d489b7d25a68eaacf6e678d7cbb5bfbac551903506b32f904f'
            'f2fd9d8331238727333cf2412ba3759cb194a65b2060eff36808b24c06382104'
            '497dbeefb9cd9792757a9b6e1fbfd92710d19990ee2959add6c30533ae40b6f6'
            '1579ff8d965eb3700276586e27e9e2e49e8e2721ece1c8a14924b4ce236b6eb8')
backup=('etc/bitcoin/bitcoin.conf'
        'etc/logrotate.d/bitcoin')
provides=('bitcoin-cli' 'bitcoin-daemon' 'bitcoin-tx' 'bitcoin-seeder')
conflicts=('bitcoin-cli' 'bitcoin-daemon' 'bitcoin-tx' 'bitcoin-seeder')
install=bitcoin.install

build() {
  cd "$srcdir/${pkgname}-$pkgver"

  msg2 'Building...'
  mkdir -p build
  pushd build

  cmake -GNinja .. \
    -DENABLE_CLANG_TIDY=OFF \
    -DCLIENT_VERSION_IS_RELEASE=ON \
    -DENABLE_REDUCE_EXPORTS=ON \
    -DENABLE_STATIC_LIBSTDCXX=ON \
    -DBUILD_BITCOIN_WALLET=OFF \
    -DBUILD_BITCOIN_QT=OFF \
    -DCMAKE_INSTALL_PREFIX=$pkgdir/usr

  ninja
  popd
}

check() {
  cd "$srcdir/${pkgname}-$pkgver/build"

  msg2 'Testing... (skipped)'
  #ninja check
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/${pkgname}"

  msg2 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/bitcoin"
  for _doc in \
    $(find doc -maxdepth 1 -type f -name "*.md" -printf '%f\n') \
    release-notes; do
      cp -dpr --no-preserve=ownership "doc/$_doc" \
        "$pkgdir/usr/share/doc/bitcoin/$_doc"
  done

  msg2 'Installing essential directories'
  install -dm 700 "$pkgdir/etc/bitcoin"
  install -dm 755 "$pkgdir/srv/bitcoin"
  install -dm 755 "$pkgdir/run/bitcoin"

  pushd build
  msg2 'Installing executables and man pages...'
  cmake -DCOMPONENT=bitcoind -P cmake_install.cmake
  cmake -DCOMPONENT=bitcoin-seeder -P cmake_install.cmake
  popd

  msg2 'Installing bitcoin.conf...'
  install -Dm 600 "$srcdir/bitcoin.conf" -t "$pkgdir/etc/bitcoin"

  msg2 'Installing bitcoin.service...'
  install -Dm 644 "$srcdir/bitcoin.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/bitcoin-reindex.service" \
    -t "$pkgdir/usr/lib/systemd/system"

  msg2 'Installing bitcoin.logrotate...'
  install -Dm 644 "$srcdir/bitcoin.logrotate" "$pkgdir/etc/logrotate.d/bitcoin"

  msg2 'Installing bash completion...'
  for _compl in bitcoin-cli bitcoin-tx bitcoind; do
    install -Dm 644 "contrib/${_compl}.bash-completion" \
      "$pkgdir/usr/share/bash-completion/completions/$_compl"
  done
}
