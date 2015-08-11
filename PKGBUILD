# Maintainer: Andrew Krasichkov <buglloc _ at _ yandex _ dot _ru>

pkgname=brick
pkgver=0.2.0.31
pkgrel=1
pkgdesc="Unofficial Bitrix24 messenger client"
arch=('i686' 'x86_64')
url="https://github.com/buglloc/brick"
license=("MIT")
depends=("alsa-lib" "desktop-file-utils" "gconf" "libxtst" "libxss" "xdg-utils" "gtk2" "libnotify" "nss")
optdepends=("libappindicator-gtk2: modern system indicator support for KDE5, Cinnamon, Unity, etc")
conflicts=("brick-git" "mesa-demos")
makedepends=("p7zip" "cmake")
install=${pkgname}.install
source=("https://github.com/buglloc/brick/archive/v${pkgver}.tar.gz")
source_i686=("https://github.com/buglloc/cef-builds/raw/79c6f03ac3d4eb3332d6c374d9a9cb0fa3be742b/libs/cef-i686.tar.gz")
sha256sums=("269070fe0043e5924eded7adf10ed8300b42ca042d6efddc8c56e981f9f01c46")
sha256sums_i686=("134454435e24ecae8be9430cb36e2a6095f780443e2e09ac05a4e41beb85d253")


build() {
  cd ${srcdir}

  if [ $CARCH == "i686" ];
  then
    rm -f "brick-${pkgver}/Release/*"
    cp -arf cef-i686/* "brick-${pkgver}/Release"
  fi

  mkdir -p out
  cd out
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir} -DUNITY_DESKTOP=OFF "../brick-${pkgver}"
  make
}

package() {
  cd ${srcdir}/out
  make install
  install -dm755 "${pkgdir}/usr/bin"
  rm -f "${pkgdir}/usr/bin/brick"
  rm -f "${pkgdir}/usr/bin/brick-client"
  ln -s /opt/brick/brick "${pkgdir}/usr/bin/brick"
  ln -s /opt/brick/bin/brick-client "${pkgdir}/usr/bin/brick-client"
}
