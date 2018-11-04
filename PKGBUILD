# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# if tests fail due to timeout, you can try to increase the timeout
# by setting SYNCTHING_TEST_TIMEOUT_FACTOR

# set the web view provider: either webkit, webengine, auto or none
_webview_provider=${SYNCTHING_TRAY_WEBVIEW_PROVIDER:-webkit}

# set the JavaScript provider: either script, qml, auto or none
_js_provider=${SYNCTHING_TRAY_JS_PROVIDER:-qml}

# set to non-empty string to enable KIO plugin to show Syncthing actions in
# Dolphin file browser
_enable_kio_plugin=${SYNCTHING_TRAY_ENABLE_KIO_PLUGIN:-1}

# set to non-empty string to enable Plasmoid for Plasma 5 desktop
_enable_plasmoid=${SYNCTHING_TRAY_ENABLE_PLASMOID:-1}

[[ $_enable_kio_plugin == 0 ]] && _enable_kio_plugin=
[[ $_enable_plasmoid == 0 ]] && _enable_plasmoid=

_reponame=syncthingtray
pkgname=syncthingtray
pkgver=0.8.3
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='Tray application for Syncthing'
license=('GPL')
depends=('qtutilities' 'qt5-svg' 'openssl' 'desktop-file-utils' 'xdg-utils')
[[ $_webview_provider == none ]] && depends+=('qt5-base')
[[ $_webview_provider == webkit ]] && depends+=('qt5-webkit')
[[ $_webview_provider == webengine ]] && depends+=('qt5-webengine')
[[ $_enable_kio_plugin ]] && optdepends+=('kio: KIO plugin for Syncthing actions in Dolphin')
[[ $_enable_plasmoid ]] && optdepends+=('plasma-workspace: Plasmoid for Plasma 5 desktop')
makedepends=('cmake' 'qt5-tools' 'mesa')
checkdepends=('cppunit' 'syncthing')
[[ $_enable_kio_plugin ]] && makedepends+=('kio')
[[ $_enable_plasmoid ]] && makedepends+=('plasma-framework' 'extra-cmake-modules')
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('85c7578ce4b2d9c2454cfa4b5b3b5617829d1a77f579e7d33b34bd31542a8b32')

ephemeral_port() {
  comm -23 <(seq 49152 65535) <(ss -tan | awk '{print $4}' | cut -d':' -f2 | grep "[0-9]\{1,5\}" | sort | uniq) | shuf | head -n 1
}

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  local additional_args=
  [[ $_enable_kio_plugin ]] || additional_args+=' -DNO_FILE_ITEM_ACTION_PLUGIN=ON'
  [[ $_enable_plasmoid ]] || additional_args+=' -DNO_PLASMOID=ON'
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DWEBVIEW_PROVIDER="${_webview_provider}" \
    -DJS_PROVIDER="${_js_provider}" \
    -DSYSTEMD_SUPPORT=ON \
    $additional_args
  make
}

check() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make SYNCTHING_PORT=$(ephemeral_port) SYNCTHING_TEST_TIMEOUT_FACTOR=3 check
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make DESTDIR="${pkgdir}" install
}
