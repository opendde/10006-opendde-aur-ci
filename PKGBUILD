# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
#
# BETA: https://litecointalk.org/index.php?topic=18608.0
# pooler PGP key: gpg --recv-key 6FC4C9F7F1BE8FEA

pkgname=electrum-ltc
pkgver=2.4.3.1
pkgrel=1
pkgdesc="Lightweight Litecoin wallet"
arch=('any')
depends=('hicolor-icon-theme'
         'python2'
         'python2-dnspython'
         'python2-ecdsa'
         'python2-ltc_scrypt'
         'python2-pbkdf2'
         'python2-protobuf'
         'python2-pyqt4'
         'python2-qrcode'
         'python2-requests'
         'python2-six'
         'python2-slowaes'
         'python2-tlslite'
         'qt4')
makedepends=('gettext'
             'python2-pycurl'
             'python2-setuptools')
optdepends=('desktop-file-utils: update desktop icon'
            'gtk-update-icon-cache: update desktop icon'
            'python2-amodem: air-gapped transaction signing over audio modem'
            'python2-btchip: BTChip hardware wallet support'
            'python2-jsonrpclib: merchant script'
            'python2-matplotlib: plot transaction history in graphical mode'
            'python2-rpyc: send commands to Electrum Python console from an external script'
            'python2-trezor: TREZOR hardware wallet support'
            'xdg-utils: update desktop icon'
            'zbar: QR code reading support')
url="https://electrum-ltc.org"
license=('GPL3')
source=("https://electrum-ltc.org/download/Electrum-LTC-${pkgver}.tar.gz"{,.asc})
md5sums=('67d67666dad8f3bedb2c99355594b34f'
         'SKIP')
sha256sums=('6dde6bb7d0ea0c649f65c83cc2dde6dd290f967c7e955ca85b576e5070a40642'
            'SKIP')
validpgpkeys=('CAE1092AD3553FFD21C05DE36FC4C9F7F1BE8FEA')
install=electrum-ltc.install

prepare() {
  cd "$srcdir/Electrum-LTC-$pkgver"

  msg2 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd "$srcdir/Electrum-LTC-$pkgver"

  msg2 'Compiling icons...'
  pyrcc4 icons.qrc -o gui/qt/icons_rc.py

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/Electrum-LTC-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
