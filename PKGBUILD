# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-games
pkgver=0.12
pkgrel=1
pkgdesc="C++ 2D games library"
url='https://www.efanomars.com/libraries/stmm-games'
arch=('x86_64')
license=('LGPL3')

depends=('stmm-input' 'gtkmm' 'librsvg' 'libxml++2.6')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("stmm-games")
#replaces=("stmm-games")
#conflicts=("stmm-games")

source=('git+https://gitlab.com/efanomars/stmm-games.git#commit=fdd391d2fc34467bf7d662c806fe92d1ca773883')
sha512sums=('SKIP')

build() {
  cd "${srcdir}/stmm-games"

  ./scripts/install_stmm-games-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-games"

  ./scripts/priv/dd_install_stmm-games-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
