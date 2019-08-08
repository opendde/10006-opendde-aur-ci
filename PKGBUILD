# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-language-ko
pkgver=2019.2.0f1
pkgrel=1
pkgdesc="Korean Language Pack (Preview)"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
source=("2019.2.0f1.ko::https://new-translate.unity3d.jp/v1/live/54/2019.2/ko")
md5sums=("SKIP")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/Localization"
  install -d "${_dest}"
  mv ${pkgver}.ko "${_dest}/ko.po"
}

