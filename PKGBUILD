# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>

pkgname=('python-django-polymorphic' 'python2-django-polymorphic')
pkgdesc="Polymorphic Models for Django"
pkgver=3.1.0
pkgrel=1
url="https://github.com/django-polymorphic/django-polymorphic"
license=('BSD')
arch=('any')
makedepends=('python' 
  'python-setuptools' 
  'python2' 
  'python2-setuptools')
source=("https://files.pythonhosted.org/packages/4e/06/f43d3d7e690a6bd90c0e300d824f5aad0e9840cfd8d5bb164fd06ef6bcfc/django-polymorphic-${pkgver}.tar.gz")
sha256sums=('d6955b5308bf6e41dcb22ba7c96f00b51dfa497a8a5ab1e9c06c7951bf417bf8')

build() {
  cp -r ${srcdir}/django-polymorphic-${pkgver} ${srcdir}/django-polymorphic-${pkgver}-py2

  cd ${srcdir}/django-polymorphic-${pkgver}
  python setup.py build

  cd ${srcdir}/django-polymorphic-${pkgver}-py2
  python2 setup.py build
}

package_python-django-polymorphic() {
  depends=('python-django')
  cd ${srcdir}/django-polymorphic-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_python2-django-polymorphic() {
  depends=('python2-django')
  cd ${srcdir}/django-polymorphic-${pkgver}-py2
  python2 setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:

