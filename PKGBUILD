#Automatically generated by pip2arch on 2014-06-04

pkgname=python-rospkg
pkgver=1.0.35
pkgrel=2
pkgdesc="ROS package library"
url="http://wiki.ros.org/rospkg"
depends=('python')
makedepends=('python3')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/r/rospkg/rospkg-$pkgver.tar.gz")
sha256sums=('7e3fc75120dbab15ae45dda2834afc094327fcf6b07056f871031e7c07f3242c')
conflicts=(python2-rospkg)

# This is not ideal, but should not break Groovy/Hydro dependencies for now...
provides=(python2-rospkg)

build() {
  cd $srcdir/rospkg-$pkgver
  python3 setup.py build
}

package() {
  cd $srcdir/rospkg-$pkgver
  python3 setup.py install --root="$pkgdir" --optimize=1
}
