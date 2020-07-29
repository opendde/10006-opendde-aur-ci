# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-io-clockworks-modern
pkgver=18.0807
pkgrel=1
pkgdesc="Additional modern clockwork cars for RVGL."
url='https://re-volt.io/online/cars'
arch=('any')
license=('custom')
depends=('rvgl-bin')
makedepends=('git')
groups=('rvgl-community')
source=("rvgl_io_clockworks_modern"::git+https://gitlab.com/re-volt/rvio/clockworks_modern.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_io_clockworks_modern"
    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
