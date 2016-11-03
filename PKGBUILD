# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Hoàng Đức Hiếu <hdh@lazny.tang.la>
# Contributor: Gilfran Ribeiro <contato [at] gilfran [dot] net>
# Contributor: William Díaz <wdiaz [at] archlinux [dot] us>

pkgname=cpyrit-opencl-git
pkgver=0.5.0.r21.g6111f10
pkgrel=1
pkgdesc="The famous WPA precomputed cracker, OpenCL backend (Git version)"
url="https://github.com/JPaulMora/Pyrit"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('pyrit-git' 'libcl')
makedepends=('opencl-headers' 'git')
provides=('cpyrit-opencl')

source=("git://github.com/JPaulMora/Pyrit")
md5sums=('SKIP')

function pkgver() {
	cd Pyrit

	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd Pyrit/modules/cpyrit_opencl

	python2 setup.py build
}

package() {
	cd Pyrit/modules/cpyrit_opencl

	python2 setup.py install --root="${pkgdir}" --optimize=1
}
