# Generated by debtap
# Maintainer: Allen Zhong <allen@moe.cat>
# Contributor: Feishu Linux Team <contact@feishu.cn>
pkgname=feishu-bin
pkgver=4.8.0
_pkgrel=24
_pkgtyp=beta
pkgrel=2
pkgdesc="Linux client of Feishu (Lark) from Bytedance."
arch=('x86_64')
url="https://www.feishu.cn/"
license=('unknown')
groups=('')
depends=('ca-certificates' 'libx11' 'libxcb' 'libxtst' 'nss' 'xdg-utils')
replaces=('bytedance-feishu-stable-bin')
conflicts=('feishu')
provides=('bytedance-feishu' 'feishu')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://sf3-cn.feishucdn.com/obj/suite-public-file-cn/b4f6bd/bytedance-feishu-${_pkgtyp}_${pkgver}-${_pkgrel}_amd64.deb")
sha256sums=('0a7acca5f0af6cc23e770aaeb917ac1e9c8f534d14426953b2ae5bf0d61c27ec')

package(){
  # Extract package data
  tar xpvf "${srcdir}/data.tar.xz" --xattrs-include='*' --numeric-owner -C "${pkgdir}"

  # Modify files
  cd "${pkgdir}"
  ln -s bytedance-feishu-${_pkgtyp} usr/bin/feishu
  sed -i "s/bytedance-feishu-${_pkgtyp}/feishu/g" "${pkgdir}/usr/share/applications/bytedance-feishu.desktop"
  sed -i "s/bytedance-feishu/feishu/g" "${pkgdir}/usr/share/menu/bytedance-feishu.menu"
  sed -i 's/bytedance-feishu/feishu/g' "${pkgdir}/usr/share/appdata/bytedance-feishu.appdata.xml"
  mv "${pkgdir}"/usr/share/menu/{bytedance-,}feishu.menu
  mv "${pkgdir}"/usr/share/applications/{bytedance-,}feishu.desktop
  mv "${pkgdir}"/usr/share/appdata/{bytedance-,}feishu.appdata.xml
  mv "${pkgdir}"/usr/share/man/man1/{bytedance-feishu,feishu}.1.gz
  mv "${pkgdir}"/usr/share/doc/{bytedance-feishu-${_pkgtyp},feishu}
}
