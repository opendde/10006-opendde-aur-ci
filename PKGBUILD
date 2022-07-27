# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

pkgname=python-b2sdk
_pkgname=b2sdk
pkgver=1.16.0
pkgrel=1
pkgdesc='Python library to access B2 cloud storage.'
arch=(any)
url='https://github.com/Backblaze/b2-sdk-python'
license=('MIT')
depends=('python'
         'python-arrow>=1.0.2'
         'python-logfury>=1.0.1'
         'python-requests>=2.9.1'
         'python-setuptools'
         'python-tqdm>=4.5.0'
        )
makedepends=('python-setuptools-scm'
             'python-pip'
            )

source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('cbffff1163bb8e7cc920c76b29f5e889369d7f5ef1b7b53c89fd5bb79f5ea9c5')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  # This requriement seems overly complex, losen
  sed -i -e 's:\(arrow>=.*\),.*:\1:' requirements.txt

  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

   # https://wiki.archlinux.org/index.php/Python_package_guidelines
   local site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
   rm -rf "${pkgdir}${site_packages}/test"
}
