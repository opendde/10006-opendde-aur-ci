# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=douban.fm
pkgver=0.4.1
pkgrel=1
pkgdesc="a tiny and smart cli player of douban.fm based on Python"
url="https://github.com/taizilongxu/douban.fm"
depends=('python2' 'python2-termcolor' 'python2-requests' 'mplayer')
makedepends=('python2-setuptools')
optdepends=('libnotify: for desktop notification')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/d/douban.fm/douban.fm-${pkgver}.tar.gz")
md5sums=('d652f438f2b94d49905334dde1bc483c')

package() {
    cd "${srcdir}/douban.fm-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    # mv ${pkgdir}/usr/bin/{douban.fm,doubanfm}
}
