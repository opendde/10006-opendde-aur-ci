# Maintainer: Dónal Murray <dmurray654@gmail.com>

pkgname=protonvpn-applet
pkgver=0.1.7
pkgrel=1
pkgdesc='Unofficial basic systray applet for protonvpn-cli written in python + PyQt5'
url='https://github.com/seadanda/protonvpn-applet'
arch=('i686' 'x86_64')
license=('MIT')
depends=('python' 'libnotify' 'python-pyqt5' 'protonvpn-cli-ng' 'gobject-introspection')

source=("https://github.com/seadanda/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('b49e503121df26e55bd7592c739018f6')

prepare() {
    tar xzf ${pkgver}.tar.gz
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX='/usr' ICONDIR='/usr/share/icons/hicolor/16x16/apps' install
    sed -i "s@${pkgdir}@@g" ${pkgdir}/usr/bin/${pkgname}
    install -Dm644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
