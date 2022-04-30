# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>

_app_name=rakubrew
pkgname="${_app_name}-bin"
pkgver=29
pkgrel=1
pkgdesc="A Raku installation tool. It allows to have multiple versions of different Raku implementations installed in parallel and switch between them."
arch=('x86_64')
url='https://rakubrew.org/'
license=('MIT')
provides=('rakubrew')
options=('!strip')
depends=('perl')
source=("${pkgname}-${pkgver}::https://${_app_name}.org/files/${pkgver}/perl/${_app_name}"
        "file:///LICENSE")
sha256sums=('f4bac4a3d84eaaa4de271d0f0acaac7ff4ce0afbf023e4475044d29c371d69fe'
            '0bc1b636841114f78c1dbbb2e4c63916dc87c3d085d940866c7f33115b7156a9')

package() {
    install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_app_name}"

    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${_app_name}"
}
