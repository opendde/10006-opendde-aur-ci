# Maintainer: Simon Weald <simon[at]simonweald[dot]com>

pkgname=gsctl-bin
_srcname=gsctl
pkgdesc="The Giant Swarm command line interface"
pkgver=0.18.1
pkgrel=1
arch=('x86_64')
url="https://github.com/giantswarm/gsctl/"
license=('apache')
source=("${_srcname}-${pkgver}.tar.gz::https://github.com/giantswarm/gsctl/releases/download/${pkgver}/${_srcname}-${pkgver}-linux-amd64.tar.gz")
sha256sums=('d1a5ca4631d1008f53942356ca797fa9a0c3140b221ea47081ecfce30b4af1d8')

package() {
    cd ${srcdir}
    tar -xzf ${_srcname}-${pkgver}.tar.gz
    install -Dm755 "${srcdir}/${_srcname}-${pkgver}-linux-amd64/${_srcname}" "${pkgdir}/usr/bin/${_srcname}"

    "${pkgdir}/usr/bin/${_srcname}" completion bash --stdout | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/${_srcname}"
    "${pkgdir}/usr/bin/${_srcname}" completion zsh --stdout | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_${_srcname}"
}
