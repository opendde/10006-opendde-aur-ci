# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Maintainer: Corey Richardson <corey at octayn dot net>

pkgname=asciidocfx
pkgver=1.7.2
pkgrel=2
pkgdesc="Asciidoc Editor and Toolchain written with JavaFX"
arch=('any')

url='http://asciidocfx.com/'
license=('Apache')

makedepends=('maven>=3.3.9' 'java-environment>=12' 'gendesk')
depends=('java-environment=14' 'java-openjfx')

source=(
    "https://github.com/asciidocfx/AsciidocFX/archive/v${pkgver}.tar.gz"
    'asciidocfx'
)
sha512sums=(
    '13e11110b81ff5dea8afab24616e9f2a1994a065408d0b8642af78566f1e39570bba4871a2b437675b0cca4adc7951221cdc13eb04896d44fef961d92f0e780f'
    '7f758a2536c627d854bab4d42f629163d68ff5681be108779670262e765311cad3c93d0c976d561438519ab92a4311d3b49d2f8352cf5ef17aab47eb2b77047d'
)

prepare() {
    # Generate a desktop entry
    # -f: forces and overrides the file if any
    # -n: do not download an icon
    # This tool assumes the icon has the same name as pkgname.
    # For categories see https://standards.freedesktop.org/menu-spec/latest/apa.html
    gendesk -f -n \
        --pkgname "$pkgname" \
        --pkgdesc "$pkgdesc" \
        --name "AsciidocFX" \
        --exec "/usr/bin/asciidocfx" \
        --categories "Development;Office;WordProcessor;TextTools;ComputerScience;Documentation;Java"
}

build() {
    cd "AsciidocFX-${pkgver}"

    # "install" seemingly means "build and ready for installation"
    mvn clean install
}

package() {
    cd "AsciidocFX-${pkgver}"

    install -dm755 "${pkgdir}/usr/share/java/asciidocfx"
    install -dm755 "${pkgdir}/usr/bin"
    mv -t "${pkgdir}/usr/share/java/asciidocfx" target/appassembler/{conf,lib}
    install -m755 '../asciidocfx' "${pkgdir}/usr/bin/asciidocfx"

    install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 './src/main/resources/logo.png' "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    # Workaround for FS#64121
    install -dm755 "${pkgdir}/usr/share/java/asciidocfx/lib/java-openjfx"
    cp -t "${pkgdir}/usr/share/java/asciidocfx/lib/java-openjfx" /usr/lib/jvm/java-14-openjdk/lib/javafx*
}
