# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

_name='fleep'
pkgbase='python-fleep'
pkgname=('python-fleep' 'python2-fleep')
pkgver='1.0.1'
pkgrel='1'
pkgdesc='File format determination library'
arch=('any')
url="https://github.com/floyernick/${pkgname}-py"
makedepends=('python' 'python-setuptools'
	     'python2' 'python2-setuptools')
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/f/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('c8f62b258ee5364d7f6c1ed1f3f278e99020fc3f0a60a24ad1e10846e31d104c')

package_python-fleep() {
  depends=('python')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
}

package_python2-fleep() {
  depends=('python2')

  cd "${srcdir}/${_name}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"
}
