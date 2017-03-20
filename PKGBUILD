# Maintainer : Guillaume Horel <guillaume.horel@gmail.com>
_pkgname=sofia-sip
pkgname=sofia-sip-bc
pkgver=1.13.12bc
pkgrel=1
pkgdesc="An open-source SIP User-Agent library"
arch=('i686' 'x86_64')
url="http://sofia-sip.sourceforge.net"
options=('zipman')
license=('LGPL')
depends=('glib2' 'openssl')
provides=('sofia-sip')
conflicts=('sofia-sip')
source=("git+https://github.com/BelledonneCommunications/sofia-sip.git#commit=6c9540d48")
sha256sums=('SKIP')

build() {
  cd "$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr --with-openssl
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}
