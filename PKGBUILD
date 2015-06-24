# Maintainer: danb <danielbusch1992@googlemail.com>

pkgname=makefontpkg
pkgver=20150624
pkgrel=1
pkgdesc="Tool for creating packages from TrueType and OpenType fonts"
arch=('x86_64' 'i686')
url='http://github.com/misterdanb/makefontpkg'
license=('GPLv3')
depends=('python3')
makedepends=('git')
options=('!strip' '!emptydirs')
source=('makefontpkg::git://github.com/misterdanb/makefontpkg.git')
md5sums=('SKIP')

package() {
  install -Dm755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
