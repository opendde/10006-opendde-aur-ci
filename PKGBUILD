# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=envchain
pkgver=1.0.0
pkgrel=1
pkgdesc='Set environment variables with D-Bus secret service'
arch=('i686' 'x86_64')
url='https://github.com/sorah/envchain'
license=('MIT')
depends=('readline' 'libsecret')
source=("https://github.com/sorah/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('cd190c8c9a86ebf0723491b5372051e84eaaf3252ccc9da6554caa45bd5eae20')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 envchain "$pkgdir/usr/bin/envchain"
}

# vim: set ft=sh:
