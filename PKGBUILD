# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

_pkgbin=steam-rom-manager
pkgname=steam-rom-manager-git
pkgdesc="An app for managing ROMs in Steam (Git version)."
license=("GPL3")
url="https://github.com/SteamGridDB/steam-rom-manager"
pkgver=2.3.29.r20.g71c11eb
pkgrel=1
arch=("x86_64")
makedepends=("git" "nodejs-lts-gallium" "npm")
provides=("steam-rom-manager")
conflicts=("steam-rom-manager-git" "steam-rom-manager")
source=("$pkgname::git+https://github.com/SteamGridDB/steam-rom-manager"
        "steam-rom-manager.desktop")
sha512sums=("SKIP"
            "ff714e294c4fe0282327614ee93249d154ee77086d41e0964e61ad297472e9a0787b71ef274ecd5b86fd97ec23ab655870519f673b113e893f1678f0897abaac")

pkgver() {
  cd $pkgname

  ( set -o pipefail
    # cutting off 'v' prefix that presents in the git tag
    git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $pkgname
  npm ci
}

build() {
  cd $pkgname
  npm run build:dist
  npm run build:linux
}

package() {
  install -Dm644 "${_pkgbin}.desktop" "${pkgdir}/usr/share/applications/${_pkgbin}.desktop"

  cd $pkgname

  install -dm755 "${pkgdir}/opt"
  cp -r "release/linux-unpacked" "${pkgdir}/opt/${_pkgbin}"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgbin}/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"

  install -Dm644 "src/assets/icons/16x16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${_pkgbin}.png"
  install -Dm644 "src/assets/icons/32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgbin}.png"
  install -Dm644 "src/assets/icons/48x48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${_pkgbin}.png"
  install -Dm644 "src/assets/icons/96x96.png" "${pkgdir}/usr/share/icons/hicolor/96x96/apps/${_pkgbin}.png"
  install -Dm644 "src/assets/icons/256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgbin}.png"
  install -Dm644 "src/assets/icons/512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgbin}.png"
  install -Dm644 "src/assets/icons/1024x1024.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${_pkgbin}.png"
  install -Dm644 "src/assets/icons/${_pkgbin}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgbin}.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
