# Maintainer: Alex Talker ( alextalker at openmailbox dot org )
# Contributor: py_crash <agustin.ferrario@hotmail.com.ar>
# Based on kang's thunderbird-aurora
pkgname=thunderbird-earlybird
_name=thunderbird
_channel=earlybird
_milestone=60.0a1

_release_year=2018
_release_month=02
_release_day=25
_release_time=$_release_year-$_release_month-$_release_day-03-02-01
_buildid=20180225030201


pkgver=60.0a1.$_buildid
pkgrel=1
pkgdesc="Standalone Mail/News reader - Earlybird channel"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="http://www.mozilla.org/${_name}/channel"
depends=('alsa-lib' 'cairo' 'dbus-glib' 'desktop-file-utils' 'fontconfig' 
          'freetype2' 'gtk3' 'hicolor-icon-theme' 'hunspell' 'libevent'
          'libjpeg' 'libmng' 'libpng' 'libvpx' 'libxt' 'mozilla-common'
          'nspr' 'nss' 'shared-mime-info' 'sqlite3' 'startup-notification')
optdepends=('libcanberra: for sound support')
replaces=("${_name}-aurora")
install="${pkgname}.install"

source=("${pkgname}.desktop")

_base_url="http://ftp.mozilla.org/pub/thunderbird/nightly/$_release_year/$_release_month/$_release_time-comm-central"
source_i686=("$_base_url/thunderbird-60.0a1.en-US.linux-i686.tar.bz2")
source_x86_64=("$_base_url/thunderbird-60.0a1.en-US.linux-x86_64.tar.bz2")

sha512sums=('a36bb5710b9cd6637cf6f538808e2fba8c99fdd1d486446ff9ee8094ca30b5592c17b3e808cae1da7ff2b28123f54902ed4ee1501585a8dcfc54d581588638d3')
sha512sums_i686=('db0997065094a5c4d04163a0992db31e90c7d5b122f6dbac5f735a4fa27e37d9c2fce6ff8755c1f86fcf817fd53ed1d244b47d146e77f3dfca2676312797335a')
sha512sums_x86_64=('e6d99b731b1d7ff16f336412e3c6ad82653a0eb2352ba7063792abd78d2354982ee4147f63881c81a79021727c2d46e34d8afbe17a04a0473329836975ac635c')

pkgver() {
    cd "${_name}"
    echo "${_milestone}.$(cat platform.ini|grep BuildID|cut -d "=" -f2 )"
}

package() {
  install -d "${pkgdir}"/{usr/bin,opt}

  cp -a ${_name} "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/${_name} "${pkgdir}/usr/bin/${pkgname}"

  for i in 16x16 22x22 24x24 32x32 48x48 256x256; do
    install -Dm644 ${_name}/chrome/icons/default/default${i/x*/}.png "${pkgdir}/usr/share/icons/hicolor/${i}/apps/${pkgname}.png"
  done

  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  rm -rf "${pkgdir}/opt/${pkgname}/dictionaries"
  ln -sf /usr/share/hunspell "${pkgdir}/opt/${pkgname}/dictionaries"
}
