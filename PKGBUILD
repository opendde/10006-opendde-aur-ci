# Maintainer: midnightix <midnightix@protonmail.com>

pkgname=clash-premium-script
_pkgname=clash-premium-installer
pkgver=r15.c2b80f9
pkgrel=1
pkgdesc="Simple clash premium core script for Linux."
arch=('any')
url="https://github.com/Kr328/clash-premium-installer"
license=('unknown')
install=${pkgname}.install
depends=('clash-premium-bin' 'systemd' 'nftables' 'iproute2')
makedepends=('git')
backup=("etc/clash/config.yaml" "etc/default/clash")
source=("git+https://github.com/Kr328/clash-premium-installer.git"
        "arch.patch"
		"config.yaml")
sha256sums=('SKIP'
            '6af9092581610933b96641155769dd92c1f0d6d918b0f8cf0cd9f8a583d18f38'
            'e172230e94128e4b98b7c610a74cda8cf7e7dd33672ad2c23fe5fc8d295bd6ed')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}"/clash-premium-installer/
    git apply ../arch.patch
}

package() {
    cd "${srcdir}"
    install -Dm 644 config.yaml "${pkgdir}"/etc/clash/config.yaml
    cd "${srcdir}"/clash-premium-installer/scripts
    install -Dm 644 clash-default "${pkgdir}"/etc/default/clash
    install -Dm 755 bypass-proxy-pid "${pkgdir}"/usr/share/clash/bypass-proxy-pid
    install -Dm 755 bypass-proxy "${pkgdir}"/usr/share/clash/bypass-proxy
    install -Dm 700 clean-tun.sh "${pkgdir}"/usr/share/clash/clean-tun.sh
    install -Dm 700 setup-tun.sh "${pkgdir}"/usr/share/clash/setup-tun.sh
    install -Dm 700 setup-cgroup.sh "${pkgdir}"/usr/share/clash/setup-cgroup.sh
    install -Dm 644 99-clash.rules "${pkgdir}"/usr/lib/udev/rules.d/99-clash.rules
    install -Dm 644 clash.service "${pkgdir}"/usr/lib/systemd/system/clash.service
}
