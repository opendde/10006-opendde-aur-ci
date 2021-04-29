# Maintainer: Bruno Miguel

pkgname=q-dns-git
pkgdesc='A tiny command line DNS client with support for UDP, DoT, DoH, and DoQ.'
arch=(x86_64)
url='https://github.com/natesales/q'
pkgrel=1
license=('GPL-3.0')
makedepends=('go' 'git')
source=('git+https://github.com/natesales/q')
md5sums=('SKIP')
provides=($pkgname)
conflicts=($pkgname)
pkgver=0.3.2.r3.gc11d592

pkgver() {
    cd 'q'
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd 'q'
  go build
}

package() {
  cd 'q'
  install -Dm755 q "$pkgdir/usr/bin/q"
}
