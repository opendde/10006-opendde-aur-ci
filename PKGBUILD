# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=terrascan

pkgname=terrascan-bin
pkgver=1.15.2
pkgrel=3
pkgdesc="Detect compliance and security violations across Infrastructure as Code"
arch=('x86_64')
url="https://github.com/accurics/terrascan"
conflicts=('terrascan')
provides=('terrascan')
license=('Apache-2')
source=("https://github.com/accurics/${_pkggit}/releases/download/v${pkgver}/${_pkggit}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('9aebcf198f4ee6442435c1682b9f20215063a52a5191e85d91d75d0873a0c227')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${_pkggit}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md
}
