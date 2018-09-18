# Maintainer: Tomasz Jakub Rup <tomasz.rup@gmail.com>
pkgname=evostream-libavbin
pkgver=2.0.1.5649
pkgrel=1
pkgdesc="libav project compiled by EvoStream"
arch=('x86_64' 'i686')
url="https://evostream.com/"
license=('custom')
makedepends=('poppler')
source=("http://apt.evostream.com/release/debian/9.4/pool/main/e/evostream-libavbin/${pkgname}_${pkgver}-1_amd64.deb"
        "https://evostream.com/public/files/Evostream-Media-Server-EULA-v2.pdf")
md5sums=('69d27f2a7265550598668ac64e995de8'
         'ee93910c6589b26c8eb056921f1944f8')
noextract=("Evostream-Media-Server-EULA-v2.pdf")

build() {
  pdftotext ${srcdir}/Evostream-Media-Server-EULA-v2.pdf
}

package() {
  mv ${srcdir}/data.tar.xz ${pkgdir}
  cd ${pkgdir}
  bsdtar -xf data.tar.xz
  rm data.tar.xz

  install -Dm644 "${srcdir}/Evostream-Media-Server-EULA-v2.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
