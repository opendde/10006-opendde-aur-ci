# Maintainer: Panos Pitelos <pitepana@gmail.com>
 
pkgname=vamox-celeste
pkgver=201
pkgrel=0
pkgdesc="Vamox Celeste icon theme."
arch=('any')
url="http://vamox.blogspot.gr/2008/12/descargas-vamox.html"
license=('CC BY-SA 3.0')
options=(!strip)
source=(https://www.dropbox.com/s/nqvggbnyipbjybb/${pkgname}-${pkgver}.tar.gz)
sha256sums=('SKIP')
 
package() {
        cd "${srcdir}"
        
        #clean package
        pushd "${srcdir}/${pkgname}"
                rm "index (copia).theme" ".icon-theme.cache"
                install -Dm644 "VAMOX readme.txt" "$pkgdir"/usr/share/doc/$pkgname/README.txt
                rm "VAMOX readme.txt"
        popd
 
  install -d "${pkgdir}/usr/share/icons"
  cp -r "${pkgname}" "${pkgdir}/usr/share/icons"
}
