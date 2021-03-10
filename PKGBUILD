# Maintainer: Mirko Scholz
pkgname=qwt5-qt5
_commit=acd8dbb0c373154c664e23cae7ccd70f7d0f2651
pkgver=5.2.3.3
pkgrel=1
pkgdesc='Qwt library (version 5.2.3) updated to work with Qt5.'
arch=('x86_64')
license=('custom')
depends=('qt5-base' 'qt5-svg')
url='https://github.com/gbm19/qwt5-qt5'
source=(
"qwt5-qt5-${pkgver}.zip::https://github.com/gbm19/qwt5-qt5/archive/${_commit}.zip"
"qwtconfig-archlinux.pri"
)
sha1sums=('a6ca85b49615d141e58e4ac5df451619e81e190e'
          'f78e1dd11f7e5dedf0b62370485688729cb344ad')

prepare() {
	install -Dm644 "qwtconfig-archlinux.pri" "${srcdir}/qwt5-qt5-${_commit}/qwtconfig.pri"
}

build() {
	cd "${srcdir}/qwt5-qt5-${_commit}"
	qmake-qt5 qwt.pro
	make
}

package() {
	cd "${srcdir}/qwt5-qt5-${_commit}"
	make INSTALL_ROOT="${pkgdir}" install

	# remove docs
	rm -r "${pkgdir}/usr/share/doc/"
	rm -r "${pkgdir}/usr/share/man/"

	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
