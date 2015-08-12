# Maintainer: Peter Mattern <pmattern at arcor dot de>

# Note
# Unlike package qvim this one is using Vim code as imported by / into vim-Qt
# upstream and does not rely on package vim-runtime.
# This seemed reasonable to me with regards to performing tests as one main
# purpose of VCS packages.

_pkgname=vim-qt
pkgname=$_pkgname-git
pkgver=20130201.45.ge1eb3b8
pkgrel=1
pkgdesc="An experimental Qt GUI for Vim"
arch=("i686" "x86_64")
url="https://bitbucket.org/equalsraf/vim-qt"
license=("unknown" "custom:vim")
depends=("gpm" "gawk" "qt4" "hicolor-icon-theme" "gtk-update-icon-cache")
optdepends=("lua: Lua interpreter" "python: Python 3 interpreter" "python2: Python 2 interpreter"
            "ruby: Ruby interpreter")
makedepends=("git" "lua" "python" "python2" "ruby")
provides=("$_pkgname" "qvim"
          "vim-runtime" "vim" "vim-minimal" "vim-python3"
          "xxd")
conflicts=("$_pkgname" "qvim"
           "vim-runtime" "vim" "vim-minimal" "vim-python3" "gvim" "gvim-python3")
install=vim-qt-git.install
source=("git+https://github.com/equalsraf/vim-qt.git"
        "vim-qt.desktop")
sha256sums=("SKIP"
            "ad2fe7c3d8436d2f62e251b9081512e37726c024ed4aac9534764749904f68d6")

pkgver() {
    cd $_pkgname
    git describe --always | sed "s/^package.//;s/-/./g"
}

prepare() {
    cd $_pkgname
    # set global configuration file to /etc/vimrc
    sed -i 's|^.*\(#define SYS_VIMRC_FILE.*"\) .*$|\1|' src/feature.h
}

build() {

    cd $_pkgname

    ./configure \
      --enable-fail-if-missing \
      --with-compiledby='Arch Linux AUR' \
      --prefix=/usr \
      --enable-gui=qt \
      --with-features=huge \
      --enable-cscope \
      --enable-multibyte \
      --enable-perlinterp=yes \
      --enable-pythoninterp=dynamic \
      --enable-python3interp=dynamic \
      --enable-rubyinterp=dynamic \
      --enable-luainterp=dynamic

    make

}

package() {

    # actual installation
    cd $_pkgname
    make DESTDIR=$pkgdir install

    # desktop entry file and corresponding icon
    install -D -m644 ../vim-qt.desktop        $pkgdir/usr/share/applications/vim-qt.desktop
    install -D -m644 src/qt/icons/vim-qt.png  $pkgdir/usr/share/icons/hicolor/64x64/apps/vim-qt.png

    # add link 'qvim'
    cd $pkgdir/usr/bin ; ln -s vim qvim

    # remove ex / view and corresponding main pages (normally provided by package 'vi' on Arch Linux)
    cd $pkgdir/usr/bin ; rm ex view
    find $pkgdir/usr/share/man -type d -name 'man1' 2>/dev/null | \
        while read _mandir; do
            cd ${_mandir}
            rm -f ex.1 view.1
        done

    # add Vim license
    install -D -m644 $srcdir/$_pkgname/runtime/doc/uganda.txt \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE.vim
}
