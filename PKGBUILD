# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=deepin-mail-bin
pkgver=5.1.0.37.1
pkgrel=1
pkgdesc="Deepin mail"
arch=("x86_64" "i386")
url="https://www.deepin.com/"
license=("GPL3")
depends=( 'qt5-webengine'  'liblockfile'  'dtkwidget')
source_x86_64=("https://community-packages.deepin.com/deepin/pool/main/d/deepin-mail/deepin-mail_${pkgver}-1_amd64.deb")
source_i386=("https://community-packages.deepin.com/deepin/pool/main/d/deepin-mail/deepin-mail_${pkgver}-1_i386.deb")
sha512sums_x86_64=(
    '39e867cb3fe6121ca1b0ce5d7924bf2546e20d0d81d393f2cfbf653c11d4f3179cd5efe023d649d46b8c6691e0ee359e2d91d6d174ad1acfef059a1d611e7d34'
)
sha512sums_i386=(
    'a6f0aabaa15bc9e3761bc036a8992adb6629ee0cb4cb552dd44a875c05ff1058519f73223e2c613016a9a901ef6f79c1322386f73710ba8ade3dd3d8a9558107'
)

package(){
    cd ${srcdir}
    tar -xJvf data.tar.xz -C "${pkgdir}"
}
