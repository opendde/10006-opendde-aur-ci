# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=hass-circadian_lighting
pkgname=home-assistant-circadian_lighting
pkgver=1.0.13
pkgrel=2
pkgdesc="Custom component for Home Assistant, to adjust lights based on daylight"
arch=(any)
url="https://github.com/claytonjn/hass-circadian_lighting"
license=("Apache-2.0")
depends=("home-assistant")
source=("$pkgname-$pkgver::https://github.com/claytonjn/hass-circadian_lighting/archive/${pkgver}.tar.gz")
sha512sums=('c89885f39d16e05ee6c77769f7c759d069a2a3e72e16f78c56fdd8e370c0c3447f84b220e1e49649c5894c9df86d1a5e6b2b62cd43d5d7892b72630423d3c00f')


package() {
    cd "$_pkgname-$pkgver"

    find "custom_components" -type f -exec install -vDm 644 {} "${pkgdir}/var/lib/private/hass/"{} \;

    install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
