# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kyoutubetomp3
pkgver=2.10.9.1525
pkgrel=2
pkgdesc="Extract audio from YouTube, Vimeo, Facebook and other online video hosting services."
arch=('i686' 'x86_64')
url="http://www.4kdownload.com/products/product-youtubetomp3"
license=('custom:eula')
depends=('qt5-script' 'portaudio' 'ffmpeg-compat' 'ffmpeg-compat-55')
source=("${pkgname}.desktop"
        "${pkgname}.png")
source_i686=("http://downloads.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_i386.tar.bz2")
source_x86_64=("http://downloads.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_amd64.tar.bz2")
sha256sums=('386dfa4085efcd9403c4387c7be4dd0f9762c726555b5ebd0126dcd225bcf828'
            'b25f830bb1fe559ea9f0b35cc9eb8ab75e2e40d09b8755f937451f5ddeeec2fd')
sha256sums_i686=('7d97634ad047f5df6f86762d9df6dde3d70e0dbe795f903a48db0dc4e975365d')
sha256sums_x86_64=('561a7f81a0199143d39cdf313c312be0e0190ad2116d9695b86414eab19fbb7f')

package() {
  # Install desktop file
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
  # Install icon file
  install -m 755 -d "${pkgdir}/usr/share/pixmaps"
  install -m 644 -t "${pkgdir}/usr/share/pixmaps" "${pkgname}.png"
  # Install files
  cd "${pkgname}"
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "${pkgname}-bin"
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/audio"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}/audio" audio/*
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/translation"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}/translation" translation/*
  # Install launcher file
  install -m 755 -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/${pkgname}-bin" "${pkgdir}/usr/bin/${pkgname}"
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "doc/eula"
}
