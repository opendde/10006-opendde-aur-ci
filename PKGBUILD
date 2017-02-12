# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>
# Contributor: dserban <dserban01@yahoo.com>

pkgname=switchboard
pkgver=2.2.1
pkgrel=1
pkgdesc='The Pantheon Control Center'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard'
license=('GPL3')
groups=('pantheon')
depends=('clutter-gtk' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee' 'wayland'
         'libgranite.so')
makedepends=('cmake' 'intltool' 'vala')
optdepends=('switchboard-plug-about: About plug'
            'switchboard-plug-applications: Applications plug'
            'switchboard-plug-datetime: Date & Time plug'
            'switchboard-plug-desktop: Desktop plug'
            'switchboard-plug-display: Display plug'
            'switchboard-plug-elementary-tweaks: Elementary Tweaks plug'
            'switchboard-plug-keyboard: Keyboard plug'
            'switchboard-plug-locale: Locale plug'
            'switchboard-plug-network: Network plug'
            'switchboard-plug-notifications: Notifications plug'
            'switchboard-plug-power: Power plug'
            'switchboard-plug-security-privacy: Security & Privacy plug')
provides=('libswitchboard-2.0.so')
source=("https://launchpad.net/switchboard/2.x/${pkgver}/+download/switchboard-${pkgver}.tar.xz")
sha256sums=('1526abf7729c9552e4a878b1108f766b5ec8f304f34fb75bd75fe3b7ba4e6ab7')

prepare() {
  cd switchboard-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE' \
    -DUSE_UNITY='FALSE'
  make
}

package() {
  cd switchboard-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
