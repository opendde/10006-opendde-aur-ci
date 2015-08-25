# Maintainer: bslackr <brendan at vastactive dot com>

pkgname=sucrack
pkgver=1.2.3
pkgrel=3
pkgdesc='a multi-threaded Linux/UNIX tool for brute-force cracking local user accounts via su'
url='http://labs.portcullis.co.uk/application/sucrack'
license=('custom')
arch=('i686' 'x86_64')
source=("http://labs.portcullis.co.uk/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('6ebfe5e94577a53ce8dcabadd3581ec3')

build() {
  unset LDFLAGS
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-static-buffer
  make
}

check() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make -k check
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
