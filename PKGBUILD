# Maintainer: Jingbei Li <i@jingbei.li>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Bodor Dávid Gábor <david.gabor.bodor@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname='python-scipy-mkl'
pkgver=1.5.1
pkgrel=1
pkgdesc="SciPy is open-source software for mathematics, science, and engineering."
arch=('x86_64')
url="http://www.scipy.org/"
license=('BSD')
depends=('intel-compiler-base' 'intel-fortran-compiler' 'intel-mkl' 'python-numpy')
provides=("python-scipy=$pkgver")
conflicts=('python-scipy')
makedepends=('pybind11' 'python-setuptools')
#checkdepends=('python-pytest')
optdepends=('python-pillow: for image saving module')
source=("https://github.com/scipy/scipy/releases/download/v${pkgver}/scipy-${pkgver}.tar.gz" 'build.sh')
sha512sums=('d46abaaa52e5521d8f3f6d79f58c8473a8649faa01e93d250d2ee19d5778e31c13aaa855bd8f059ddc1424ae13001f15a41f240fa6b0acf3ffd911ea30da1040'
            '1ad168482bd4774e47af009f888a549233defe5593b7464f3f5577a25ebec180905c948ebf3936c33ac49f2ea8cba5dcd060f8b86adb99ed2f1fc41fd2bf82bf')

build() {
	export LDFLAGS="-Wall -shared"
	#export __INTEL_PRE_CFLAGS="-I/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/include/c++ -I/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/include/c++/x86_64-pc-linux-gnu/"

	cd scipy-${pkgver}
	sh ${srcdir}/build.sh
}

#check() {
#	# we need to do a temp install so we can import scipy
#	# also, the tests must not be run from the scipy source directory
#	export LDFLAGS="-Wall -shared"
#
#	cd ${srcdir}/scipy-${pkgver}
#	python3 setup.py config_fc --fcompiler=intelem install \
#	  --prefix=/usr --root=${srcdir}/test --optimize=1
#	export PYTHONPATH=${srcdir}/test/usr/lib/python3.7/site-packages
#	cd ${srcdir}
#	python -c "from scipy import test; test('full')"
#}

package() {
	export LDFLAGS="-Wall -shared"

	cd scipy-${pkgver}
	python3 setup.py config --compiler=intelem --fcompiler=intelem install --prefix=/usr --root="${pkgdir}/" --optimize=1

	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
