# Maintainer: Johannes Wienke <languitar@semipol.de>

_npmname=yaml-language-server
pkgname=yaml-language-server-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Language server implementation for YAML files and optional schema support"
arch=('any')
url="https://www.npmjs.com/package/vscode-html-languageserver-bin"
license=('MIT')
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha1sums=('4e278b55721415f94eb9996d64a1b89f3488a28d')

package() {
    cd "${srcdir}"
    local _npmdir="${pkgdir}/usr/lib/node_modules/"
    mkdir -p "${_npmdir}"
    cd "${_npmdir}"
    npm install --user root -g --prefix "${pkgdir}/usr" "${_npmname}@${_npmver}"
    mkdir -p "${pkgdir}/usr/bin"
    # make the server executable
    sed -i '1s;^;#!/usr/bin/env\n;' "${pkgdir}/usr/bin/yaml-language-server"
}
