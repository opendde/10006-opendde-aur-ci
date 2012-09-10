# Maintainer: jjacky
pkgname=kalu-git
pkgver=20120910
pkgrel=1
pkgdesc="Upgrade notifier w/ AUR support, watched (AUR) packages, news"
arch=('i686' 'x86_64')
url="https://github.com/jjk-jacky/kalu"
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman>=4.0.1' 'pacman<4.1' 'curl' 'libnotify' 'notification-daemon' 'xdg-utils')
makedepends=('git' 'autoconf')
provides=('kalu')
conflicts=('kalu')

_gitroot=https://github.com/jjk-jacky/kalu
_gitname=master

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
  autoreconf -i
  ./configure --prefix=/usr --enable-git-version
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
