# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# set the web view provider: either webkit, webengine, auto or none
_webview_provider=webkit

# set to non-empty string to enable KIO plugin to show Syncthing actions in
# Dolphin file browser
_enable_kio_plugin=1

_reponame=syncthingtray
pkgname=syncthingtray
pkgver=0.5.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Tray application for Syncthing'
license=('GPL')
depends=('qtutilities' 'qt5-svg' 'openssl' 'desktop-file-utils' 'xdg-utils')
[[ $_webview_provider == none ]] && depends+=('qt5-base')
[[ $_webview_provider == webkit ]] && depends+=('qt5-webkit')
[[ $_webview_provider == webengine ]] && depends+=('qt5-webengine')
[[ $_enable_kio_plugin ]] && optdepends+=('kio: KIO plugin for Syncthing actions in Dolphin')
makedepends=('cmake' 'qt5-tools')
[[ $_enable_kio_plugin ]] && makedepends+=('kio')
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('8dfa07e224d691c3c58a5e354b9ed4bdfb8fc982fdbed47e07da3feb660f49cd')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  local additional_args=
  [[ $_enable_kio_plugin ]] || additional_args+=-DNO_FILE_ITEM_ACTION_PLUGIN=ON
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DWEBVIEW_PROVIDER="${_webview_provider}" \
    -DSYSTEMD_SUPPORT=ON \
    $additional_args
  make
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make DESTDIR="${pkgdir}" install
}
