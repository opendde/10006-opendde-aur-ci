# Maintainer: Aleksej Komarov <stylemistake@gmail.com>
# Upstream: Bitwig GmbH <support@bitwig.com>

pkgname='bitwig-studio'
pkgver='4.1.6'
_pkgver='4.1.6'
pkgrel='1'
pkgdesc='Digital audio workstation for music production, remixing and live performance'
arch=('x86_64')
url='https://www.bitwig.com/'
license=('custom')
depends=('xdg-utils' 'xcb-util-wm' 'libbsd')
optdepends=('jack' 'alsa-lib' 'oss' 'ffmpeg: MP3 support')
provides=('bitwig-studio')
replaces=()
conflicts=('bitwig-studio-legacy' 'bitwig-8-track')
options=(!strip)
source=("https://downloads.bitwig.com/stable/${_pkgver}/bitwig-studio-${_pkgver}.deb")
sha256sums=('43861874c51dfd3f2d18671a921a0b747bd6b07c0eabb2e021befbb2bd8e5ae4')

package() {
  # Unpack package contents
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/

  # Install license
  install -D -m644 ${pkgdir}/opt/bitwig-studio/EULA.rtf ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
