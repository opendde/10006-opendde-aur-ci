# Maintainer: nandub <dev@nandub-dev.tk>
pkgname=gale-git
pkgver=20130304
pkgrel=3
pkgdesc="Gale is instant messaging software"
arch=('i686')
url="http://www.gale.org"
license=('GPL2')
depends=('bash' 'gc' 'openssl' 'adns-ipv6')
makedepends=('git')

_gitroot=https://github.com/nandub/gale.git
_gitname=gale

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  cd "$srcdir/$_gitname"

  ./bootstrap && ./configure --prefix=/usr || exit 1
  make 
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
