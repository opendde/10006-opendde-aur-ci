# Maintainer: wszqkzqk <wszqkzqk@gmail.com>
# Maintainer: arkli <LFZ0107@outlook.com>
pkgname=deepin.com.qq.im
pkgver=8.9.19983deepin18
pkgrel=2
epoch=
pkgdesc="Deepin Wine QQ 8.9."
arch=('i686' 'x86_64')
url="http://im.qq.com/"
license=('Proprietary')
groups=()
depends=('deepin-wine')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=('deepin-qq-im')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://mirrors.aliyun.com/deepin/pool/non-free/d/${pkgname}/${pkgname}_${pkgver}_i386.deb")
noextract=("${pkgname}_${pkgver}_i386.deb")
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	ar -x ${pkgname}_${pkgver}_i386.deb
	mkdir ${pkgname}-${pkgver}
	tar -xf data.tar.xz --directory="${pkgname}-${pkgver}"	
}

package() {
	cd "${pkgname}-${pkgver}"
	cp -r ./ ${pkgdir}/
}
