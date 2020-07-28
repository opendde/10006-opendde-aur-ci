# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=neovim-coc-lists-git
_pkgname=neovim-coc-lists
_extname=coc-lists
pkgdesc='Common lists for coc.nvim'
arch=('any')
url='https://github.com/neoclide/coc-lists'
depends=('neovim-coc')
makedepends=('git' 'yarn' 'npm')
_packdir="usr/local/share/nvim/site/pack/coc/start/${_extname}"
license=('')
groups=('neovim-coc-extras-git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_extname}::git+${url}.git")
pkgver=1.3.10.r0.gbf352d6
pkgrel=1
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_extname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_extname}"
    yarn install --frozen-lockfile
}

package() {
    cd "${srcdir}/${_extname}"
    find lib/*.js nvimstart package.json -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}
