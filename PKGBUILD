# Maintainer: Jonas DOREL <jonas at dorel dot me>

pkgbase='python-prospector'
pkgname=('python-prospector')
_module='prospector'
pkgver='1.5.1'
pkgrel=1
pkgdesc="Python static analysis tool"
url="http://prospector.readthedocs.io"
depends=('python-pylint-plugin-utils'
         'python-pylint-celery'
         'python-pylint-flask'
         'python-requirements-detector'
         'python-setoptconf'
         'python-dodgy'
         'python-yaml'
         'python-mccabe'
         'python-pyflakes'
         'python-pycodestyle'
         'python-pep8-naming'
         'python-pydocstyle'
         'python-pylint'
         'python-pylint-django'
         'python-astroid')
optdepends=('python-pyroma: check setup.py'
            'python-vulture: find dead code'
            'mypy: optional type checking')
makedepends=('python-setuptools')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('851c2892cd615cfee91fd27cfaf7a5061d14daf2853aa8f012e927b98f919578')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    PIP_CONFIG_FILE=/dev/null
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
