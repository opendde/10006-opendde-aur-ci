# Maintainer: DJ Lucas <dj@linuxfromscratch.org>

pkgname=('python-aiohttp_remotes')
pkgver=0.1.2
pkgrel=1
pkgdesc="A set of useful tools for aiohttp.web server"
pkgrelname='aiohttp_remotes'
pkgtar='aiohttp-remotes'
url="https://github.com/aio-libs/${pkgtar}"
arch=('x86_64')
license=('BSD')
makedepends=('python-aiohttp')
makedepends=('flit')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('074fc7d7dc7c07b653e202d44be46db87d35e95c77535417b78fc9b01d774b5d')

build() {
    cd "${srcdir}/${pkgtar}-${pkgver}"
    flit build
}

package() {
    cd "${srcdir}/${pkgtar}-${pkgver}"
    pip install "dist/${pkgrelname}-${pkgver}-py3-none-any.whl" --root "${pkgdir}"
}
# vim:set ts=4 sw=4 et:
