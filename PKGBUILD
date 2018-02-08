# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>
# Contributor: ultraviolet <ultravioletnanokitty@gmail.com>
# Contributor: Mark Rosenstand <mark@borkware.net>
# Contributor: graysky <graysky AT archlinux DOT us>

pkgname=sysbench
pkgver=1.0.12
pkgrel=1
pkgdesc="Benchmark tool for evaluating OS parameters that are important for a system running a database under intensive load."
url="https://github.com/akopytov/sysbench"
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
license=('GPL')
depends=('mariadb-clients' 'postgresql-libs')
makedepends=('libxslt' 'vim')
source=("$pkgname-$pkgver.tar.gz::https://github.com/akopytov/$pkgname/archive/$pkgver.tar.gz")
md5sums=('d9c6597b1b3da8541cece0fabc84890c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --with-pgsql
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}
