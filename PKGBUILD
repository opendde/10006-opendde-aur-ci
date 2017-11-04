# Generated by debtap
# Maintainer: jaap
# Contributor: jaap
pkgname=synergy2-bin
pkgver=2.0.0rc1b1009v2
pkgrel=1
pkgdesc="Keyboard and mouse sharing solution. Synergy allows you to share one mouse and keyboard between multiple computers. Work seamlessly across Windows, macOS and Linux."
arch=('x86_64')
url="https://symless.com/synergy"
license=('unknown')
groups=('')
depends=('gcc>=5.2' 'bash-completion>=1.18.' 'gcc-libs>=3.0' 'hicolor-icon-theme' 'openssl-1.0' 'libx11>=1.2.99.901' 'libxext' 'libxi>=1.2.99.4' 'libxtst' 'openssl-1.0>=1.0.0' 'qt5-base>=5.5.0' 'qt5-declarative>=5.5.0' 'qt5-quickcontrols>=5.5.0')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source_x86_64=("https://www.dropbox.com/s/djyybwd1f5t9pjf/synergy_2.0.0.rc1-b1009%2Bc5bbd376_amd64.deb?dl=1")
sha512sums_x86_64=('b5a48a5dcbbe1f5af7c2403a566c7f38857cab449c35ccc852804dcd7987774884a2a3ab9c27dd82e93715f83c45417958f88a822c37a58ab3f13ef23db2c378')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/share/doc/synergy/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p usr/lib 2> /dev/null; cp -r lib/* usr/lib; rm -rf lib

	cd ..

}
