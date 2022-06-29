# Maintainer: Yurii Kolesykov <root@yurikoles.com>
# Contributor: Carson Black <uhhadd AT gmail DOT com>
# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Eduardo Robles Elvira <edulix AT gmail DOT com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=obs-build
pkgver=20220620
pkgrel=1
license=(GPL)
pkgdesc='OBS build script, can be used with OBS or stand alone'
url=https://github.com/openSUSE/obs-build
arch=(any)
depends=(perl)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/openSUSE/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('3fd0799ceab3ab2e9712460413a9d3063884084a87d1b672903f48b7ce4b625f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
