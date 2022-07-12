# Maintainer: Frank Bearoff fbearoff at gmail dot com

pkgname=dufs-bin
pkgver=v0.26.0
pkgrel=1
pkgdesc='Dufs is a distinctive utility file server that supports static serving, uploading, searching, accessing control, webdav...'
arch=('x86_64')
url="https://github.com/sigoden/${pkgname%-bin}"
license=('APACHE' 'MIT')
depends=()
source=("${url}/releases/download/${pkgver}/${pkgname%-bin}-v0.26.0-x86_64-unknown-linux-musl.tar.gz"
        "https://raw.githubusercontent.com/sigoden/dufs/main/LICENSE-MIT")
sha256sums=('c6037b25284ffa06fc09a011290a9e309433f66d1e0d0e2a351329d2cb709da3'
            '4623d04ec401ec83c94b935d75d8b4329e860580e91ed777ef03a0aa3b31bb04')
package() {
  install -Dm755 "dufs" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
