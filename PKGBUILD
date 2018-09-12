# Maintainer: Vladimir Tsanev <tsachev@gmail.com>

pkgname=jhiccup
_pkgname=jHiccup
pkgver=2.0.9
pkgrel=1
arch=('x86_64')
url="http://www.azulsystems.com/jHiccup"
license=('custom:BSD-2-clause')
depends=('java-environment')
source=(https://www.azul.com/files/$_pkgname-$pkgver-dist.tar.gz ${_pkgname}.sh ${_pkgname}LogProcessor.sh)
sha256sums=('c4dc4b62f6615829c5771dd2649c2440210d905b9252f07baf39de05be74053b'
            '027eb7801d40bfe8881226904cf5ea3def5c5495d55055aac9eaebb55c70272d'
            '4f6513f46ebe693429a86d000fc32b43021ff66bc61317fbf9ff720b1a936898')

package() {
  
  install -d ${pkgdir}/usr/{bin,share/${pkgname},share/java/${pkgname},share/licenes/${pkgname}}
  install -D -m 755 ${srcdir}/${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}

  cd ${srcdir}/${_pkgname}-${pkgver}
  install -D -m 755 ${srcdir}/${_pkgname}LogProcessor.sh ${pkgdir}/usr/bin/${_pkgname}LogProcessor
  cp {README.md,*.txt} ${pkgdir}/usr/share/${pkgname}
  install -D -m 755 ${_pkgname} ${pkgdir}/usr/share/${pkgname}/${_pkgname}
  install -D -m 755 ${_pkgname}LogProcessor ${pkgdir}/usr/share/${pkgname}/${_pkgname}LogProcessor
  install -D -m 644 ${_pkgname}.jar ${pkgdir}/usr/share/${pkgname}/${_pkgname}.jar
  install -D -m 644 ${_pkgname}Plotter.xls ${pkgdir}/usr/share/${pkgname}/${_pkgname}Plotter.xls

  
  ln -sf /usr/share/${pkgname}/${_pkgname}.jar ${pkgdir}/usr/share/java/${pkgname}/${_pkgname}.jar
  ln -sf /usr/share/${pkgname}/LICENSE.txt ${pkgdir}/usr/share/licenes/${pkgname}/LICENSE
}

