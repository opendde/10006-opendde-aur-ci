# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Randy Ramos <rramos1295 \at\ gmail \dot\ com>
# Contributor: Peter Vasil <mail@petervasil.net>
# Contributor: Lucas De Marchi <lucas.de.marchi@gmail.com>
# Contributor: Matthias Meulien <orontee@gmail.com>

pkgname=global
pkgver=6.6.4
pkgrel=1
pkgdesc="A source code tag system"
arch=("i686" "x86_64")
url="https://www.gnu.org/software/${pkgname}/"
license=("GPL")
depends=("bash" "libltdl" "perl" "sqlite")
optdepends=("ctags" "emacs" "idutils" "python-pygments" "vim")
makedepends=("python")
options=(!emptydirs !libtool)
source=("https://ftp.gnu.org/pub/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("987e8cb956c53f8ebe4453b778a8fde2037b982613aba7f3e8e74bcd05312594")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/\.la/.so/g' gtags.conf.in

  # Package idutils from AUR installs lid as lid-idutils
  # See: https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=idutils
  # Change idutils lid executable name to lid-idutils
  sed -i 's/usable("lid")/usable("lid-idutils")/g' ${pkgname}/${pkgname}.c
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -fi
  ./configure \
    --prefix=/usr \
    --with-exuberant-ctags=/usr/bin/ctags \
    --with-sqlite3
  make -j4
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -k check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}/usr/share/emacs/site-lisp"
  mv "${pkgdir}/usr/share/gtags/gtags.el" "${pkgdir}/usr/share/emacs/site-lisp/gtags.el"
  install -d "${pkgdir}/usr/share/vim/vimfiles/plugin"
  mv "${pkgdir}/usr/share/gtags/gtags.vim" "${pkgdir}/usr/share/vim/vimfiles/plugin/gtags.vim"
  mv "${pkgdir}/usr/share/gtags/gtags-cscope.vim" "${pkgdir}/usr/share/vim/vimfiles/plugin/gtags-cscope.vim"
}
