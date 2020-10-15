# Maintainer: vagnum08 <vagnum08@gmail.com>

pkgname=cpupower-gui-git
pkgver=0.9.1.r0.gfe156fa
pkgrel=1
pkgdesc="A GUI utility to set CPU frequency limits"
arch=(any)
url="https://github.com/vagnum08/cpupower-gui"
license=('GPL')
depends=('python' 'gtk3' 'hicolor-icon-theme' 'polkit' 'python-dbus' 'python-gobject' 'pyxdg')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
            'lxsession: needed for authentification in Xfce, LXDE etc.'
	    'libappindicator-gtk3: needed for tray icon')

makedepends=('git' 'meson' 'pkg-config' 'appstream-glib' 'desktop-file-utils')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/vagnum08/cpupower-gui.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

}


build() {
  meson --prefix /usr -Dsystemddir=/usr/lib/systemd --buildtype=plain "$srcdir/${pkgname%-git}" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"
}


