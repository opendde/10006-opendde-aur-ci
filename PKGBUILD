# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python2-rosdistro'
pkgname=('python2-rosdistro')
_module='rosdistro'
pkgver='0.8.2'
pkgrel=1
pkgdesc="A tool to work with rosdistro files"
url="http://wiki.ros.org/rosdistro"
depends=('python2' 'python2-catkin_pkg' 'python2-rospkg' 'python2-yaml')
conflicts=('python-rosdistro')
makedepends=('python2-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('aa51e08e27e59dfd26c7754dc43fb3e99f897fd9281ff64a86723b264fcbd964')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
