# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='em-keyboard'
pkgdesc='Command-line utility for referencing emoji characters by name'
pkgver='0.0.7'
pkgrel='2'
url='https://github.com/kennethreitz'
license=('custom:MIT')
arch=('any')
depends=('python-docopt' 'python-xerox')
source=("https://github.com/kennethreitz/em/archive/v${pkgver}.tar.gz")
sha512sums=('f66775526d226c3029a9fb09cbcc18016ef87e8a16e56bd7afbfa2d8b436f9e54b5d4acd78bd79e3c8cc7306c6145d61ff35d637f211922e7110c9ec6fb781ce')

package () {
	cd "${pkgname}-${pkgver}"
	2to3 --nobackups --write --no-diffs em
	python3 setup.py install --optimize=1 --root="${pkgdir}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
