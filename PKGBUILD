# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
# Contributor: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-package-information
_name=${pkgname:7}
pkgver=0.3.3
pkgrel=1
pkgdesc="An extension for colcon-core to provide information about the packages."
arch=(any)
url="https://pypi.org/project/colcon-package-information/"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('db0b1200bfec91fcf396d9d7671eb410f0eb5a18a0819f778f335ebac82e0b9e')


package() {
    cd ${srcdir}/${_name}-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
