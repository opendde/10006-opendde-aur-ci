# Maintainer: Joseph R. Quinn <quinn period josephr at protonmail dot com>

pkgname="trunk-bin"
pkgver="0.15.0"
pkgrel=1
pkgdesc="A WASM web application bundler for Rust."
arch=('x86_64')
url="https://github.com/thedodd/trunk"
license=('MIT/Apache-2.0')
provides=("trunk")
source=(
    "${pkgname%-bin}-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-x86_64-unknown-linux-gnu.tar.gz"
    "https://raw.githubusercontent.com/thedodd/${pkgname%-bin}/v$pkgver/LICENSE-APACHE"
    "https://raw.githubusercontent.com/thedodd/${pkgname%-bin}/v$pkgver/LICENSE-MIT"
)
b2sums=('e0c9722f58b473d6c1000a4dc35b970a801ef95bdc02e7ed2b090faca92db5fed5e37fd887afe19a068a5f0a16a57f96f6fb297530892298e6f058dbeb5294ac'
        '21fadd835dd2d39db33e007a95f4ce46277c5c87902a6e8a530673ceab9b4d13246fb80f93906e9cc684db6e35f6ead13cf71c553468f3a07df6e1c7d9b85b4b'
        'fb26aba82fe953b9895595c5b7c11b5363b83bd60cf1cb6aab572df6dadb940711eda080f8ad77fb519e79309211318b6200081bb05be7b71117a07082c3815d')

prepare() {
    bsdtar -xf "${pkgname%-bin}-$pkgver.tar.gz"
}

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
