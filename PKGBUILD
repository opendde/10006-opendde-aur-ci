# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# set the web view provider: either webkit, webengine, auto or none
_webview_provider=webkit

_reponame=syncthingtray
pkgname=syncthingtray
pkgver=0.3.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Tray application for Syncthing'
license=('GPL')
depends=('qtutilities' 'qt5-svg' 'openssl' 'desktop-file-utils' 'xdg-utils')
[[ $_webview_provider == none ]] && depends+=('qt5-base')
[[ $_webview_provider == webkit ]] && depends+=('qt5-webkit')
[[ $_webview_provider == webengine ]] && depends+=('qt5-webengine')
makedepends=('cmake' 'qt5-tools')
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('953f3eda974582b402a915e759dedd6d2d4b958de3945d93f707076444092cf7')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DWEBVIEW_PROVIDER="${_webview_provider}" \
    -DSYSTEMD_SUPPORT=ON
  make
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make DESTDIR="${pkgdir}" install
}
