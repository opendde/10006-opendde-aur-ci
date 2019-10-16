# Maintainer: Federico Giuliani <federico.giuliani86 at gmail dot com>

pkgname=airsonic
pkgver=10.4.1
pkgrel=1
pkgdesc="A free, web-based media streamer and jukebox."
arch=('any')
url="https://github.com/Airsonic/airsonic/"
license=('GPL3')
depends=('java-runtime-headless')
backup=('etc/airsonic/airsonic.conf')
noextract=(${pkgname}.war)
source=(${pkgname}-${pkgver}.war::https://github.com/airsonic/airsonic/releases/download/v${pkgver}/${pkgname}.war
        ${pkgname}-systemd-env-${pkgver}::https://raw.githubusercontent.com/airsonic/airsonic/master/contrib/${pkgname}-systemd-env
        ${pkgname}-${pkgver}.service::https://raw.githubusercontent.com/airsonic/airsonic/master/contrib/${pkgname}.service
        ${pkgname}.sysusers
        ${pkgname}.tmpfiles)

package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/var/lib/${pkgname}
  mkdir -p ${pkgdir}/var/lib/${pkgname}/playlists
  mkdir -p ${pkgdir}/usr/lib/systemd/system
  mkdir -p ${pkgdir}/etc/${pkgname}
  cp ${pkgname}-${pkgver}.war ${pkgdir}/var/lib/${pkgname}/${pkgname}.war
  
  sed -i 's/\/var\/airsonic/\/var\/lib\/airsonic/' ${pkgname}-${pkgver}.service
  sed -i 's/\/etc\/sysconfig\/airsonic/\/etc\/airsonic\/airsonic.conf/' ${pkgname}-${pkgver}.service

  sed -i 's/\/var\/airsonic/\/var\/lib\/airsonic/' ${pkgname}-systemd-env-${pkgver}  
  cp ${pkgname}-systemd-env-${pkgver} ${pkgdir}/etc/${pkgname}/${pkgname}.conf
  
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  
}

sha256sums=('1d3ee9811ecbabbf9e2cfb63bd936bc238fe75dbcd223a87f3fab18b7a2a75a3'
            '059a43fe100d95aaaae8091d1c312f4d3a2a2b4edc1969358dd7be35f6525930'
            '21deabc2802a3909c040451c60a3fdf4ee157a3e05b5b9bafa164bc12ce9c0b2'
            '25af0b92b247df928db5ac8fec3fb4fa2cdc717e649729d5e0c059a5b81e058e'
            '952c15c8c6b53b9c63a96eb6b2402eae42bde56dc9c6c60484cf039a03a82963')
