# Maintainer: leuko <aur_et_aydos_de>
_pkgname=xpra-html5
pkgname=${_pkgname}-git
pkgver=v6.0.r1.g21cabde
pkgrel=1
pkgdesc="HTML5 client for Xpra"
arch=('x86_64')
url='https://github.com/Xpra-org/xpra-html5'
license=('MPL2')
conflicts=($_pkgname)
provides=($_pkgname)
makedepends=(
	git
	python-setuptools
	uglify-js  # for compressing Javascript
	gzip  # compression for served files (.gz)
	brotli  # compression for served files (.br)
)
source=("git+https://github.com/Xpra-org/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install $pkgdir  # `args[2]` is `root_dir`
}
