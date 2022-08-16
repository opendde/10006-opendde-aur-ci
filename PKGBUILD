# Maintainer: Yiyao Yu <yuydevel at protonmail com>

_pkgname=dptfxtract
pkgname="${_pkgname}-bin"
pkgver=1.4.4
pkgrel=1
pkgdesc="Intel's Linux DPTF Extract Utility for generating thermald's thermal_conf.xml"
arch=('x86_64')
url="https://github.com/intel/dptfxtract"
license=('custom:Binary License')
provides=('dptfxtract')
conflicts=('dptfxtract')
depends=('thermald')
_commit="015f8e845fd9f201d7b9ccb72024da0623cb0514"  # v1.4.4
source=("https://github.com/intel/dptfxtract/raw/$_commit/dptfxtract"
        "https://github.com/intel/dptfxtract/raw/$_commit/COPYING")
sha256sums=("c32e05631a85569e7ac48489dba4b2a3fa7528d8c9dd4e2431f96d7a99a803ce"
            "f4005b643f5bb944ecd864992e8b4699dd97cb8086301a198be1bcb0728415f0")

package() {
  install -Dm 755 'dptfxtract' "${pkgdir}/usr/bin/dptfxtract"
  install -Dm 644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

