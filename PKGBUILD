# Maintainer: Vivien Maisonneuve <v dot maisonneuve at gmail dot com>
# Category: system
pkgname='vncdotool-git'
pkgver=0.12.0.r0.g7b6c661
pkgrel=1
pkgdesc='A command line VNC client'
arch=('any')
url='https://github.com/sibson/vncdotool'
license=('MIT')
depends=('python-pillow' 'python-twisted' 'python-zope-interface')
provides=('vncdotool')
conflicts=('vncdotool')
source=('git+https://github.com/sibson/vncdotool.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/vncdotool"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/vncdotool"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/vncdotool/LICENSE.txt"
}
