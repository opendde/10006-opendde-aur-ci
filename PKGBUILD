# Maintainer: luke bonham <dada [at] archlinux [dot] info>

pkgname=lain-git
pkgcom=1527
pkgsha=b14eff9
pkgver=$pkgcom.$pkgsha
pkgrel=1
pkgdesc="Layouts, asynchronous widgets and utilities for Awesome WM"
arch=('any')
url="https://github.com/copycat-killer/lain"
license=('GPL2')
depends=('awesome')
optdepends=('curl: for widgets accessing network resources')
makedepends=('git')
provides=('lain')
conflicts=('lain')
source=("git://github.com/copycat-killer/lain.git")
md5sums=('SKIP')

package() {
  install -dm755 "$pkgdir/usr/share/awesome/lib/lain"
  git --git-dir=lain/.git --work-tree=lain/ reset --hard $pkgsha --quiet
  rm -rf lain/{wiki,.git*,*.rockspec,*TEMPLATE*}
  cp -a lain "$pkgdir/usr/share/awesome/lib/"

  # Fix permissions
  find "$pkgdir" -type f ! -path "*/scripts/*" -print0 | xargs -0 chmod -R 644
}
