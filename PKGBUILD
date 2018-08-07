## UPSTREAM:
# Author: Guillaume Chazarain <guichaz<at>gmail<dot>com>
# Maintainer: Enre Hasegeli <emre<at>hasegeli<dot>com>
# Maintainer: Patrick Meyer <git<at>the-space<dot>agency>

## PACKAGE:
# Maintainer: Mike Sampson <mike at sambodata dot com>
# Maintainer: Mikhail f. Shiryaev <mr<dot>felixoid<at>gmail<dot>com>

_basename=polysh
pkgname=python-${_basename}
pkgver=0.9
pkgrel=2
pkgdesc="a tool to aggregate several remote shells into one."
arch=("any")
url="https://pypi.org/project/${_basename}/"
license=("GPL2")
depends=("python" "openssh")
makedepends=("python-setuptools" "python-docutils")
conflicts=("${_basename}")
replaces=("${_basename}")
options=(!emptydirs)
source=("https://github.com/innogames/${_basename}/archive/${_basename}-${pkgver}.tar.gz")
sha256sums=("3f45061ad42fd9402fe6629e72e9f3d9f94b9f0b1401e76c3c1f69dcc713d2da")

package() {
  # TODO: fix in upstream
  cd "${srcdir}/${_basename}-${_basename}-${pkgver}"
  # TODO: implement proper documentation in upstream
  mkdir -p "${pkgdir}/usr/share/man/man1"
  rst2man README.rst "${pkgdir}/usr/share/man/man1/${_basename}.1"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
