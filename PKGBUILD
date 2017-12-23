# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-scummvm-git
pkgver=84203.6345d9a9aa
pkgrel=2
pkgdesc="libretro implementation of ScummVM."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/scummvm"
license=('GPL')
groups=('libretro')
makedepends=('git')

_libname=scummvm_libretro
_gitname=scummvm
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}/backends/platform/libretro/build"
  make
}

package() {
  install -Dm644 "${_gitname}/backends/platform/libretro/build/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
