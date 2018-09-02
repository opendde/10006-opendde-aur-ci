# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=python-mediainfodll
_pkgname=MediaInfoLib
pkgver=18.05
pkgrel=1
pkgdesc="library for reading metadata from media files -- shared library"
arch=('any')
url="https://github.com/MediaArea/MediaInfoLib"
license=('BSD 2-Clause')
depends=('libmediainfo')
provides=('python-mediainfodll')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('59e9523c472a77f5b23ca3c072595161')

package() {
    install -Dm644 ${_pkgname}-${pkgver}/Source/MediaInfoDLL/MediaInfoDLL.py ${pkgdir}/usr/lib/python2.7/site-packages/MediaInfoDLL.py
    install -Dm644 ${_pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
