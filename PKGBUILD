# Contributor: Eric Belanger <eric@archlinux.org>
# Maintainer: Andrew Gregory <andrew.gregory.8@gmail.com>

pkgname=openrc-sysvinit
pkgdesc="Linux System V Init patched to use alternate inittab for openrc"
depends=('sysvinit')
install=sysvinit.install
pkgver=2.98
pkgrel=1
arch=('i686' 'x86_64')
url="http://savannah.nongnu.org/projects/sysvinit"
license=('GPL')
groups=('base')
source=(http://download.savannah.nongnu.org/releases/sysvinit/sysvinit-${pkgver}.tar.xz
        "0001-simplify-writelog.patch"
        "0002-remove-ansi-escape-codes-from-log-file.patch"
        "openrc-init.patch")
md5sums=('e3254f7622ea5cf2322b1b386a98ba59'
         '26bfc38ccd225814ef9dd02842109df2'
         'a913d77f6554699bc074428cc6b07589'
         'f60460c6a3bc58376562fc76568bf3d7')

prepare() {
  cd "$srcdir/sysvinit-${pkgver}dsf"

  # FS#30005
  patch -p1 -d "src" -i "$srcdir/0001-simplify-writelog.patch"
  patch -p1 -d "src" -i "$srcdir/0002-remove-ansi-escape-codes-from-log-file.patch"

  # use /etc/openrc/inittab instead of /etc/inittab
  patch -p1 -d "src" -i "$srcdir/openrc-init.patch"
}

build() {
  cd "$srcdir/sysvinit-${pkgver}dsf"
  make -C src init
}

package() {
  cd "$srcdir/sysvinit-${pkgver}dsf"
  install -d "$pkgdir/usr/bin"
  install -m 755 src/init "$pkgdir/usr/bin/init-openrc"
}
