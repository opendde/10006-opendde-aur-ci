# Maintainer: luke bonham <dada [at] archlinux [dot] info>

pkgname=awesome-freedesktop-git
pkgcom=89
pkgsha=f9e7629
pkgver=$pkgcom.$pkgsha
pkgrel=1
pkgdesc="Freedesktop.org menu and desktop icons support for Awesome WM"
arch=('any')
url="https://github.com/copycat-killer/awesome-freedesktop"
license=('GPL2')
depends=('awesome')
makedepends=('git')
provides=('awesome-freedesktop')
conflicts=('awesome-freedesktop')
source=("git://github.com/copycat-killer/awesome-freedesktop.git")
md5sums=('SKIP')

package() {
  mv awesome-freedesktop freedesktop
  install -dm755 "$pkgdir/usr/share/awesome/lib/freedesktop"
  git --git-dir=freedesktop/.git --work-tree=freedesktop/ reset --hard $pkgsha --quiet
  rm -rf freedesktop/{wiki,.git*,*.rockspec,*TEMPLATE*,*.png}
  cp -a freedesktop "$pkgdir/usr/share/awesome/lib/"
}
