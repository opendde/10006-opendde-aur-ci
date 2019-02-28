
# Maintainer: Developpix <developpix@gmail.com>
pkgname=jmonkeyplatform
pkgver=3.2.2
pkgrel=2
pkgdesc="A complete 3D game development suite written purely in Java."
arch=('any')
url="http://jmonkeyengine.org"
license=('BSD')
provides=('jmonkeyplatform')
conflicts=('jmonkeyplatform')
source=(
  "https://github.com/jMonkeyEngine/sdk/releases/download/v${pkgver}-stable-sdk1/jmonkeyplatform.zip"
  "${pkgname}.desktop"
  "${pkgname}.png"
)
sha512sums=(
  '0d783874e6c12406edd6a09f41edf75fa25113c7738ad3244a8bdc0db17368ed9d25b7debea9d3bcd60e186a37b1490ba528a1ea26325b3bc20c269b57d01c25'
  '1eca00283501e72ba2b15c79321ad1ed3f153339f3c165090f37712be687e9b3f47be3738ed6522c7302b245405671eb3d12b1ef0de1373d97c7b3f1b472b464'
  'ff02936a70abab71026ba3cb6411a617dc5cb806ac4c1079d9e3118b48847da292c346ec49ca93393a030332a8062b626f5b2332f0f87384d3c34d2e66911fb8'
)
noextract=()

build() {
  rm "${srcdir}/${pkgname}/bin/${pkgname}.exe"
  rm "${srcdir}/${pkgname}/bin/${pkgname}64.exe"

  rm -rf "${srcdir}/${pkgname}/ide/bin/nativeexecution/MacOSX-x86"
  rm -rf "${srcdir}/${pkgname}/ide/bin/nativeexecution/MacOSX-x86_64"
  rm -rf "${srcdir}/${pkgname}/ide/bin/nativeexecution/SunOS-sparc"
  rm -rf "${srcdir}/${pkgname}/ide/bin/nativeexecution/SunOS-sparc_64"
  rm -rf "${srcdir}/${pkgname}/ide/bin/nativeexecution/SunOS-x86"
  rm -rf "${srcdir}/${pkgname}/ide/bin/nativeexecution/SunOS-x86_64"
  rm -rf "${srcdir}/${pkgname}/ide/bin/nativeexecution/Windows-x86"
  rm -rf "${srcdir}/${pkgname}/ide/bin/nativeexecution/Windows-x86_64"
  rm -rf "${srcdir}/${pkgname}/ide/bin/nativeexecution/Linux-sparc_64"
}

package() {
  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${srcdir}/${pkgname}.png"
  install -dm755 "${srcdir}/${pkgname}" "${pkgdir}/opt/${pkgname}"
  cp -R "${srcdir}/${pkgname}" "${pkgdir}/opt/"
}
