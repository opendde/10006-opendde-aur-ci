# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>

pkgname=emacs-po-mode
_pkgname=gettext
pkgver=0.19.5
pkgrel=1
pkgdesc="Emacs po-mode for editing gettext .po files (gettext-tools)"
url="http://www.gnu.org/software/gettext/"
license=("GPL")
arch=('any')
depends=('gettext' 'libcroco' 'expat' 'emacs')
install=${pkgname}.install
source=(http://ftp.gnu.org/pub/gnu/gettext/${_pkgname}-${pkgver}.tar.xz)
md5sums=('546a8458f50e146be12c215f83b9bac2')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/gettext-tools/misc/"

  install -d "${pkgdir}/usr/share/emacs/site-lisp"
  install -m644 po-mode.el po-compat.el \
             -t "${pkgdir}/usr/share/emacs/site-lisp"
}
