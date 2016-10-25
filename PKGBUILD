pkgname=cava-gui-git
_pkgname=cava
pkgver=r284.164c494
pkgrel=1
pkgdesc='GUI Audio Visualizer for Alsa/Pulseaudio'
arch=('i686' 'x86_64')
url='https://github.com/nikp123/cava-gui'
license=('MIT')
depends=('fftw' 'alsa-lib' 'iniparser' 'ncurses' 'libx11' 'sdl2')
makedepends=('git' 'libtool' 'automake')
source=('git+https://github.com/nikp123/cava.git')
conflicts=($_pkgname)
provides=($_pkgname)
sha1sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  ./autogen.sh
  ./configure
  make
}

package() {
  cd $_pkgname
  install -Dm755 cava "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  install -Dm744 example_files/desktop/icon.png "$pkgdir/usr/share/$_pkgname/icon.png"
  install -Dm744 example_files/desktop/"$_pkgname".desktop "$pkgdir"/usr/share/applications/"$_pkgname".desktop
}


