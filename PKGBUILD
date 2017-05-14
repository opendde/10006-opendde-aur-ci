# Maintainer: CrocoDuck <crocoduck dot oducks at gmail dot com>

pkgname=dpf-plugins-git
pkgver=r80.4477c3e
pkgrel=1
pkgdesc="Collection of DPF-based plugins by DISTRHO. LV2, LADSPA, dssi and VST."
arch=('i686' 'x86_64')
url="http://distrho.sourceforge.net/"
license=('GPL' 'LGPL' 'MIT' 'custom:ISC')
depends=('liblo' 'projectm')
makedepends=('git' 'wget')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git://github.com/DISTRHO/DPF-Plugins")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname%-*}"
    make BUILD_DSSI=true BUILD_LV2=true BUILD_VST=true BUILD_JACK=true
}

package() {
    cd "${pkgname%-*}"
    # Install the custom license:
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # Install the package files:
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
