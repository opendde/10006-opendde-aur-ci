# Maintainer: Benoît Allard <benoit dot allard at gmx dot de>
# Contributor: promach
_gitname=SymbiYosys
pkgname="${_gitname,,}-git"
pkgver=r127.e90bcb5
pkgrel=1
pkgdesc="A front-end driver program for Yosys-based formal hardware verification flows"
arch=('any')
url="https://github.com/YosysHQ/${_gitname}.git"
license=('custom:ISC')
depends=('python3' 'yosys')
source=("git+https://github.com/YosysHQ/${_gitname}.git" \
        'LICENSE')
sha512sums=('SKIP'
            'a3202289ff7828c55d3ec3e22d23ed78a34fcae165a7c666d71d3cedd9abe06f638a09750d8c2d43dfca5781f1b32a616f439c3713a12265c02473f88c0f426d')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   cd "${_gitname}"
   make PREFIX=/usr DESTDIR="$pkgdir" install

  install -D -m 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
