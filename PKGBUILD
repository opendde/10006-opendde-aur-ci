# Maintainer: ml <ml@visu.li>
# Contributor: Jean Lucas <jean@4ray.co>

# TODO cleanup asar, drop as much as possible, remove local references
pkgname=whalebird-desktop
pkgver=4.0.0
pkgrel=1
pkgdesc='Electron-based Mastodon/Pleroma client'
arch=('any')
url='https://whalebird.org'
license=('MIT')
depends=('electron7')
makedepends=('git' 'npm')
provides=('whalebird')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/h3poteto/${pkgname}/archive/${pkgver}.tar.gz"
  whalebird.desktop
  whalebird.sh)
sha256sums=('6d83d110c60b9157f462f237c1fb5bf97faa2b3873e1fee789d592403be402c8'
            '8feed931453da872291c4588c981007ed36566155cfcf55ab3ff5d7431d60aef'
            '954180114cb48945084ffb91472d8bf4cdd37fe8d30a31a13363e1a7060062a4')

_npmopt=(--no-audit --no-progress --no-fund)
prepare() {
  cd "${pkgname}-${pkgver}"
  #npm "${_npmopt[@]}" --ignore-scripts uninstall electron{,-debug,-devtools-installer} listr cross-env \
  #  cfonts chalk webpack-dev-server stylelint{,-config-standard} ttfinfo prettier-stylelint
  npm "${_npmopt[@]}" --ignore-scripts install electron@"$(</usr/lib/electron7/version)"

  # run install script for node-sass only
  node node_modules/node-sass/scripts/install.js
}

build() {
  cd "${pkgname}-${pkgver}"
  export NODE_ENV=production

  # the same as calling `node .electron-vue/build.js` but doesn't try to display fancy text
  for c in webpack.{main,renderer}.config.js; do
    npx --no-install webpack --mode production --config=.electron-vue/"$c"
  done

  # make cachefiles writable for makepkg -c to work
  chmod -R u+w node_modules/.cache

  npx electron-builder --linux --dir \
    -c.electronDist=/usr/lib/electron7 \
    -c.electronVersion="$(</usr/lib/electron7/version)"
}

package() {
  install -Dm755 whalebird.sh "${pkgdir}/usr/bin/whalebird"
  install -Dm644 -t "${pkgdir}/usr/share/applications" whalebird.desktop

  cd "${pkgname}-${pkgver}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt

  cd build
  cp -r linux-unpacked/resources "${pkgdir}/usr/share/${pkgname}"

  cd icons/icon.iconset
  for i in 16 32 128 256 512; do
    install -Dm644 "icon_${i}x${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done
}
