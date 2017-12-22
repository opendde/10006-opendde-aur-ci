# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=light-locker-git
pkgver=1.7.0
pkgrel=1
pkgdesc='A simple session locker'
arch=('x86_64')
url='https://github.com/the-cavalry/light-locker'
license=('GPL2')
depends=('dbus-glib' 'gtk3' 'libxss' 'libxxf86misc' 'lightdm')
makedepends=('git' 'gnome-common' 'intltool')
provides=('light-locker')
conflicts=('light-locker')
source=('git+https://github.com/the-cavalry/light-locker.git'
        'light-locker-libsystemd-login.patch')
sha256sums=('SKIP'
            '6645624e195f7cc114b95d323dfd55c03bbdf6b01de10e694df6a97d5ef6eeaf')

pkgver() {
  cd light-locker

  printf "%s" "$(git describe --tags | sed 's/-/.r/; s/-g/./; s/^v//')"
}

prepare() {
  cd light-locker

  patch -Np1 -i ../light-locker-libsystemd-login.patch
}

build () {
  cd light-locker

  ./autogen.sh \
    --prefix='/usr' \
    --localstatedir='/var' \
    --sysconfdir='/etc' \
    --disable-schemas-compile \
    --disable-static \
    --with-{mit-ext,systemd,xf86gamma-ext,x} \
    --without-{console-kit,upower}
  make
}

package() {
  cd light-locker

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
