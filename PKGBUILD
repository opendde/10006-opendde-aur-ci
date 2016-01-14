# Maintainer: <trash@ps3zone.org>
# Contributer: Rikles <style.boubou@gmail.com>
# Contributer: N30N <archlinux@alunamation.com>

pkgname="lightzone"
pkgver=4.1.5
pkgrel=1
pkgdesc="A professional photo browser and editor, like Aperture or Lightroom"
url="http://lightzoneproject.org/"
license=("custom")
arch=("i686" "x86_64")
depends=("javahelp2")

if [[ $CARCH == 'i686' ]]; then
  source=("${pkgname}-${pkgver}.deb::http://download.opensuse.org/repositories/home:/ktgw0316:/LightZone/Debian_7.0/i386/${pkgname}_${pkgver}-0obs1_i386.deb")
  md5sums=('6d1a92322f0b2d68ca1927a4ded54c31')
  depends+=("libstdc++5" "libx11" "libxtst")
elif [[ $CARCH == 'x86_64' ]]; then
  source=("${pkgname}-${pkgver}.deb::http://download.opensuse.org/repositories/home:/ktgw0316:/LightZone/Debian_7.0/amd64/${pkgname}_${pkgver}-0obs1_amd64.deb")
  md5sums=('d383b7021a254c93b9fdad487eb60492')
  depends+=("lib32-libstdc++5" "lib32-libx11" "lib32-libxcb" "lib32-libxtst")
fi

build() {
  cd "${srcdir}"
  tar -xf data.tar.gz
}

package() {
  cd "${srcdir}"

# Install
  cp -dr --no-preserve=ownership ./usr "${pkgdir}"/
}
