# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>
# Contributors: SaC Development Team <info AT sac-home.org>

pkgname=sac-stdlib-weekly
_version=1.3
_changes=81
_commit=g930d
_sac_version="1.3.3-386-1"
pkgver="${_version}.${_changes}"
pkgrel=1
pkgdesc='The standard library for the Single-Assignment C programming language (weekly build)'
arch=('x86_64')
url='http://www.sac-home.org/'
license=('custom:SAC')
depends=('sac-compiler-weekly>=1.3.3.386' hwloc cuda)
provides=('sac-stdlib')
replaces=('sac-stdlib')
conflicts=('sac-stdlib')
source=("https://gitlab.science.ru.nl/sac-group/sac-packages/-/raw/master/packages/weekly/Linux/${_sac_version}/full/sac-stdlib-${_version}-${_changes}-${_commit}.tar.gz"
        'LICENSE.txt')
sha256sums=('c7bfd8d45ad756bc58bfec4f0c6fa2b2c28d47e3047d30036da18adae3425eb2'
            '70a44340820b0515f1d29e663342f0ed8efb3a29fa5619f18461cbaf7cdf27c3')

package() {
	cd "$srcdir/sac-stdlib-${_version}-${_changes}-${_commit}"

    # install libraries
    cp -r usr "$pkgdir/"

    # install license file
    install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
