# Maintainer: Metal A-wing <1 at 233 dot email>

pkgname=argus
pkgver=3.0
pkgrel=1
pkgdesc="auxiliary reliable guardian undertaking system"
arch=('any')
url="https://github.com/JRT-FOREVER/argus"
license=('GPL3')
depends=('python' 'python-bottle')

#source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
#md5sums=('SKIP')

source=("git+${url}")
sha256sums=('SKIP')

package() {
  cd ${pkgname}
  PREFIX=$pkgdir make install
}

