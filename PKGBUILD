# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=casile
pkgver=0.5.0
pkgrel=1
pkgdesc='Caleb’s SILE publishing toolkit'
arch=('any')
url="https://github.com/sile-typesetter/$pkgname"
license=('AGPL3')
depends=('bc'
         'bcprov' # pdftk optdepend is required
         'entr'
         'epubcheck'
         'ghostscript'
         'git'
         'imagemagick'
         'inetutils'
         'inkscape'
         'java-commons-lang' # pdftk optdepend is required
         'jq'
         'kindlegen'
         'lua'
         'm4'
         'make'
         'moreutils'
         'nodejs'
         'otf-libertinus'
         'pandoc-sile-git'
         'perl'
         'pcre'
         'pdftk'
         'podofo'
         'poppler'
         'povray'
         'python'
         'sile'
         'sqlite'
         'tex-gyre-fonts'
         'texlive-core'
         'ttf-hack'
         'yq'
         'zint'
         'zsh')
_lua_deps=('colors'
           'filesystem'
           'yaml')
_perl_deps=('yaml'
            'yaml-merge-simple')
_python_deps=('isbnlib'
              'pandocfilters'
              'pantable'
              'ruamel-yaml'
              'usfm2osis-cw-git')
depends+=("${_lua_deps[@]/#/lua-}"
          "${_perl_deps[@]/#/perl-}"
          "${_python_deps[@]/#/python-}")
makedepends=('autoconf-archive' 'cargo' 'luarocks' 'node-prune' 'rust' 'yarn')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('2ef1de8b093b393a6d5efda466e6ad6be2263dc6e06ea4f7df8fcf12ed728446')

prepare() {
    cd "$pkgname-$pkgver"
    export YARN_CACHE_FOLDER="$srcdir/node_modules"
    sed Makefile.am -i \
        -e 's/yarn \(install\|run\)/yarn --offline \1/' \
        -e 's/cargo \(build\|install\|test\)/cargo --offline \1/'
    autoreconf
    cargo fetch --locked
    yarn install --production --frozen-lockfile
}

build() {
    cd "$pkgname-$pkgver"
    export YARN_CACHE_FOLDER="$srcdir/node_modules"
    ./configure --prefix "/usr"
    make
}

check() {
    cd "$pkgname-$pkgver"
    make check
}

package () {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    node-prune "$pkgdir/usr/share/casile/node_modules"
}
