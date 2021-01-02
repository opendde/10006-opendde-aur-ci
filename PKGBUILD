# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: David Birks <david@birks.dev>

pkgname=lens
pkgdesc='The Kubernetes IDE'
pkgver=4.0.6
pkgrel=1
arch=('x86_64')
license=('MIT')
url='https://k8slens.dev'
makedepends=('npm' 'nodejs-lts-erbium' 'yarn')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lensapp/lens/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('a7aede41d57d1cbd0b42eed92d4af787776d8ad1aeb946fa94fdfd8b3c27b6b0'
            '3db5b267cededcc73b3e35b89b46fca419e82832b85fa633e4326156cf648d02')

build() {
  cd "${pkgname}-${pkgver}"
  make -j1 build
}

package() {
  # copy the entire distribution to /usr/share
  mkdir -p "${pkgdir}"/usr/share/${pkgname}
  mv "${srcdir}"/${pkgname}-${pkgver}/dist/linux-unpacked/* \
    "${pkgdir}"/usr/share/${pkgname}

  # icon
  install -Dm 644 "${srcdir}"/${pkgname}-${pkgver}/build/icons/512x512.png \
    "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/kontena-${pkgname}.png

  # desktop file
  install -Dm 644 "${srcdir}"/${pkgname}.desktop \
    "${pkgdir}"/usr/share/applications/${pkgname}.desktop

  # symlink binary
  mkdir -p "${pkgdir}"/usr/bin
  ln -sf /usr/share/${pkgname}/kontena-lens \
    "${pkgdir}"/usr/bin/kontena-lens
}
