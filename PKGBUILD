#
# vasm PKGBUILD
#
# Maintainer: uffe Jakobsen <_uffe_-at-_uffe_-_dot_-_org>

_pkgver="1_7g"

pkgname=vasm
pkgver=1.7g
pkgrel=1
pkgdesc="Portable and retargetable 6502 6800 arm c16x jagrisc m68k ppc test tr3200 vidcore x86 z80 assembler."
arch=('i686' 'x86_64')
url="http://sun.hasenbraten.de/vasm/"
license=('custom')
depends=()
source=(http://server.owl.de/~frank/tags/${pkgname}${_pkgver}.tar.gz)
md5sums=('53e32b357e7356b94e7cc4378320c8ab')

CPU_LIST="6502 6800 arm c16x jagrisc m68k ppc test tr3200 vidcore x86 z80"
SYNTAX_LIST="std madmac mot oldstyle" # test
OUTPUT_LIST="aout bin elf hunk test tos vobj"

build() {
  cd ${srcdir}/${pkgname}
  #make doc/vasm.pdf
  #make doc/vasm.html
  for CPU in ${CPU_LIST}; do
    for SYNTAX in ${SYNTAX_LIST}; do
      make CPU=${CPU} SYNTAX=${SYNTAX}
    done
  done
}

package() {
  cd ${srcdir}/${pkgname}
  mkdir -p ${pkgdir}/usr/bin
  for CPU in ${CPU_LIST}; do
    for SYNTAX in ${SYNTAX_LIST}; do
      cp vasm${CPU}_${SYNTAX} ${pkgdir}/usr/bin
    done
  done
}

#
# EOF
#
