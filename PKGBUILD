# Maintainer: Shatur95 <genaloner@gmail.com>

pkgname=crow-translate
pkgver=2.0.0
pkgrel=2
pkgdesc="A simple and lightweight translator that allows to translate and say selected text using Google and Yandex translate API"
arch=('x86_64')
url="https://github.com/Shatur95/crow-translate"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-x11extras' 'gst-plugins-good' 'openssl')
makedepends=('qt5-tools')
source=($pkgname.tar.gz::"https://github.com/Shatur95/crow-translate/archive/$pkgver.tar.gz"
        QOnlineTranslator-submodule.tar.gz::"https://github.com/Shatur95/QOnlineTranslator/archive/1.0.0.tar.gz"
        QHotkey-submodule.tar.gz::"https://github.com/Skycoder42/QHotkey/archive/1.2.2.tar.gz"
        SingleApplication-submodule.tar.gz::"https://github.com/itay-grudev/SingleApplication/archive/v3.0.10.tar.gz")
sha256sums=('de823e7ee72d4a6e92014bacc9efdfd9785ead0b6556939a36a917b01acc2ee5'
            'b53ee9b78e19ba4e3f963085a7007a5cebfd5f39bf885f4f96852cba1f84e341'
            '1a5a6eb81738a8f232df2dd5c908839871077e10ca3b9a6437daf5fda53d86ad'
            '9c8ae7431ea008c4516456615558c433940d3d0a144dc549f5aac43193b4afc0')

# Move submodules into the project
prepare() {
    mv QOnlineTranslator-1.0.0/* "$pkgname-$pkgver/src/qonlinetranslator"
    mv QHotkey-1.2.2/* "$pkgname-$pkgver/src/third-party/qhotkey"
    mv SingleApplication-3.0.10/* "$pkgname-$pkgver/src/third-party/singleapplication"
}

build() {
    cd "$pkgname-$pkgver"
    qmake
    make
}

package() {
    cd "$pkgname-$pkgver"
    make INSTALL_ROOT="$pkgdir/" install
	warning "After switching to version 2.0.0 from older ones, need to delete application settings (just remove ~/.config/crow)"
} 
