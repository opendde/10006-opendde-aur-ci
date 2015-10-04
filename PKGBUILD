# Maintainer : David Roheim <david.roheim@gmail.com>

pkgname=zendstudio
pkgver=13.0.0
pkgrel=1
pkgdesc="ZendStudio is the leading PHP IDE for development"
arch=('i686' 'x86_64')
url="http://www.zend.com/en/products/studio/"
depends=('java-environment' 'gtk2' 'unzip' 'libwebkit' 'libxtst' 'svnkit' 'mariadb-clients')
install=${pkgname}.install
license=("Custom")
options=(!strip)
makedepends=('zip')
source=("http://downloads.zend.com/studio-eclipse/${pkgver}/ZendStudio-${pkgver}-linux.gtk.x86_64.tar.gz"
        "${pkgname}.sh"
        "${pkgname}.desktop"
        "${pkgname}.png")

sha256sums=('5719b88b4a42025674277b18916ed003893c9c21bc0d8241e4380da6264c6462'
            '99b9dd1daf408b634ec46fb9dafb5553b98a0a6e590ea0d1c3c86a54383c4e3e'
            'f4089b8074161e3dce8e135e6cce33db59cbf06c67bf9dfc1b1e6f6308a23b0a'
            '71ff3b80efe5c65e3733f002af64e7ed29c08118cf20e5d0b6e581e6ed7e4ffe')

[ "$CARCH" = "i686" ] && source[0]="http://downloads.zend.com/studio-eclipse/${pkgver}/ZendStudio-${pkgver}-linux.gtk.x86.tar.gz"
[ "$CARCH" = "i686" ] && sha256sums[0]='ea3f5208f08afa2ef067bd5e5eb4812173be01dfbaba1877b16b80ca88bd5345'

build() {
 true
}

package() {
  install -m755 -d ${pkgdir}/usr/share
  mv ZendStudio ${pkgdir}/usr/share/${pkgname}

  install -m755 -d ${pkgdir}/usr/bin
  install -m755 ${pkgname}.sh $pkgdir/usr/bin/${pkgname}

  install -m755 -d ${pkgdir}/usr/share/applications
  install -m644 ${pkgname}.desktop $pkgdir/usr/share/applications/

  install -m755 -d ${pkgdir}/usr/share/icons/hicolor/64x64/apps
  cp ${pkgname}.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png
  chmod 644 ${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png
  
  sed -i "s|#!/usr/bin/python|#!/usr/bin/python2|" ${pkgdir}/usr/share/${pkgname}/plugins/org.apache.ant_1.9.4.v201504302020/bin/runant.py
}

