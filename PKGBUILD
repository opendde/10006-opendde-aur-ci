# Maintainer: Yuri Pieters <magejohnyjtp+archlinux@gmail.com>
# Contributor: Ray Powell <ray+archlinux@xphoniexx.net>
# Contributor: Joe Davison <joedavison.davison@gmail.com>

# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=wxlauncher-git

pkgver=0.12.0.rc3.r13.gd72c97c
pkgrel=1

pkgdesc="A cross-platform launcher for the FreeSpace 2 Open engine - Git version"
# NOTE: architectures other than x86_64 have not been tested. However, all the hard dependencies
# are available for all the listed architectures, so they should work.
arch=('x86_64' 'i486' 'i686' 'pentium4' 'aarch64' 'armv7h')
url="https://github.com/scp-fs2open/wxLauncher"
license=(GPL2)

depends=(
  'sdl2' 
  'wxgtk3'
)
makedepends=(
  'cmake' 
  'git'
  'openal'
  'python'
  'python-markdown'
)
optdepends=(
  'fs2_open: FreeSpace 2 Open engine executable' 
  'openal: audio device configuration support'
)

provides=('wxlauncher')
conflicts=('wxlauncher')

source=(
  "git+https://github.com/scp-fs2open/wxLauncher.git"
  "wxwidgets-version.patch"
  "desktop-file-icon.patch"
)

sha256sums=(
  'SKIP'
  '32fa8bb01a8d41f8ca55bf31b229fd579ca0a895f97b4fa0257a1ac96887a670'
  '1e3e8426b4b5866488cb28c05de96746a770a77e3c8132ea31aeac5b966acad4'
)

pkgver() {
  cd wxLauncher || exit
  git describe --long --tags | sed -E 's/[^-]*-g/r\0/; s/rc\.(\d*)/rc\1/; s/-/./g'
}

prepare() {
  cd wxLauncher || exit
  patch --forward --strip=1 --input="../wxwidgets-version.patch"
  patch --forward --strip=1 --input="../desktop-file-icon.patch"
}

build() {
  cmake -B build \
        -S wxLauncher \
        -DUSE_OPENAL=1 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DwxWidgets_CONFIG_EXECUTABLE='/usr/bin/wx-config-gtk3' \
        -DwxWidgets_wxrc_EXECUTABLE='/usr/bin/wxrc' \
        -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # install the icon
  install -Dm644 wxLauncher/resources/wxlauncher.png \
          "$pkgdir/usr/share/icons/hicolor/256x256/apps/wxlauncher.png"
}
