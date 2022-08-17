# Maintainer: Jevgeni Khaganov-Iveson <zkogdxdkur at p dot monash dot edu>
pkgname='elice-digital-coding-variable'
fontname='EliceDigitalCoding'
pkgver=1.2
pkgrel=1
pkgdesc="A digital monospaced font with JP/KR support, made by elice."
arch=('any')
provides=(
    'elice-digital-coding-variable'
    'otf-elice-digital-coding'
    'ttf-elice-digital-coding'
)
conflicts=(
    'otf-elice-digital-coding'
    'ttf-elice-digital-coding'
)
url='https://elice.io'
license=('custom:SIL Open Font License v1.1')
source=(
    "$url/font/${fontname}_OTF.zip"
    "$url/font/${fontname}_TTF.zip"
)
sha256sums=(
    '7f524a63d4d1503ead833ec8986eef81547e251d82628bd1ebaf2f7a4a9fe025'
    'ac7c59b147a8ea9015a38d899c8be9b150439328c321e5b703a1e962c2341d64'
)

package_elice-digital-coding() {
    pkgdesc+=" (OTF)"
	install -dm 755 "$pkgdir/usr/share/fonts/OTF"
	install -m 644 ${fontname}OTF_Regular.otf "${pkgdir}/usr/share/fonts/OTF/${fontname}-Regular.otf"
	install -m 644 ${fontname}OTF_Bold.otf "${pkgdir}/usr/share/fonts/OTF/${fontname}-Bold.otf"

    pkgdesc+=" (TTF)"
    install -dm 755 "$pkgdir/usr/share/fonts/TTF"
	install -m 644 ${fontname}_Regular.ttf "${pkgdir}/usr/share/fonts/TTF/${fontname}-Regular.ttf"
	install -m 644 ${fontname}_Bold.ttf "${pkgdir}/usr/share/fonts/TTF/${fontname}-Bold.ttf"
}