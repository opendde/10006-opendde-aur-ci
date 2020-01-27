# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=lprint-git
pkgver=190_1.0b2_r0_ge93501a
pkgrel=1
pkgdesc="A Label Printer Application"
arch=('i686' 'x86_64')
url="https://github.com/michaelrsweet/lprint"
license=('apache')
depends=('avahi' 'cups' 'libpng' 'libusb')
makedepends=('git')
source=(git+"${url}.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  #git describe --long | sed 's:\([^-]*-g\):r\1:;s:-:.:g;s:^v::'
  _totalcommits="$(git rev-list --count HEAD)"
  _curtag="$(git rev-list --tags --max-count=1)"
  _tagver="$(git describe --tags ${_curtag} | sed 's:^v::')"
  _commits="$(git log v${_tagver}..HEAD --oneline | wc -l)"
  _sha="$(git rev-parse --short HEAD)"
  printf "%s_%s_r%s_g%s" ${_totalcommits} ${_tagver} ${_commits} ${_sha} | sed 's:-:_:g'
}

build() {
  cd ${pkgname%-git}

  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-git}

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
