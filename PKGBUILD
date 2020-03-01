# Maintainer: robertfoster
pkgname=google-music-manager-uploader
pkgver=1.6.0
pkgrel=1
pkgdesc="Google Music Manager Uploader Daemon"
arch=('any')
url="https://github.com/jaymoulin/google-music-manager-uploader"
license=('MIT')
depends=('google-music-manager-auth' 'python-beautifulsoup4' 'python-gmusicapi' 'python-netifaces' 'python-watchdog')
makedepends=('python-setuptools')
source=("https://github.com/jaymoulin/google-music-manager-uploader/archive/$pkgver.tar.gz")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i 's/bs4/beautifulsoup4/g' setup.cfg
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
md5sums=('295fcd720d11779dc8406e24bfb641db')
