# Author PrivatBank <acsk@privatbank.ua>
# Maintainer Stoyan Minaev <stoyan.minaev@gmail.com>

pkgname=cryptoplugin
pkgver=1.2.2
pkgrel=1
pkgdesc="PrivatBank Crypto Plugin"
license=('custom')
source=(
    "https://master.dl.sourceforge.net/project/host-privatbank-cryptoplugin/$pkgname-$pkgver-all.deb"
    "cryptoplugin.install"
)
arch=('any')
md5sums=(
    '0d8173b4f5c0c23616d6f4b90ca5b589'
    'dbd0b80e618c8bee39b65c444eb05240'
)
depends=(glibc gtk2 pcsclite)
install=cryptoplugin.install

package() {
    cd $srcdir
    tar xf data.tar.gz -C $pkgdir/
}

#vim: syntax=sh
