# Maintainer: Kevin Del Castillo R. <quebin31@gmail.com>

pkgname=nvman
pkgver=1.2.3
pkgrel=5
pkgdesc="NVIDIA Manager for Optimus/Bumblebee"
arch=('any')
url=https://github.com/quebin31/nvman
license=('GPL')
depends=('bumblebee' 'primus' 'optimus-manager>=1.0')
optdepends=()
conflicts=()
options=()
install=$pkgname.install
source=("https://github.com/quebin31/$pkgname/archive/$pkgver.tar.gz")
md5sums=(9eab50d1dbd5d8508484d0667f5dc041)

package() {
    cd "$pkgname-$pkgver"

    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/lib/systemd/system/"
    mkdir -p "$pkgdir/etc/nvman/"

    install $pkgname "$pkgdir/usr/bin/"
    cp "$pkgname.service" "$pkgdir/usr/lib/systemd/system/"
    cp config "$pkgdir/etc/nvman/"
}
