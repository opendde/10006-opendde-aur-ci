# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=nodejs-terminalizer
pkgver=0.2.11
pkgrel=1
pkgdesc="Record your terminal and generate animated gif images"
arch=("x86_64")
url="https://github.com/faressoft/terminalizer"
license=("MIT")
depends=("gconf" "gtk3" "libxss" "nodejs" "npm" "nss")
source=("https://registry.npmjs.org/${pkgname#nodejs-}/-/${pkgname#nodejs-}-${pkgver}.tgz")
noextract=("${pkgname#nodejs-}-${pkgver}.tgz")
sha1sums=("f0baaa9c200752d52e1d862f2a2d5d21487cf8ed")

package() {
  cd "${srcdir}"
  
  echo "Installing using npm..."
  npm install --user root -g --prefix "${pkgdir}/usr" "${pkgname#nodejs-}@${pkgver}"
  
  echo "Installing license file in /usr/share/licenses/${pkgname} ..."
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm755 "${pkgdir}/usr/lib/node_modules/terminalizer/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
  
  echo "Changing permissions to remove the world writable bit set"
  chmod go-w -R "${pkgdir}"
}
