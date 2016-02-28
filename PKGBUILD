# Maintainer: Egor Kovetskiy <e.kovetskiy@office.ngs.ru>
pkgname='vim-git'
provides=('vim')
pkgver=1.1c39102
pkgrel=1
pkgdesc="VIM: Vi IMproved"
arch=('i686' 'x86_64')
url="http://github.com/vim/vim"
license=('GPL')
depends=('gpm' 'ruby' 'lua' 'python2' 'python' 'acl')
optdepends=()
conflicts=('vim')
backup=()
options=()
source=("git://github.com/vim/vim.git")
md5sums=('SKIP')

pkgver() {
    cd "vim"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd "$srcdir/vim"

    sed -i 's|^.*\(#define SYS_.*VIMRC_FILE.*"\) .*$|\1|' src/feature.h
    sed -i 's|^.*\(#define VIMRC_FILE.*"\) .*$|\1|' src/feature.h

    (cd src && autoconf)

    # with-x=yes provides FEAT_XCLIPBOARD which provides FEAT_CLIENTSERVER
    ./configure \
        --prefix=/usr \
        --localstatedir=/var/lib/vim \
        --with-features=huge \
        --with-compiledby='Arch Linux' \
        --enable-gpm \
        --enable-acl \
        --with-x=yes \
        --disable-gui \
        --enable-multibyte \
        --enable-cscope \
        --enable-netbeans \
        --enable-perlinterp \
        --enable-pythoninterp \
        --disable-python3interp \
        --enable-rubyinterp \
        --enable-luainterp

    make
}

package() {
  cd "$srcdir/vim"

  make -j1 VIMRCLOC=/etc DESTDIR="${pkgdir}" install

  rm "${pkgdir}"/usr/bin/{ex,view}

  find "${pkgdir}"/usr/share/man -type d -name 'man1' 2>/dev/null | \
    while read _mandir; do
    cd ${_mandir}
    rm -f ex.1 view.1
    rm -f evim.1
  done

  rm -r "${pkgdir}"/usr/share/vim

  install -Dm644 runtime/doc/uganda.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/license.txt
}
