# Maintainer: taotieren <admin@taotieren.com>

pkgname=csky-ebook
pkgver=0.0.01
pkgrel=1
epoch=
pkgdesc="C-Sky Ebook"
arch=('any')
url="https://occ.t-head.cn/community/download?id=3830606672301461504"
license=('unkown')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=(
        "无需从0开发 1天上手智能语音离在线方案.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1708951/1601175997767/%E8%AF%AD%E9%9F%B3%E7%94%B5%E5%AD%90%E4%B9%A6final+923.pdf"
        "无需从0开发 平头哥教你1天上手蓝牙Mesh应用解决方案.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1708951/1594977408738/%E6%97%A0%E9%9C%80%E4%BB%8E0%E5%BC%80%E5%8F%91+%E5%B9%B3%E5%A4%B4%E5%93%A5%E6%95%99%E4%BD%A01%E5%A4%A9%E4%B8%8A%E6%89%8B%E8%93%9D%E7%89%99Mesh%E5%BA%94%E7%94%A8%E6%96%B9%E6%A1%88.pdf"
        "平头哥剑池CDK快速上手指南.pdf::https://occ-oss-prod.oss-cn-hangzhou.aliyuncs.com/resource/1708951/1608882916122/%E5%B9%B3%E5%A4%B4%E5%93%A5%E5%89%91%E6%B1%A0CDK%E5%BF%AB%E9%80%9F%E4%B8%8A%E6%89%8B%E6%8C%87%E5%8D%97.pdf")
noextract=()
sha256sums=('b2ef9e7a8a3599200970f79396782f6966041ae993b8dad4c4a8a292bd4c0f20'
            '6b20c7c945656cc79a076a2376ddd1b2751c1eb688df76282adaa8facca41e77'
            'a4a2ebebe1288c917012b9b1e71e67a5a2e09a126d16d5ea4041cbbbbe30e9fe')
#validpgpkeys=()

package() {
    export LC_CTYPE="zh_CN.UTF-8"

    install -dm0755 "${pkgdir}/opt/t-head/${pkgname}"
    cp -r "${srcdir}"/*.pdf "${pkgdir}/opt/t-head/${pkgname}"
}
