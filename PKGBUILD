# $Id: PKGBUILD 6743 2009-12-21 12:17:19Z ibiru $
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>

pkgname=em8300-utils
pkgver=0.18.0
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="DXR3 and Hollywood+ driver"
url="http://dxr3.sourceforge.net/"
license=('GPL2')
makedepends=('gtk2')
optdepends=('gtk2: to use dxr3view, dhc or autocal'
            'perl: to use em8300 scripts')
source=(http://downloads.sourceforge.net/project/dxr3/em8300/${pkgver}/em8300-${pkgver}.tar.gz
2.6.35.patch)
md5sums=('2ef10f5159508a31a877e7e6d18c6896'
         '922a6f5641a805ca05c2b712caeed9f8')

build() {
  cd "${srcdir}/em8300-${pkgver}"
  patch -p1 < $srcdir/2.6.35.patch
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1

  install -m 644 -D modules/em8300-udev.rules "${pkgdir}/lib/udev/rules.d/em8300.rules" || return 1
}
