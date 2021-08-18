# Maintainer: Mogeko <zhengjunyi@live.com>

pkgname=mpv-autosubsync-git
_pkgname=${pkgname%-git}
pkgver=r100.ea6d616
pkgrel=2
pkgdesc='Automatic subtitle synchronization script for mpv media player'
arch=('any')
url='https://github.com/joaquintorres/autosubsync-mpv'
license=('MIT')
depends=(
  'mpv>=0.33'
  'alass'
)
optdepends=('python-ffsubsync: yet another backend')
makedepends=('git')
provides=('mpv-autosubsync')
source=(
  "$_pkgname::git+$url"
  'autosubsync.conf'
)
install="$pkgname.install"
sha256sums=(
  'SKIP'
  '9b060797d6c96a1af50a83da1e5f68b6d80307cc06dcb7a963cb2e513d567b68'
)

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm644 autosubsync.lua \
    -t "$pkgdir"/usr/share/mpv/scripts

  install -Dm644 "$srcdir/${source[1]}" \
    -t "$pkgdir"/usr/share/doc/mpv/script-opts/

  install -Dm644 LICENSE \
    -t "$pkgdir"/usr/share/licenses/"$pkgname"
}
