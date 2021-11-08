# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Kuklin István <kuklinistvan@zoho.com>
pkgname=anki-official-binary-bundle
pkgver=2.1.49
pkgrel=1
epoch=
pkgdesc="The official binary shipped with the tested versions of the dependent libraries."
arch=('x86_64')
url="https://apps.ankiweb.net"
license=('GNU AGPL')
groups=()
depends=('libxkbcommon-x11')
makedepends=()
checkdepends=()
optdepends=('mpv')
provides=('anki')
conflicts=('anki' 'anki-git')
replaces=()
backup=()
options=()
install=
changelog=
topdirname="anki-$pkgver-linux"
source=(
  "https://github.com/ankitects/anki/releases/download/${pkgver}/${topdirname}.tar.bz2"
  "install_sh.patch"
)
noextract=()
md5sums=('d0c13ae7cf988358fb231645f6490088'
         '82d6fb7eb10ec0ae592093d89d8d5957')

validpgpkeys=()

prepare() {
  cd "$srcdir"
  ln -s "$topdirname" anki
  patch -p0 -i install_sh.patch anki/install.sh
  rm anki
}

build() {
	cd "$topdirname"
}

package() {
	cd "$topdirname"
    PREFIX="$pkgdir"/usr/ ./install.sh
}
