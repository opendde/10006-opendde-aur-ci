# $Id$
# Maintainer: prg <prg-archlinux@xannode.com>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Denis A. Altoe Falqueto <denisfalqueto@gmail.com>

_gitname=projectm
pkgname=projectm-git
pkgver=2281.17cfcda0d
pkgrel=1
conflicts=('projectm')
provides=('projectm')
pkgdesc="Music visualizer which uses 3D accelerated iterative image based rendering (git version)"
arch=('x86_64' 'i686')
url='https://github.com/projectM-visualizer/projectm'
license=('LGPL')
depends=('sdl2' 'libxext' 'glm')
makedepends=('cmake')
source=("git+https://github.com/projectM-visualizer/${_gitname}.git")
sha256sums=(SKIP)
options=('!buildflags')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  mkdir -p build
  cd build
  cmake -DENABLE_STATIC_LIB=OFF -DENABLE_SHARED_LINKING=ON ../
  make
}

package() {
  cd "${_gitname}/build"
  DESTDIR="$pkgdir" make install
  DESTDIR="$pkgdir" install -Dm644 "${srcdir}/${_gitname}/src/libprojectM/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
