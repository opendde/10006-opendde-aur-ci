# Maintainer: Cat2048 <xdotoolhelper@outlook.com>
pkgname=xdotoolhelper-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple shell script to generate xdotool scripts."
arch=('any')
url="https://github.com/gamingdoom/xdotoolhelper"
license=('GPL3')
depends=()
makedepends=('git')
source=('git+https://github.com/gamingdoom/xdotoolhelper.git')
noextract=()
sha256sums=('SKIP')

package() {
  ls
  cd "xdotoolhelper"
  cp -v xdotoolhelper.sh xdotoolhelper
  chmod 755 xdotoolhelper
  install -Dt "$pkgdir"/usr/bin xdotoolhelper
}
