# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkfilebrowser' 'python2-tkfilebrowser')
_name=tkFileBrowser
pkgver=2.2.4
pkgrel=1
pkgdesc="File browser for Tkinter, alternative to tkinter.filedialog in linux with GTK bookmarks support."
url="https://github.com/j4321/tkFileBrowser"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$_name-$pkgver.tar.gz::https://github.com/j4321/$_name/archive/v$pkgver.tar.gz")
sha512sums=('5d1f14ada3239454cc6a5af15345d4d8929d7af5ff9973a74420060aac878ca3c54da6055202a3c627fedac666b352bc2c3ad072cc33bcbef0d10e809407814a')

build() {
    cd "${srcdir}/$_name-${pkgver}"
    python setup.py build
}

package_python-tkfilebrowser() {
  depends=('python-psutil' 'tk' 'python-babel')
  cd "${srcdir}/$_name-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

package_python2-tkfilebrowser() {
  depends=('python2-psutil' 'tk'  'python2-babel')
  cd "${srcdir}/$_name-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
