# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Dave Blair <mail@dave-blair.de>
pkgname=autokey-py3
pkgver=0.95.1
pkgrel=2
pkgdesc="Python 3 port of AutoKey, a desktop automation utility for Linux and X11 with new features."
url="https://github.com/guoci/autokey-py3"
depends=('python' 'wmctrl' 'hicolor-icon-theme' 'python-dbus' 'python-pyinotify'
  'zenity' 'xautomation' 'imagemagick' 'xorg-xwd' 'python-xlib' 'python-six'
  'python-gobject' 'gtksourceview3' 'libnotify' 'libappindicator-gtk3'
  'gtk-update-icon-cache')
makedepends=('python-setuptools')
optdepends=('python-atspi'
            'qt-at-spi: to work with KDE/Qt applications'
            'python-pyqt5: for Qt interface'
            'python-qscintilla-qt5: for Qt interface')
conflicts=('autokey' 'autokey-gtk' 'autokey-data')
license=('GPL3')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/autokey-py3/autokey/archive/v${pkgver}.tar.gz"
        "requires.patch")
sha256sums=('a35d15e2582e89d9689b12eded7e1430ea8692e707e1bcb2c071ebfb008115cb'
            '4e33374c4eff96573ce92fda5e8263c8a610c9ba9fdce98046a0a3a05ac9a478')

prepare() {
    cd "$srcdir/autokey-${pkgver}"
    patch -Np1 -i ../requires.patch
}

package() {
    cd "$srcdir/autokey-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 
}
