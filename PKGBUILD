# Maintainer: Gustavo Alvarez Lopez <sl1pkn07@gmail.com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Score_Under <seejay.11@gmail.com>

pkgname=xnp2-svn
pkgver=0.86.2819
pkgrel=1
pkgdesc="X Neko Project II, a PC-9801 emulator. (SVN Version)"
arch=('i686' 'x86_64')
url='http://www.nonakap.org/np2'
license=('BSD')
depends=('gtk2'
         'sdl2_mixer'
         'libxxf86vm'
         )
makedepends=('nasm')
conclicts=('xnp2')
provides=('xnp2')
source=("xnp2::svn+http://amethyst.yui.ne.jp/svn/pc98/np2/trunk/")
sha256sums=('SKIP')

pkgver() {
  cd xnp2
  _ver="$(cat np2ver.h | grep -m1 'NP2VER_CORE' | sed 's|NP2|NPTWO|g' | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.$(svnversion)"
}

prepare() {
  cd xnp2/x11
  ./autogen.sh
}

build() {
  cd xnp2/x11
  ./configure \
    --prefix=/usr \
    --enable-build-all \
    #--enable-gtk3

  LC_ALL=C make
}

package() {
  make -C "xnp2/x11" DESTDIR="${pkgdir}/" install
}
