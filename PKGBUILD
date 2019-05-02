# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=imdb-rename
pkgver=0.1.2
pkgrel=1
makedepends=('rust' 'cargo')
depends=('openssl')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A command line utility for searching IMDb and renaming your media files."
url="https://github.com/BurntSushi/imdb-rename"
license=('Unlicense/MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BurntSushi/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('e83e7965062b7407f909ce3688eb1f1ef5d4d9fefc3825176f3615b625e44bbd8292be827708d6dd93e174c806f9229b284e732b55491ec88e50f9589bfbadf4')
conflicts=('imdb-rename-git')


build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    # make sure both binaries are built
    cargo build --release --all
}


package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    # install the binaries
    install -Dm755 "target/release/imdb-rename" "${pkgdir}/usr/bin/imdb-rename"
    install -Dm755 "target/release/imdb-eval" "${pkgdir}/usr/bin/imdb-eval"

    # licenses and documentation
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 "UNLICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
}
