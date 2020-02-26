# Maintainer: Victor <victor@xirion.net>
pkgname=k9s-bin
pkgver=0.17.0
pkgrel=1
pkgdesc='Kubernetes CLI To Manage Your Clusters In Style!'
arch=('x86_64')
url='https://github.com/derailed/k9s'
license=('Apache')
provides=('k9s')
conflicts=('k9s')
_k9s_file=k9s-$pkgver.tar.gz
source=($_k9s_file::"https://github.com/derailed/k9s/releases/download/v${pkgver}/k9s_Linux_x86_64.tar.gz")
sha256sums=('f5a9b04792b85bb344202c94e6c52f9da0ae8c95435615e685992834d5c7ced9')

package() {
    install -Dm 755 "${srcdir}/k9s" "${pkgdir}/usr/bin/k9s"
}
