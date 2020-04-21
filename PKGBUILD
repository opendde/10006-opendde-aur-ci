# Maintainer: somini <dev@somini.xyz>
pkgbase=inpulse-to-talk
pkgname=inpulse-to-talk
pkgver=v1.0.0
pkgrel=1
pkgdesc="Push-to-Talk with libinput + Pulseaudio"
url="https://gitlab.com/somini/inpulse-to-talk"
# Technically, 'pulseaudio-ctl' is optdepends
# TODO: `python-libinput>0.3.0`, wait for release
depends=('python' 'python-libinput>0.1.0' 'pulseaudio-ctl')
makedepends=()
license=('GPL3')
arch=('any')
source=(
    "$pkgname-$pkgver.tar.gz::https://gitlab.com/somini/inpulse-to-talk/-/archive/$pkgver/inpulse-to-talk-$pkgver.tar.gz"
    )
sha256sums=('f263da23a79cc4d4c6612973f93fbec83054ec8c6de443929ce46bb32b4d5f09')

package() {
    cd "${srcdir}/$pkgname-$pkgver"

    patch -p1 <"polkit/polkit.patch"

    # Binaries
    for bin in inpulse-*; do
        install -D -m755 "$bin" "$pkgdir/usr/bin/$bin"
    done

    # Polkit
    install -D -m644 polkit/xyz.somini.inpulse-to-talk.run.policy "$pkgdir/usr/share/polkit-1/actions/xyz.somini.inpulse-to-talk.run.policy"
    install -D -m644 polkit/inpulse-to-talk.rules "$pkgdir/usr/share/polkit-1/rules.d/inpulse-to-talk.rules"
}
