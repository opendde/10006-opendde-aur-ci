# Maintainer:  Giovanni Ciatto <giovanni.ciatto at gmail dot com>

pkgname=dummy-project-4-testing-gha-release-on-aur
pkgver=0.1.0
pkgrel=2
pkgdesc='A dummy project aimted at testing the automation of AUR releases via GitHub Actions'
arch=('any')
url='https://github.com/gciatto/aur-release-action'
license=('Apache')
depends=('bash')
source=("dummy-project-4-testing-gha-release-on-aur.sh")
sha256sums=('64f68e7b4255664c51f2a627e04dfaeaf082c3250c017066bb6ecf265d030894')

package() {
  install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
}
