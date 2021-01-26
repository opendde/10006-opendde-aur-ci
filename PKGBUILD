# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=neovim-coc-marketplace-git
_pkgname=neovim-coc-marketplace
_extname=coc-marketplace
pkgver=v1.4.0.r109.ga1ec912
pkgrel=1
pkgdesc='coc.nvim extensions marketplace'
arch=('any')
url='https://github.com/fannheyward/coc-marketplace'
depends=('neovim-coc')
makedepends=('git' 'yarn' 'npm')
_packdir="usr/share/nvim/runtime/pack/coc/start/${_extname}"
license=('MIT')
groups=('neovim-coc-extras-git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${pkgname}.install"
source=("${_extname}::git+${url}.git"
        "${pkgname}.install")
sha256sums=('SKIP'
            '28cc66de4745e00291dc58a32588eb4df5cb52f2a780353f975e58efbc1d73a4')

pkgver() {
    cd "${srcdir}/${_extname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_extname}"
    yarn install --frozen-lockfile --preferred-cache-folder "${srcdir}/.cache"
}

package() {
    cd "${srcdir}/${_extname}"
    yarn pack; tar xvf *.tgz; rm *.tgz
    cd package
    _dependencies=$(grep -Po '"dependencies":' package.json) || _dependencies=""
    if [ -n "${_dependencies}" ]; then
        yarn install --production --no-lockfile --ignore-scripts --prefer-offline --preferred-cache-folder "${srcdir}/.cache"
    fi
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
    rm -rf "${srcdir}/${_extname}/package"
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
    chown -R root:root "${pkgdir}"
}
