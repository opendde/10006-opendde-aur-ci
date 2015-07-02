# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=("python2-cliff-liberty")
pkgver="1.12.0"
pkgrel="1"
pkgdesc="Command Line Interface Formulation Framework"
arch=("any")
url="https://github.com/openstack/cliff"
license=("Apache")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/c/cliff/cliff-${pkgver}.tar.gz")
sha256sums=('7609abc1789522fc4e228ea5567a9fd1db3963850396178adca3332cdd9c929a')

package() {
    depends=("python2-cmd2>=0.6.7"
             "python2-prettytable>=0.7"
             "python2-pyparsing>=2.0.1"
             "python2-six>=1.9.0"
             "python2-stevedore-openstack")
    cd "${srcdir}/cliff-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
