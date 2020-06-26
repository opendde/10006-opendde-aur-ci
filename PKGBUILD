# Maintainer: Jikstra <jikstra@disroot.org>
# Maintainer: tercean <cg@zknt.org>
pkgname=deltachat-desktop
pkgver=1.4.2
pkgrel=1
pkgdesc="A privacy oriented chat application built on e-mail"
arch=("any")
url="https://github.com/deltachat/deltachat-desktop"
license=("GPL")
depends=('electron6')
makedepends=('npm' 'nodejs' 'git' 'rustup' 'python')
conflicts=("deltachat-desktop-git")
source=(
    "deltachat-desktop-${pkgver}.tar.gz::https://github.com/deltachat/deltachat-desktop/archive/v${pkgver}.tar.gz"
    "deltachat-desktop.desktop"
    "deltachat-desktop.sh"
    "no-git-checkout.patch"
)

sha256sums=(
    "346ed1e0b135bb41b916a422d02a6cd329242cb2ea6085ae1a16f9aa483f9161"
    "39bae164c234b3c89e7ae2bde89753c90065df7f37fece084f7f5acccbb9f1f1"
    "5e20ea657599390e317523ae17b17aba0d26c59474a7f80282af5f2668002f59"
    "35461ad7e2db569764866f798481aeef96656c363463fd6f5d8cef6bc29f1d79"
)


prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/no-git-checkout.patch"
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}"

    npm install
    npm run build

    # Delete development dependencies, we don't need them anymore
    npm prune --production
}


package() {
    cd "$srcdir/${pkgname}-${pkgver}"

    install -d "${pkgdir}/opt/DeltaChat/electron_app"
    cp -r node_modules  images tsc-dist build html-dist _locales "${pkgdir}/opt/DeltaChat/electron_app"

    rm -rf "${pkgdir}/opt/DeltaChat/electron_app/node_modules/deltachat-node/prebuilds/win32-x64"
    rm -rf "${pkgdir}/opt/DeltaChat/electron_app/node_modules/deltachat-node/prebuilds/darwin-x64"
    find "${pkgdir}/opt/DeltaChat/electron_app/node_modules/" -name *.js.map -exec rm {} \;

    cp index.js package.json "${pkgdir}/opt/DeltaChat/electron_app"

    install -Dm644 "${srcdir}/deltachat-desktop.desktop" "${pkgdir}/usr/share/applications/deltachat.desktop"
    install -Dm755 "${srcdir}/deltachat-desktop.sh" "${pkgdir}/opt/DeltaChat/deltachat"
    install -d "${pkgdir}/usr/bin"
    ln -s "${pkdir}/opt/DeltaChat/deltachat" "${pkgdir}/usr/bin/deltachat"

    install -Dm644 ./images/deltachat.png "${pkgdir}/usr/share/icons/hicolor/scalable/apps/deltachat.png"
}
