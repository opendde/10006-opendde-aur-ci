# Maintainer: Edward Pacman <edward@edward-p.xyz>

_projectname=dnsproxy
pkgname=dnsproxy-adguard
pkgver=0.29.0
pkgrel=1
pkgdesc="Simple DNS proxy with DoH, DoT, and DNSCrypt support by AdguardTeam"
arch=('x86_64')
url="https://github.com/AdguardTeam/dnsproxy"
license=('Apache')
source=("dnsproxy-adguard.service"
        "dnsproxy-adguard@.service"
       "https://github.com/AdguardTeam/dnsproxy/archive/v${pkgver}.tar.gz")
makedepends=("go" "git")
sha256sums=('e10bee304ce60088e523b0925c85a7c0640eaf4b2a686d301de565290e70560a'
            '0e4083e1fa627a07e0ca92195c8a5181020ca567b9ffd8cd4f6c9e6a7fe35fa4'
            'c091e04d71abdf1f9abe88b98e0ef66ddee9ff44c38f1b70a7be592d2a563ac3')

build(){
    cd "${srcdir}/${_projectname}-${pkgver}"
    go build
}

package() {
    cd "${srcdir}/${_projectname}-${pkgver}"
    install -Dm755 dnsproxy "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/dnsproxy-adguard.service" "${pkgdir}/usr/lib/systemd/system/dnsproxy-adguard.service"
    install -Dm644 "${srcdir}/dnsproxy-adguard@.service" "${pkgdir}/usr/lib/systemd/system/dnsproxy-adguard@.service"
}
