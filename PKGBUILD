# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=r3d-sdk
pkgver=8.0.2
pkgrel=1
arch=('x86_64')
pkgdesc="SDK to load and decode R3D files generated by RED cameras"
url="https://www.red.com/developers"
license=('custom')
depends=('gcc-libs' 'util-linux-libs')
makedepends=('poppler')
source=("https://downloads.red.com/software/sdk/R3D/8.0/R3DSDKv${pkgver//./_}.zip")
sha512sums=('06a213d816e4e0f4602664038e2759246ab4dff803edc5cb01229594442020540cbd21db9abf4b24033aa66f5c73f2ea1cf6d85b1928b2f4aa797a4c33da810f')

prepare(){
  pdftotext -layout "R3DSDKv${pkgver//./_}/SDK License Agreement.pdf" 2>&-
  mv "R3DSDKv${pkgver//./_}/SDK License Agreement.txt" "$srcdir"
}

package() {
  install -d "$pkgdir/opt"
  install -d "$pkgdir/usr/share/licenses/$pkgname"

  cp -dr --no-preserve=ownership "R3DSDKv${pkgver//./_}" \
                                 "$pkgdir/opt/R3DSDK"

  cp --no-preserve=ownership "$srcdir/SDK License Agreement.txt" \
     "$pkgdir/usr/share/licenses/$pkgname"
}
