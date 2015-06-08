# Maintainer: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Roger Braun <davinelulinvega@gmail.com>
# Based on work by: Lee.MaRS <leemars@gmail.com>
# Contributor: kevku <kevku@gmx.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=acroread-fonts-systemwide
_cloudver=DC
_ver=2015.007.20033
_shortver=${_ver:2}
_nodotver=${_shortver//.}
pkgver=${_cloudver}_${_ver}
pkgrel=1
pkgdesc="Fonts from Adobe Acrobat Reader ${_cloudver}"
arch=('any')
url="http://www.adobe.com/products/acrobat/acrrasianfontpack.html"
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('p7zip')
conflicts=('ttf-adobe-fonts'
           'ttf-adobe-fonts-cjkext'
           'acroread-fonts'
           'acroread-font-chinese-simplified')
install=$pkgname.install
source=("http://ardownload.adobe.com/pub/adobe/reader/win/Acrobat${_cloudver}/${_nodotver}/AcroRdr${_cloudver}${_nodotver}_en_US.exe"
        "http://ardownload.adobe.com/pub/adobe/reader/win/Acrobat${_cloudver}/misc/FontPack${_nodotver}_XtdAlf_Lang_${_cloudver}.msi")
noextract=("AcroRdr${_cloudver}${_nodotver}_en_US.exe")
sha256sums=('95ed14e72dac27d727fc0844706396b9694d44c0ef5e466b088497c7c262baf8'
            '38ca687a30e3b40a9e8ba24275e4619db9914a572b7b6a5d6de1df452e0a7a47')

prepare() {
  cd "$srcdir"

  7z -i!Data1.cab e AcroRdr${_cloudver}${_nodotver}_en_US.exe
  7z -i!*.otf e Data1.cab
  7z -i!license.html19 e Data1.cab
  7z -i\!*.o* e FontPack${_nodotver}_XtdAlf_Lang_${_cloudver}.msi
  mv adobedevanagari_bolditalic.o adobedevanagari_bolditalic.otf
}

package() {
  cd "$srcdir"

  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF"
  install -Dm644 license.html19 "$pkgdir/usr/share/licenses/$pkgname/license.html"
}
