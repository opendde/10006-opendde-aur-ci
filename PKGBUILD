# Maintainer: BigmenPixel <bigmen dot pixel at tuta dot io>
# Contributor: rustemb <rustemb at systemli dot org>

pkgname=shadowsocks-rust
pkgver=1.13.1
pkgrel=2
pkgdesc='A Rust port of shadowsocks https://shadowsocks.org/'
arch=('any')
url='https://github.com/shadowsocks/shadowsocks-rust'
license=('MIT')
depends=('openssl')
makedepends=('cargo' 'libsodium')
options=('!lto')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
    'shadowsocks-rust@.service'
    'shadowsocks-rust-server@.service')

sha512sums=('bd74bcd470f7cd98888cc5c6114931770f9e7cf6a920fc35dc60b3fed21f16f4618c6c5a6fc0c696626f39925068e5d4879e33ee47c5695d87a33ec7fb90d96f'
            'da9f2636af124d57d4540b42bc35721118e1610bbeb71d59e9f45e979bb1b7e33f9071ba104e2c9c2a76c79343298e0a603773578ff8f20d14cf963d58ec5dc0'
            'f911eda6f01620807bcad0d0d71536db2be840b516b23cb9b81012a4696e651e93231ab3ad82c92bd85bddb68f59030cb524195da75b034d9a39e6a585de7291')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --features local-redir,local-tun,local-dns,local-http-native-tls
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo test --frozen --features local-redir,local-tun,local-dns,local-http-native-tls
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "target/release/sslocal" "${pkgdir}/usr/bin/sslocal-rust"
    install -Dm755 "target/release/ssserver" "${pkgdir}/usr/bin/ssserver-rust"
    install -Dm755 "target/release/ssurl" "${pkgdir}/usr/bin/ssurl-rust"
    install -Dm755 "target/release/ssmanager" "${pkgdir}/usr/bin/ssmanager"
    install -Dm755 "target/release/ssservice" "${pkgdir}/usr/bin/ssservice"
    install -Dm644 "${srcdir}/${pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
    install -Dm644 "${srcdir}/${pkgname}-server@.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}-server@.service"
    install -Dm644 "examples/config_ext.json" "${pkgdir}/etc/${pkgname}/config_ext_rust.json.example"
    install -Dm644 "examples/config.json" "${pkgdir}/etc/${pkgname}/config_rust.json.example"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
