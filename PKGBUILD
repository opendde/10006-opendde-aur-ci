# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Peter Feigl <craven@gmx.net>
pkgname=chez-scheme-git
pkgver=9.4
pkgrel=1
pkgdesc="Chez Scheme, threaded"
arch=(i686 x86_64)
url="https://github.com/cisco/ChezScheme"
license=('APL')
groups=()
depends=()
makedepends=('git' 'ncurses' 'libx11' 'xproto')
provides=(chez-scheme)
conflicts=(petite-chez-scheme)
replaces=(petite-chez-scheme)
backup=()
options=()
install=
source=()
noextract=()
#generate with 'makepkg -g'

_gitroot=https://github.com/cisco/ChezScheme.git
_gitname=chez

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  ./configure --installprefix=/usr --temproot=$pkgdir --threads
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install InstallSchemeName=chez-scheme
}

# vim:set ts=2 sw=2 et:
