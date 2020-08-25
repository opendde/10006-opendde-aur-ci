# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Francois Boulogne <fboulogne at april dot org>

pkgname=python-liblarch
pkgver=3.0.1
pkgrel=3
pkgdesc="Python library to easily handle data structure"
arch=(any)
url=https://wiki.gnome.org/action/show/Projects/liblarch
license=(LGPL3)
depends=(gtk3 python python-gobject)
makedepends=(python-distribute)
checkdepends=(python-nose)
provides=(python-liblarch_gtk)
conflicts=(python-liblarch_gtk)
source=("https://github.com/liblarch/liblarch/archive/v${pkgver}.tar.gz")
sha256sums=('3a866cc43873454b88ae5526207555aca1f0e16e3120577d6135ea13db98ca68')

check() {
  cd "$srcdir/liblarch-${pkgver}"

  # In order to allow GTK to work it needs a display server. To avoid running
  # an X server (like Xephyr) or a Wayland compositor, we can instead use the
  # built-in Broadway backend, listening on a random socket.
  local broadway_display=":$RANDOM"
  local broadway_pid

  broadwayd --unixsocket "$(pwd)/broadway.socket" "${broadway_display}" &
  broadway_pid=$!

  # Now run the tests, pointing GTK to the Broadway server started above.
  GDK_BACKEND=broadway BROADWAY_DISPLAY="${broadway_display}" python run-tests

  # Once done, kill the Broadway server.
  kill "${broadway_pid}"
}

package() {
  cd "$srcdir/liblarch-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
