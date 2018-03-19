# Maintainer:  Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-mame-git
pkgver=57546.893f1ac2231
pkgrel=2
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
pkgdesc="libretro implementation of MAME. (Arcade)"
url="https://github.com/libretro/mame"
license=('custom:MAME License')
groups=('libretro')
depends=('zlib' 'glibc' 'libretro-core-info')
makedepends=('git' 'python2')

_libname=mame_libretro
_gitname=mame
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make NOWERROR=1 CONFIG="libretro"
  # Suggestion by "Enverex". Works also.
  # make OSD="retro" verbose=1 RETRO=1 NOWERROR=1 OS="linux" TARGETOS="linux" CONFIG="libretro" NO_USE_MIDI="1" PTR64=1 TARGET=mame SUBTARGET=arcade
}

package() {
  install -Dm644 "${_gitname}/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
  install -Dm644 "${_gitname}/docs/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
