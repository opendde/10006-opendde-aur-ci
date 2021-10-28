# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=plugn
pkgver=0.7.1
pkgrel=1
pkgdesc='Hook system that lets users extend your application with plugins'
arch=('x86_64')
url='https://github.com/dokku/plugn'
license=('MIT')
source=("${url}/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tgz"
        "https://raw.githubusercontent.com/dokku/plugn/master/LICENSE")
sha256sums=('dc2c54c0fc6d0418699e71331c6592a4fb0ef065f6231e727d13541fcee977a7'
            '53e5aa5031ccdfb11c748e9f626650fca882501618167a690631f76b71c26aaa')

package() {
  install -Dm755 "${pkgname}-amd64" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
