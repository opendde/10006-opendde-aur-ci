# Maintainer: Michael Carlberg <c@rlberg.se>
# Contributor: Michael Carlberg <c@rlberg.se>
pkgname=lemonbuddy
pkgver=0.1.0
pkgrel=2
pkgdesc="A fast and easy-to-use tool for Lemonbar."
arch=('i686' 'x86_64')
url="https://github.com/jaagr/lemonbuddy"
license=('MIT')
groups=()
depends=('sh' 'alsa-lib' 'libmpdclient' 'libxrandr' 'libsigc++')
optdepends=('lemonbar-sm-git' 'i3-wm' 'i3ipc-glib-git')
makedepends=('libsigc++' 'libmpdclient' 'libxrandr'
'cmake' 'pkg-config' 'clang' 'glibc'
'boost-libs' 'libx11' 'wireless_tools')

source=("git+https://github.com/jaagr/lemonbuddy.git#tag=0.1.0")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname" || exit
  git submodule update --init --recursive
  mkdir build
  cd build || exit
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/$pkgname/build" || exit
  make DESTDIR="$pkgdir/" install
  cd ..
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
