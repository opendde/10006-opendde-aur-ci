# Maintainer: Your Name <kyli0x@protonmail.ch>

pkgname=kurcoder-git
pkgver=0.0.1
pkgrel=1
pkgdesc="Toolkit for encoding, decoding, checksums, hex conversions & IP calculations"
arch=('any')
url="https://github.com/0xkurome/kurcoder"
license=('MIT')
depends=('python3' 'python-pip')
makedepends=('git' 'python-setuptools')
conflicts=(kurcoder)
source=("git+$url")
md5sums=('SKIP')


build(){
    python3 -m pip install ipcalc
}


package() {
  cd "kurcoder"
  make DESTDIR="$pkgdir/" install
}
