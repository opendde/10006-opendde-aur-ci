# Maintainer: Baudouin Roullier <DISGUISE baudouin dot roullier at gmail dot com DISGUISE>
# Originally by Mykal Anderson
pkgname=('shitpost')
pkgver=1
pkgrel=1
pkgdesc="A tool to create memes using CLI"
arch=('i686' 'x86_64')
license=('unknown')
url="https://redd.it/5ezk1f"
depends=('imagemagick' 'ttf-ms-fonts')
noextract=('shitpost')
md5sums=('7ed84dc6ec3a3593153520050be3ba50')

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    install -D -m755 shitpost "${pkgdir}/usr/bin/"
}
