# Maintainer: DiogoNSilva <o.diogosilva@gmail.com>
# Contributor: Stunts <f.pinamartins@gmail.com>

_pkgname=TriFusion
pkgname=trifusion-bin
pkgver=0.5.0
pkgrel=2
pkgdesc="Streamlining phylogenomic data gathering, processing and visualization"
arch=("any")
url="https://github.com/ODiogoSilva/TriFusion"
license=("GPL3")
conflicts=("trifusion-git" "trifusion")
source=("https://github.com/ODiogoSilva/${_pkgname}/releases/download/${pkgver}/TriFusion-${pkgver}-linux.tar.xz")
md5sums=("a74b2667e520914757051d7885d1c44d")

package() {
	cd ${srcdir}
	install -Dm755 TriFusion "${pkgdir}/usr/bin/TriFusion"
	install -Dm644 trifusion.desktop "${pkgdir}/usr/share/applications/trifusion.desktop"
	install -Dm644 trifusion-icon-128.png "${pkgdir}/usr/share/pixmaps/trifusion-icon-128.png"
}
