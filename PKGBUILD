# Maintainer: Julian Sparber <julian@sparber.net>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgname=mutter-hide-legacy-decorations
_pkgname=mutter
pkgver=3.18.3
pkgrel=1
pkgdesc="A window manager for GNOME (with a little hack to hide the window decorations on maximized legacy applications)"
arch=(i686 x86_64)
license=('GPL')
depends=('clutter' 'dconf' 'gobject-introspection-runtime' 'gsettings-desktop-schemas' 'libcanberra' 'startup-notification' 'zenity' 'libsm' 'gnome-desktop' 'upower' 'libxkbcommon-x11' 'gnome-settings-daemon')
makedepends=('intltool' 'libxkbcommon-x11' 'gobject-introspection')
conflicts=('mutter-wayland' 'mutter')
replaces=('mutter-wayland' 'mutter')
provides=('mutter')
url="https://github.com/jsparber/mutter-hide-legacy-decorations"
groups=('gnome')
options=('!emptydirs')
install=mutter.install
source=("http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/${pkgver:0:4}/${_pkgname}-$pkgver.tar.xz" 
        "pointer.patch"
        "hideTitlebar.patch")

sha256sums=('58dd88d5596bb0377ae3aed692b306995de45aefae9e215cfaf4b13287526846'
            'e413bbdaa7195f4604b77eee7239bad234ba0888acf45cbf372b55928a821a4e' 
            'ec1a0f5f98213c340e907761e72fc3e22cb9c8ff503c6c234a4a41aac4ec7ac4')

prepare() {
  cd "${_pkgname}-$pkgver"
}

build() {
  cd "${_pkgname}-$pkgver"
  patch -Np1 -i ../pointer.patch
  patch -p1 -i $srcdir/hideTitlebar.patch

  ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/mutter \
      --localstatedir=/var --disable-static \
      --disable-schemas-compile --enable-compile-warnings=minimum

  #https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "${_pkgname}-$pkgver"
  make DESTDIR="$pkgdir" install
}
