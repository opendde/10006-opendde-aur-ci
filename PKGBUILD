# Maintainer: Pi-Yueh Chuang <pychuang@pm.me>
pkgname=logseq-desktop-git
pkgver=0.0.18.r6.3828f7d9
pkgrel=1
pkgdesc="A privacy-first, open-source platform for knowledge sharing and management. (system electron)"
arch=("x86_64")
url="https://github.com/logseq/logseq"
license=("AGPL3")
depends=("electron")
makedepends=("git" "yarn" "clojure" "nodejs")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "logseq-desktop-bin")
source=(
    "${pkgname}::git+https://github.com/logseq/logseq"
    "system_electron.patch"
    "logseq-desktop.desktop"
    "logseq-desktop-wayland.desktop")
md5sums=(
    "SKIP"
    "efad057e28f0dd60bcf56807c847875e"
    "3a5ebb330fd33e59f1cc56690df1995d"
    "724d351804bbe2074334a8e529462d0a")

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "${srcdir}/${pkgname}"

    # force clojure to download git-based dependencies to this location
    export GITLIBS="${srcdir}/${pkgname}/.gitlib"

    # this patch make the build process use system's electron
    patch -p1 -i "${srcdir}/system_electron.patch"

    # patch :parallel-build true in shadow-cljs.edn

    # download required js modules
    yarn

    # create and sync files to folder `static`
    yarn gulp:build

    # go to folder `static` and download required js modules in static
    cd "${srcdir}/${pkgname}/static"
    yarn

    # go back to the top-level folder and download clojure dependencies
    cd "${srcdir}/${pkgname}"
    clojure -P -M:cljs
}

build() {
    cd "${srcdir}/${pkgname}"

    # force clojure to use git-based dependencies at this location
    export GITLIBS="${srcdir}/${pkgname}/.gitlib"

    # build
    clojure -M:cljs release app electron

    # packaging javescript files to an executable
    cd "${srcdir}/${pkgname}/static"
    yarn electron-forge package
}

package() {

    # important files are under static/out/Logseq-linux-x64 
    cd "${srcdir}/${pkgname}/static/out/Logseq-linux-x64"

    # create destination folder and copy files
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cp -a -r -u --verbose ./ "${pkgdir}/opt/${pkgname}"

    # create a soft link to the executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/Logseq" "${pkgdir}/usr/bin/logseq"

    # create license folder and make soft links to actual license
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/opt/${pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}"

    # install readme and additional license file (the top-level AGPL3)
    cd "${srcdir}/${pkgname}"
    install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"

    # copy xdg desktop files
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/share/applications"
    install -Dm644 "logseq-desktop.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "logseq-desktop-wayland.desktop" -t "${pkgdir}/usr/share/applications"
}
