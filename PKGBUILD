#Automatically generated by pip2arch on 2014-06-04

pkgname=python-rospkg
pkgver=1.0.38
pkgrel=1
pkgdesc="ROS package library"
url="http://wiki.ros.org/rospkg"
depends=('python')
makedepends=('python3')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/r/rospkg/rospkg-$pkgver.tar.gz")
sha256sums=('774b478fb7b2fe49733d40c120af785af898b838ef1a0082951351e0113b8c32')
conflicts=(python2-rospkg)

provides=(rospkg)

build() {
  cd $srcdir/rospkg-$pkgver
  python3 setup.py build
}

package() {
  cd $srcdir/rospkg-$pkgver
  python3 setup.py install --root="$pkgdir" --optimize=1
}
