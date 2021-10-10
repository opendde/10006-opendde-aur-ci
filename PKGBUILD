# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>

pkgname="surface-control"
pkgver=0.4.1
pkgrel=2
_pkgrel=1
pkgdesc='Control various aspects of Microsoft Surface devices from the Command-Line'
url='https://github.com/linux-surface/surface-control'
license=('MIT')
arch=('x86_64')
depends=('gcc-libs' 'systemd-libs')
makedepends=('rust' 'cargo' 'systemd')


source=(
    "${pkgname}-${pkgver}-${_pkgrel}.tar.gz::https://github.com/linux-surface/surface-control/archive/refs/tags/v${pkgver}-${_pkgrel}.tar.gz"
)

sha256sums=('42d9c0e14b68fea4f0b23ecc19a0c7bc04395c2902f49d1ae92223c56b4a45cb')

build(){
    cd "${srcdir}/${pkgname}-${pkgver}-${_pkgrel}"
    env CARGO_TARGET_DIR="target" CARGO_INCREMENTAL=0 cargo build --release --locked
    strip --strip-all "target/release/surface"
}

package() {
    install -D -m755 "${srcdir}/${pkgname}-${pkgver}-${_pkgrel}/target/release/surface" "$pkgdir/usr/bin/surface"

    # copy system files
    install -D -m644 "${srcdir}/${pkgname}-${pkgver}-${_pkgrel}/etc/sysusers/surface-control.conf" "${pkgdir}/usr/lib/sysusers.d/surface-control.conf"
    install -D -m644 "${srcdir}/${pkgname}-${pkgver}-${_pkgrel}/etc/udev/40-surface-control.rules" "${pkgdir}/usr/lib/udev/rules.d/40-surface-control.rules"

    # completion files
    install -D -m644 "${srcdir}/${pkgname}-${pkgver}-${_pkgrel}/target/surface.bash" "$pkgdir/usr/share/bash-completion/completions/surface"
    install -D -m644 "${srcdir}/${pkgname}-${pkgver}-${_pkgrel}/target/_surface" "$pkgdir/usr/share/zsh/site-functions/_surface"
    install -D -m644 "${srcdir}/${pkgname}-${pkgver}-${_pkgrel}/target/surface.fish" "$pkgdir/usr/share/fish/completions/surface.fish"

    # license
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-${_pkgrel}/LICENSE" "${pkgdir}/usr/share/licenses/surface-control/LICENSE"
}
