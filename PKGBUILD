# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=steam-wine-git
pkgver=1.1.r5.g00ceea8
pkgrel=1
pkgdesc="Steam with simple wine wrapper"
arch=('any')
url="https://github.com/Nefelim4ag/steam-wine"
license=('GPL3')
depends=('wine' 'winetricks' 'bash')
optdepends=('lib32-libpulse: for audio' 'wine-staging')
makedepends=('git')
#conflicts=()
source=("$pkgname"::'git://github.com/Nefelim4ag/steam-wine.git#branch=master')
md5sums=('SKIP')
install=$pkgname.install
backup=("etc/steam-wine.conf")

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/${pkgname}/"
    make install PREFIX="$pkgdir"
}
