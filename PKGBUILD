# Maintainer: Jah Way <jahway603 at protonmail dot com>
 
_pkgname=silentdragonlite
pkgname=silentdragonlite-appimage
pkgver=1.3.8
pkgrel=1
pkgdesc='HUSH Lite wallet that supports zaddrs (binary AppImage version)'
url='http://github.com/MyHush/SilentDragonLite'
arch=('x86_64')
license=('GPL3')
depends=('libsodium' 'qt5-websockets' 'qt5-base' 'qt5-tools')
conflicts=('silentdragonlite')
options=(!strip) # needed for AppImage
source=("${_pkgname}-${pkgver}.AppImage::https://github.com/MyHush/SilentDragonLite/releases/download/$pkgver/Linux-binaries-SilentDragonLite-v$pkgver.AppImage")
noextract=("${_pkgname}-${pkgver}.AppImage")
sha256sums=('61012d46bdf62a1b34f5633de0e3988c9f4393bd56ff67937d988bddee85db93')

_filename=${_pkgname}-${pkgver}.AppImage

package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_filename}"
  chmod +x "${pkgdir}/opt/appimages/${_filename}"

  # Symlink in /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/appimages/${_filename}" "${pkgdir}/usr/bin/${_pkgname}"
}

