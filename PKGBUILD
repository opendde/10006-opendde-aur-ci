# Maintainer: Scott Moak <scott-dot-moak-at-gmail-dot-com>

pkgname=android-support-repository
pkgver=r39
pkgrel=1
pkgdesc='Android Support Repository Package'
arch=('any')
url="https://developer.android.com/sdk/index.html"
license=('custom')
depends=('android-sdk')
options=('!strip')
source=("http://dl-ssl.google.com/android/repository/android_m2repository_${pkgver}.zip")
sha1sums=('89ad37d67a1018c42be36933cec3d7712141d42c')

package() {
  mkdir -p "${pkgdir}/opt/android-sdk/extras/android/"
  cp -dpr --no-preserve=ownership "${srcdir}/m2repository" "${pkgdir}/opt/android-sdk/extras/android/m2repository"

  chmod -R ugo+rX "${pkgdir}/opt"
}