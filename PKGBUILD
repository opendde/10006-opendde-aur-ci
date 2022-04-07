# Maintainer: Core_UK <mail.coreuk@gmail.com>

pkgname=cider
_pkgname=Cider
pkgver=1.4.0
pkgrel=2
pkgdesc="Project Cider. An open-source Apple Music client built from the ground up with Vue.js and Electron. Compiled from the GitHub repositories develop branch."
arch=("armv7h" "i686" "x86_64")
url="https://github.com/CiderApp/${_pkgname}.git"
license=("GPL")
depends=('gtk3' 'nss')
makedepends=('git' 'npm' 'yarn')
optdepends=('libnotify: Playback notifications')
source=(
    "git+https://github.com/CiderApp/${_pkgname}.git"
    "cider.desktop"
)
sha256sums=('SKIP'
            'c41e9b1019411019fce8509e32f770edf33c9e864bf707c30ffe2e3f2dcf1571')

    pkgver() {
        cd "$srcdir/$_pkgname"
        var=$(grep '"version":.*' package.json | cut -d '"' -f 4 | head -1)
        echo ${var/-/.}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
    }

build() {
    cd "${srcdir}/${_pkgname}"

    echo "Building ${_pkgname} on v${pkgver} : [Install Build Dependencies] | Build | Done"
	yarn install --non-interactive --pure-lockfile --cache-folder "${srcdir}/yarn-cache"

    echo "Building : Install Build Dependencies | [Build] | Done"
    if [[ ${CARCH} == "armv7h" ]]; then
        yarn build
        yarn electron-builder build --armv7l --linux dir
    elif [[ ${CARCH} == "i686" ]]; then
        yarn build
        yarn electron-builder build --ia32 --linux dir
    elif [[ ${CARCH} == "x86_64" ]]; then
        yarn build 
        yarn electron-builder build --x64 --linux dir
    fi

    echo "Building : Install Build Dependencies | Build | [Done]"
}

package() {
    cd "${srcdir}/${_pkgname}"

    echo "Packaging : [Desktop Shortcut] | Icon | Build Files | Other Files | Done"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"

    echo "Packaging : Desktop Shortcut | [Icon] | Build Files | Other Files | Done"
    install -Dm644 "${srcdir}/${_pkgname}/resources/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-git}.png"

    echo "Packaging : Desktop Shortcut | Icon | [Build Files] | Other Files | Done"
    install -d "$pkgdir/opt/"
    install -d "$pkgdir/usr/bin/"
    cd ${srcdir}/${_pkgname}/dist/linux-unpacked
    mkdir "${pkgdir}/opt/${pkgname%-git}"
    cp -r --preserve=mode * "${pkgdir}/opt/${pkgname%-git}"
    ln -sf "/opt/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"


    echo "Packaging : Desktop Shortcut | Icon | Build Files | [Other Files] | Done"
    install -d "$pkgdir/usr/share/licenses" "$pkgdir/usr/share/doc"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"


    echo "Packaging : Desktop Shortcut | Icon | Build Files | Other Files | [Done]"
}

