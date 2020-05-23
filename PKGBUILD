# Maintainer: Huki <gk7huki@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>

pkgname=rvgl-soundtrack
pkgver=18.0327
pkgrel=3
pkgdesc="RVGL original Dreamcast soundtrack."
url='https://rvgl.re-volt.io'
arch=('any')
license=('custom')
depends=('rvgl-bin')
makedepends=('git')
conflicts=('rvgl-soundtrack-orig')
replaces=('rvgl-soundtrack-orig')
groups=('rvgl-original')
source=("rvgl_soundtrack"::git+https://gitlab.com/re-volt/ost.git#tag=${pkgver})
sha256sums=('SKIP')

package() {
    cd "$srcdir/rvgl_soundtrack"
    find * -type f -exec install -Dm644 {} "$pkgdir/opt/rvgl/{}" \;
}
