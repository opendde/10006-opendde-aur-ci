# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgname=msgfplus
pkgver=2019.02.01
pkgrel=1
pkgdesc="MS/MS database search tool"
arch=('any')
url="https://github.com/MSGFPlus/msgfplus"
license=('custom')
depends=('java-environment')
source=("https://github.com/MSGFPlus/msgfplus/releases/download/v${pkgver}/MSGFPlus_v${pkgver//.}.zip"
		"msgf+"
		"mzid2tsv"
        "https://raw.githubusercontent.com/sangtaekim/msgfplus/master/LICENSE.txt")
md5sums=('c19f2a10fc4dc65e5b7f10dfe7526cab'
         'c43c6581b373266171c3930c3718eb9c'
         'c860b9c30b74dae43de2d3933a405ac1'
         'SKIP')

package() {
    cd "$srcdir"
    install -D MSGFPlus.jar "${pkgdir}/usr/share/java/${pkgname}/MSGFPlus.jar"
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    cp -r docs/examples "${pkgdir}/usr/share/${pkgname}/"
    install -D msgf+ "${pkgdir}/usr/bin/msgf+"
    install -D mzid2tsv "${pkgdir}/usr/bin/mzid2tsv"
    install -D LICENSE.txt -t "${pkgdir}/usr/share/licenses/msgfplus/"
}
