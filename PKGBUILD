# $Id$
# Maintainer: tuxayo <victor (replace by @) tuxayo DOT net>
# Contributor:  Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: t3ddy  <t3ddy1988 "at" gmail {dot} com>
# Contributor: AdriÃ¡n Chaves FernÃ¡ndez (Gallaecio) <adriyetichaves@gmail.com>
pkgname=('0ad-git' '0ad-data-git')
_pkgname=0ad
pkgver=26504
pkgrel=1
arch=('i686' 'x86_64')
url="http://play0ad.com/"
license=('GPL2' 'CCPL')
depends=('binutils' 'boost-libs' 'curl' 'enet' 'libogg' 'libpng' 'libvorbis'
         'libxml2' 'openal' 'sdl2' 'wxgtk2' 'zlib' 'libgl' 'glu'
         'gloox' 'miniupnpc' 'icu' 'nspr')
makedepends=('boost' 'cmake' 'mesa' 'zip' 'python2' 'libsm' 'git')
source=("git+https://github.com/0ad/0ad.git")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git rev-list --count HEAD
}

prepare() {
  cd "$srcdir/${_pkgname}"
}

build() {
  cd "$srcdir/${_pkgname}/build/workspaces"

  unset CPPFLAGS # for le spidermonkey
  export SDL2_CONFIG="pkg-config sdl2"

  ./update-workspaces.sh \
      --bindir=/usr/bin \
      --libdir=/usr/lib/0ad \
      --datadir=/usr/share/${pkgname}/data

  cd "$srcdir/${_pkgname}/libraries/source/fcollada/src"
  make # always keep uncommented
  # OPTIONAL: uncomment for a debug build, it's a 2nd executable named
  # `pyrogenesis_dbg`
  # It's independent from the debug symbols and not as important as them.
  # https://trac.wildfiregames.com/wiki/Debugging#CallstackonLinuxmacOS
  # It's likely a small increase of build time.
  # And up to a 1.2 GiB in total used space. (inc. package build files)
  # Note there is something else to uncomment below in package_0ad-git()
  # make config=debug

  cd "$srcdir/${_pkgname}/build/workspaces/gcc"
  make # always keep uncommented
  # OPTIONAL: uncomment for a debug build, see above
  # make config=debug
}

package_0ad-git() {
  pkgdesc="Cross-platform, 3D and historically-based real-time strategy game — built from git development version."
  conflicts=('0ad')
  depends=('0ad-data-git')
  provides=('0ad')

  install -d "${pkgdir}"/usr/{bin,lib/${_pkgname}}
  cd "$srcdir/${_pkgname}"

  install -Dm755 binaries/system/pyrogenesis "${pkgdir}/usr/bin"
  # OPTIONAL: uncomment below for debug build. See the comments around the `make` calls
  #install -Dm755 binaries/system/pyrogenesis_dbg "${pkgdir}/usr/bin"

  install -Dm755 binaries/system/*.so "${pkgdir}/usr/lib/${_pkgname}"

  install -Dm755 build/resources/${_pkgname}.sh "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 build/resources/${_pkgname}.desktop \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 build/resources/${_pkgname}.png \
    "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}

package_0ad-data-git() {
  pkgdesc="Data package for 0ad built from git development version."
  conflicts=('0ad-data')
  depends=('0ad-git')
  provides=('0ad-data')

  mkdir -p ${pkgdir}/usr/share/${_pkgname}-git
  cp -r ${srcdir}/${_pkgname}/binaries/data ${pkgdir}/usr/share/${_pkgname}-git
}
