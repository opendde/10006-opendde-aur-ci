# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=git-punish
pkgver=20150922
pkgrel=1
pkgdesc="Post snippets created with git blame to git-punish.io"
arch=(any)
url="http://git-punish.io/"
license=('unknown')
depends=('curl' 'git')
source=("git-punish::http://git-punish.io/get")
md5sums=('7de1f20422393a6c68c648c3dd150ca5')
sha256sums=('5498f3ef30ba09f490d840c09685b74fe9c1b1695a5cac73a717164b09ec0bd0')

package() {
  install -Dm755 "$srcdir/git-punish" "$pkgdir/usr/bin/git-punish"
}
