# Maintainer: Alex Agura <agura@tfwno.gf>
pkgname=asus-fan-control
pkgver=3.12.0
pkgrel=1
pkgdesc="Fan control for ASUS devices running Linux."
arch=('any')
url="https://github.com/dominiksalvet/asus-fan-control"
license=('MIT')
depends=(acpi_call dmidecode)
makedepends=(git)
optdepends=('acpi_call-lts: for the linux-lts kernel'
            'acpi_call-dkms: for other non-standard kernels')
install=$pkgname.install
source=("https://github.com/dominiksalvet/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('53d1c9b75da788efc5357641901222171ada824d7f38d02d33cad7d7b5fee4ee')

prepare(){
    cd "$pkgname-$pkgver"

    # Our asus-fan-control executable is installed to /usr/bin
    sed -ie '/^ExecStart/s:/local::' .install/afc.service
}

package() {
    cd "$pkgname-$pkgver"

    for dir in usr/{bin,lib/systemd/system,share/{bash-completion/completions,asus-fan-control}} etc/asus-fan-control; do
        mkdir -p $pkgdir/$dir
    done

    install -m755 src/asus-fan-control $pkgdir/usr/bin
    install -m644 src/bash/afc-completion $pkgdir/usr/share/bash-completion/completions/asus-fan-control
    install -m644 src/data/models $pkgdir/usr/share/asus-fan-control
    install -m644 .install/afc.service $pkgdir/usr/lib/systemd/system

}
