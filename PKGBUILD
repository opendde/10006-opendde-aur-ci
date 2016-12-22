# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=python-icalendar
pkgver=3.11.1
pkgrel=1
pkgdesc='A parser/generator of iCalendar files (RFC 2445)'
arch=('any')
url='http://pypi.python.org/pypi/icalendar/'
license=('GPL')
depends=('python' 'python-pytz' 'python-dateutil')
makedepends=('python-setuptools')
conflicts=('python-icalendar-git')

source=("https://pypi.python.org/packages/1e/4a/72be37cd66974799a62c0422a8195f0789fdbdd80c993f607db1fcc8615f/icalendar-3.11.1.tar.gz")
sha512sums=('f0c98ca029a7731c458ef65ec1b7c8ae284b0f0f42f51eb59def88ba93eeff6df02b9d9b39a9d33db16073ebc48154e58a62620970a520df275ff5e2dcc78c0e')

package() {
  cd "icalendar-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:
