# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='ddnss'
pkgname="python-${_pkgbase}"
pkgver=1.0.1
pkgrel=1
pkgdesc='Update DynDNS hosts registered at ddnss.de'
arch=('any')
url="https://github.com/coNQP/${_pkgbase}"
license=('GPLv3')
depends=('python')
makedepends=('git' 'python' 'python-setuptools' 'python-setuptools-git')
source=("${_pkgbase}::git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')


package() {
    cd "${srcdir}/${_pkgbase}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
