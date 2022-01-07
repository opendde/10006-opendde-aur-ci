# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: librewish <librewish at gmail dot com>
pkgname=qomui-git
pkgver=0.8.2.r22.23650ab
pkgrel=2
pkgdesc="Qt OpenVPN Management UI"
arch=('x86_64')
url="https://github.com/corrad1nho/qomui"
license=('GPL3')
depends=('python-pyqt5' 'python-dbus' 'openvpn' 'stunnel' 'bind-tools'
         'python-psutil' 'python-requests' 'python-lxml' 'python-beautifulsoup4'
         'python-pexpect' 'wireguard-tools' 'python-cryptography')
makedepends=('git' 'python-setuptools')
optdepends=('geoip: to identify server locations'
            'dnsmasq: required for bypassing OpenVPN'
            'libcgroup: required for bypassing OpenVPN'
            'iptables: required for bypassing OpenVPN')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/corrad1nho/qomui.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py build
}

check() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py test
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
