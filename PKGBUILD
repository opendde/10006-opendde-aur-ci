# Maintainer: Alex Talker <alextalker at openmailbox dot org>
# Original maintainer: Simonas Racinas <racinas at icloud.com>
pkgname=visual-paradigm-community
pkgver=14.2
pkgrel=20180201
pkgdesc="UML design application"
url='http://www.visual-paradigm.com/download/community.jsp'
arch=('x86_64')
depends=('java-environment-common')
install=visual-paradigm-community.install
license=('custom')

# Possible values: ca1 usa10 usa11 usa13 usa14 uk3 uk5 germany4 germany5 germany6 france3
_server=eu6
_version=14_2
# https://eu6.visual-paradigm.com/visual-paradigm/vpce14.2/20180101/Visual_Paradigm_CE_14_2_20180101_Linux64.sh
source=("https://$_server.visual-paradigm.com/visual-paradigm/vpce$pkgver/$pkgrel/Visual_Paradigm_CE_${_version}_${pkgrel}_Linux64_InstallFree.tar.gz"
  'visual-paradigm-community.install'
  'visual-paradigm.desktop'
  'Visual_Paradigm_Fixed'
  'visual-paradigm.png'
  'LICENSE.txt'
  'x-visual-paradigm.xml')

sha256sums=('d7f0b88426eadd5364f704b62bada28e9ce82bc5aab1f9909de8525fa2cbe4aa'
  'f992fffbc3627b0691a18c90eb5440eab6d32422bec946b5c64ab1d9e1800f12'
  'c2cf0bd2fdc2879b2ae4814e1be5b6cbd7e5aa4c1247f5d4bc8e677eb6a94952'
  'c861d708eb446f94abbebb4028a2f15f7bc6840aa5df1ee81f7301aac0fd00a9'
  '41517b5c2326c0ba2fe3b6647f9594f094ccf03185cf73cb87d6cf19b355ff15'
  'cd30460cb1c29f9f42723197dbe72b2537aaed09cc2d44dcb3e6868fb5dbf12b'
  'a3b898bc9c43cf54baa1c643c619ee172a8103cd15031d574380ca463eb1ec1c')

package() {
  _ver=${pkgver:0:4} # Probably, dirty a bit
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/licenses/visual-paradigm-community-edition/"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  cp -r "${srcdir}/Visual_Paradigm_CE_${_ver}/Application/" "${pkgdir}/usr/share/${pkgname}/"
  cp -r "${srcdir}/Visual_Paradigm_CE_${_ver}/.install4j/" "${pkgdir}/usr/share/${pkgname}/.install4j/"
  cp "visual-paradigm.desktop" "${pkgdir}/usr/share/applications/visual-paradigm.desktop"
  cp "Visual_Paradigm_Fixed" "${pkgdir}/usr/share/${pkgname}/bin/Visual_Paradigm_Fixed"
  cp "visual-paradigm.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/visual-paradigm.png"
  install -m 644 LICENSE.txt "${pkgdir}/usr/share/licenses/visual-paradigm-community-edition/LICENSE"
  mkdir -p "${pkgdir}/usr/bin"
  ln -sr "${pkgdir}/usr/share/${pkgname}/bin/Visual_Paradigm_Fixed" "${pkgdir}/usr/bin/${pkgname}"
  mkdir -p ${pkgdir}/usr/share/mime/packages
  cp "x-visual-paradigm.xml" "${pkgdir}/usr/share/mime/packages/x-visual-paradigm.xml"
}
