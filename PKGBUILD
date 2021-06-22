# Maintainer: jharch <julian dot hossbach at gmx dot de>

pkgname=plotdigitizer
pkgver=2.6.9
pkgrel=1
pkgdesc="A program used to digitize scanned plots of functional data"
arch=('any')
url="http://plotdigitizer.sourceforge.net/"
license=('LGPL')
depends=('java-runtime')
optdepends=('autotrace: enable the automatic tracing function')
source=('plotdigitizer.sh'
        'plotdigitizer.png'
        'plotdigitizer.desktop'
        "http://sourceforge.net/projects/plotdigitizer/files/plotdigitizer/${pkgver}/PlotDigitizer_${pkgver}_Linux_and_Others.tgz")
md5sums=('cd8a880ce641f7d8c7fc5367166d94a9'
         '06c7419f4f5c9d07fea0b8044e8a2ff4'
         'a89612e09f10210013d9a4fb34c740b7'
         'f1c1970ad85cc1f920f8601d0166c7c7')
sha512sums=('2b9fc71be4b79893a7fed54341c1c4f9ed5af6c7da54d978eab14d911494b625a66ac5ce44f6d3fc33fadb03ec8dcb892230c4f52bc2bfd9079df7b1f406efe7'
            '18f8e20236ea0929fcab67dcb58e7306fabad800296f8693423457c8ebdcdeeddacb69fd049c1473e74a263a3b924fa7a124780d751bafc3d05504f22622a384'
            'b60e18915504ea58a36de680dec2937843cb74a54a7d249bc22747b692238a7ca2f35b72c6b87c6ea0e2730de6e8d309bfa4ec30db8afef45090e73773402abe'
            '1875bacc723f38f762515ef9117a90a0d4dbe7f5f86f48e49a28066f532e0a7c690f232217a94938828c383b6dd2cc892e50a538a34743587d4d3a553c442a46')

package() {
  install -m644 -D "${srcdir}/PlotDigitizer_Linux_and_Others/PlotDigitizer.jar" "${pkgdir}/usr/share/java/${pkgname}/PlotDigitizer.jar"
  install -m755 -D "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}.sh"
  install -m644 -D "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -m644 -D "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
