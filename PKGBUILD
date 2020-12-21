# Maintainer: Emanuele Faranda <black.silver@hotmail.it>

# Based on https://aur.archlinux.org/packages/syncthingtray by
# Martchus <martchus@gmx.net>.

# if tests fail due to timeout, you can try to increase the timeout
# by setting SYNCTHING_TEST_TIMEOUT_FACTOR

# set the web view provider: either webkit, webengine, auto or none
_webview_provider=${SYNCTHING_TRAY_WEBVIEW_PROVIDER:-webengine}

_reponame=syncthingtray
pkgname=syncthingtray-lite
pkgver=1.1.0
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='Tray application for Syncthing - without the KDE integrations'
license=('GPL')
depends=('qtutilities' 'qt5-svg' 'openssl' 'desktop-file-utils' 'xdg-utils')
[[ $_webview_provider == none ]] && depends+=('qt5-base')
[[ $_webview_provider == webkit ]] && depends+=('qt5-webkit')
[[ $_webview_provider == webengine ]] && depends+=('qt5-webengine')
makedepends=('cmake' 'ninja' 'qt5-tools' 'mesa')
conflicts=('syncthingtray' 'syncthingtray-git')
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('730301d51744c7c54a393b06a3a02cd93d2275d8864d8a2dc84a86afc901756f')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"

  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DWEBVIEW_PROVIDER="${_webview_provider}" \
    -DJS_PROVIDER="none" \
    -DSYSTEMD_SUPPORT=ON \
    -DNO_FILE_ITEM_ACTION_PLUGIN=ON \
    -DNO_PLASMOID=ON \
    .
  ninja
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  DESTDIR="${pkgdir}" ninja install
}
