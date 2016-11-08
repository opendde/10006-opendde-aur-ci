# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=leagueoflegends-git
pkgver=1.0
pkgrel=1
pkgdesc="League Of Legends: Install/Run wrapper"
arch=('any')
url="https://github.com/Nefelim4ag/League-Of-Legends"
license=('GPL3')
depends=('wine-staging' 'winetricks' 'bash')
source=("$pkgname"::'git://github.com/Nefelim4ag/League-Of-Legends.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/${pkgname}/"
  ./install.sh PREFIX="$pkgdir"
}
