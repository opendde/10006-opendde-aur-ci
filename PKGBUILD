# Maintainer: Chris <cg@zknt.org>

pkgname=tekton-cli-bin
pkgver=0.10.0
pkgrel=1
pkgdesc='A CLI for interacting with Tekton.'
arch=('x86_64')
url='https://github.com/tektoncd/cli'
license=('Apache')
provides=('tekton-cli')
source=("https://github.com/tektoncd/cli/releases/download/v${pkgver}/tkn_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('c5771174591dea44bcfd48e719caf9929e78cc4f96fa8a8e419e0e1c75cf95f5')

package() {
    install -Dm 755 "$srcdir/tkn" "${pkgdir}/usr/bin/tkn"
}

