# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=wallabag
pkgver=1.9.1b
_pkgver="$(sed -r 's/([a-zA-Z])/-\1/' <<< $pkgver)"
pkgrel=1
pkgdesc='Self hostable application for saving web pages'
arch=('any')
url='http://www.wallabag.org/'
license=('MIT')
depends=('php>=5.3.3' 'php-tidy' 'pcre' 'php-gd')
optdepends=('mariadb: For MySQL storage' 'php-sqlite: For sqlite storage' 'php-pgsql: For postgres storage')
install="$pkgname.install"
options=(!strip)
source=("https://github.com/wallabag/wallabag/archive/${_pkgver}.tar.gz" "vendor.zip::http://wllbg.org/vendor")
sha256sums=('964d2cfb0a4f664285ddbaa08b873d55066b9937762d4b892a03e3619ad3ec09'
            'bd3e843290de28f1c20fa19ed746ca221c9174cb7f0a9723618f21bddb883e12')

package() {
    cd "${pkgdir}"
    mkdir -p usr/share/webapps
    mv "${srcdir}/${pkgname}-${_pkgver}" usr/share/webapps/${pkgname}
    mv "${srcdir}/vendor" usr/share/webapps/${pkgname}/vendor
    chown -R http:http "${pkgdir}/usr/share/webapps/wallabag"
}

