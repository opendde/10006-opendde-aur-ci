# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=bettercap-caplets-git
pkgver=v20190327.r302.3b47dd6
pkgrel=1
pkgdesc='Bettercap scripts (caplets) and proxy modules'
url='https://github.com/bettercap/caplets'
arch=('any')
license=('GPL3')
depends=('bettercap')
makedepends=('git')
provides=('bettercap-caplets')
conflicts=('bettercap-caplets')
source=(${pkgname}::"git+https://github.com/bettercap/caplets")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "v%s.r%s.%s" "$(TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${pkgname}
  install -d "${pkgdir}/usr/share/bettercap/caplets"
  cp -r . "${pkgdir}/usr/share/bettercap/caplets"
  rm -r "${pkgdir}/usr/share/bettercap/caplets/"{.git,.gitignore,Makefile,README.md,LICENSE.md}
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
