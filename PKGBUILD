# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: evertonstz <evertonjcorreia@gmail.com>

_pkgname=iris
pkgname=mopidy-${_pkgname}
pkgver=3.9.0
pkgrel=1
pkgdesc='A Mopidy Web client that utilizes the Spotify and EchoNest frameworks. (Formerly Spotmop)'
arch=('any')
url="https://github.com/jaedb/${_pkgname}"
license=('APACHE')
depends=('python2' 'mopidy' 'mopidy-spotify' 'python2-configobj'
         'mopidy-local-images' 'python2-pylast' 'python2-raven')
makedepends=('python2' 'python2-setuptools' 'python2-pip')
optdepends=('mopidy-local-sqlite: local library support')
source=("https://files.pythonhosted.org/packages/source/M/Mopidy-Iris/Mopidy-Iris-${pkgver}.tar.gz")
sha256sums=('e4b000e33952c89e1ffe641dd3d9ba4eadb132b989990547ec99bf4c5fdd92a0')

package() {
  cd "${srcdir}/Mopidy-Iris-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
