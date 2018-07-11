# Maintainer:  Chris Severance aur.severach AatT spamgourmet.com
# Contributor: nl6720 <nl6720@gmail.com>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Hokum <hokum_at_mail_dot_ru>

pkgname='gptfdisk-git'
pkgver=1.0.4.r177.4cd84de
pkgrel=1
pkgdesc='A text-mode partitioning tool that works on GUID Partition Table (GPT) disks - GIT Version'
arch=('x86_64')
url='https://www.rodsbooks.com/gdisk/'
license=('GPL2')
makedepends=('git')
depends=('gcc-libs' 'popt' 'libuuid.so' 'libncursesw.so')
conflicts=("${pkgname%-git}" 'gdisk')
provides=("${pkgname%-git}=${pkgver}" "gdisk=${pkgver}")
source=("${pkgname%-git}::git+https://git.code.sf.net/p/gptfdisk/code#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf '%s.r%s.%s' "$(grep -Po 'GPTFDISK_VERSION "\K[\d.]+' "${srcdir}/${pkgname%-git}/support.h")" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  git clean -x -d -f
  git reset --hard
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  make
}

check() {
  cd "${srcdir}/${pkgname%-git}"
  make test
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  install -d "${pkgdir}/usr/"{bin,share/{doc/gdisk,man/man8}}
  install -t "${pkgdir}/usr/bin" {,c,s}gdisk fixparts
  install -m644 -t "${pkgdir}/usr/share/man/man8" {{,c,s}gdisk,fixparts}.8
  install -m644 -t "${pkgdir}/usr/share/doc/gdisk" README NEWS
}
