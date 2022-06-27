# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=moondust-configpack-smbx13
pkgver=2022may22
pkgrel=1
pkgdesc="Moondust Project's game configuration pack - Super Mario Brothers X 1.3 Compatible"
arch=('any')
url="https://github.com/WohlSoft/Moondust-Project"
license=('custom')
makedepends=('gawk' 'sed' 'curl')
provides=('moondust-configpack')
source=(
"http://wohlsoft.ru/projects/Moondust/_laboratory/config_packs/SMBX_13_compatible.zip"
)
sha512sums=(
"SKIP"
)

pkgver() {
    curl 'http://wohlsoft.ru/projects/Moondust/_laboratory/' | grep "Last update" | tail -1 | awk -F'update: ' '{print $2}' | awk -F' ' '{print $3$2$1}' | sed 's/,//' | sed 's/[A-Z]/\l&/g'
}

package() {
    mkdir -p "${pkgdir}/opt/moondust/configs/"
    mv "${srcdir}/SMBX" "${pkgdir}/opt/moondust/configs/SMBX"
}
