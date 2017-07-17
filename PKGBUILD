# Maintainer: HE Chong <chong.he.1989@gmail.com>
pkgname=nvim-thesaurus_query
pkgver=0.6.2
pkgrel=1
pkgdesc="Multi-language Thesaurus Query and Replacement plugin for neovim"
arch=('any')
url="https://github.com/Ron89/thesaurus_query.vim"
license=('Apache License, Version 2.0')
groups=('neovim-plugins')
depends=('neovim' 'python' 'python2>=2.7.0')
makedepends=('')
install='thesaurus-query.install'
conflicts=('')
replaces=('')
provides=('')
validpgpkeys=()

_source_name='thesaurus_query.vim'
_source="https://$_gitdomain/$_gituser/$_gitname.git/"
source=("${_source_name}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('aa539ca8dcc0359cb1a2d8707a673527b4fb01e32d411bfb6f94cf1612f2c22e022a3b52b22b79526d2db05ac6e2699e8325890ee972555f3277f80c13c6f466')
_nvim_runtime='/usr/share/nvim/runtime/'

package() {
    install -d ${pkgdir}${_nvim_runtime}{autoload,autoload/thesaurus_query,autoload/thesaurus_query/backends,plugin,syntax,doc}
    install -D -m644 ${srcdir}/${_source_name}-${pkgver}/autoload/thesaurus_query.vim \
        "${pkgdir}${_nvim_runtime}autoload/"
    install -D -m644 ${srcdir}/${_source_name}-${pkgver}/autoload/thesaurus_query/*.py \
        "${pkgdir}${_nvim_runtime}autoload/thesaurus_query/"
    install -D -m644 ${srcdir}/${_source_name}-${pkgver}/autoload/thesaurus_query/backends/*.py \
        "${pkgdir}${_nvim_runtime}autoload/thesaurus_query/backends/"
    install -D -m644 ${srcdir}/${_source_name}-${pkgver}/plugin/thesaurus_query.vim \
        "${pkgdir}${_nvim_runtime}plugin/"
    install -D -m644 ${srcdir}/${_source_name}-${pkgver}/syntax/* \
        "${pkgdir}${_nvim_runtime}syntax/"
    install -D -m644 ${srcdir}/${_source_name}-${pkgver}/doc/* \
        "${pkgdir}${_nvim_runtime}doc/"
}
