# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: Corax
pkgname=('python-mediainfodll' 'python2-mediainfodll')
_pkgname=MediaInfoLib
pkgbase=python-mediainfodll
pkgver=18.08.1
pkgrel=3
pkgdesc="Python 2 & 3 library for reading metadata from media files -- shared library"
arch=('any')
url="https://github.com/MediaArea/MediaInfoLib"
license=('BSD 2-Clause')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('2eab71d063d20569f47584bb08588212')

package_python-mediainfodll() {
    pkgdesc="Python 3 library for reading metadata from media files -- shared library"
    depends=('libmediainfo' 'python')

    install -Dm644 ${_pkgname}-${pkgver}/Source/MediaInfoDLL/MediaInfoDLL.py ${pkgdir}/usr/lib/python3.7/site-packages/MediaInfoDLL.py
    install -Dm644 ${_pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}

package_python2-mediainfodll() {
    pkgdesc="Python 2 library for reading metadata from media files -- shared library"
    depends=('libmediainfo' 'python2')

    install -Dm644 ${_pkgname}-${pkgver}/Source/MediaInfoDLL/MediaInfoDLL.py ${pkgdir}/usr/lib/python2.7/site-packages/MediaInfoDLL.py
    install -Dm644 ${_pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
