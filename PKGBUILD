# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=exifcleaner-bin
pkgver=3.4.0
pkgrel=1
pkgdesc="Cross-platform desktop app to clean image metadata"
arch=('x86_64')
url="https://exifcleaner.com"
license=('MIT')
depends=('nss'
         'gtk3')
provides=('exifcleaner')
source=("${pkgname}-${pkgver}.deb::https://github.com/szTheory/exifcleaner/releases/download/v${pkgver}/exifcleaner_${pkgver}_amd64.deb"
        'LICENSE::https://github.com/szTheory/exifcleaner/raw/master/LICENSE')
sha256sums=('841592a1957581cb9603f2ecd0657f4a6c32529ce71ae8154c4bb3c8da135298'
            'a74847d1e523991859009094dca82f704240d291dea5728a59de9e419cf104ac')

package() {
  tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/bin/"
  ln -s /opt/ExifCleaner/exifcleaner "${pkgdir}/usr/bin/exifcleaner"
  # cd "${pkgdir}/usr/share/icons/hicolor/"
  # mv 0x0 512x512
}
