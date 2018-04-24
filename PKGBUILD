# Generated by debtap
# Maintainer: jaap
# Contributor: jaap
pkgname=synergy2
pkgver=2.0.10.stable~b1621+ecfd5e95
pkgrel=1
pkgdesc="Keyboard and mouse sharing solution. Synergy allows you to share one mouse and keyboard between multiple computers. Work seamlessly across Windows, macOS and Linux."
arch=('x86_64')
url="https://symless.com/synergy"
license=('unknown')
groups=('')
depends=('gcc>=5.2' 'bash-completion>=1.18.' 'gcc-libs>=3.0' 'hicolor-icon-theme' 'openssl-1.0' 'libx11>=1.2.99.901' 'libxext' 'libxi>=1.2.99.4' 'libxtst' 'openssl-1.0>=1.0.0' 'qt5-base>=5.5.0' 'qt5-declarative>=5.5.0' 'qt5-quickcontrols>=5.5.0' 'qt5-svg>=5.5.0')
conflicts=('synergy' 'synergy2-bin')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://binaries.symless.com/v2.0.10/synergy_2.0.10.stable~b1621%2Becfd5e95_amd64.deb" "https://gist.githubusercontent.com/JAicewizard/a70388a3a7c52fef21299f961a652364/raw")
sha512sums_x86_64=("4bde42a7cac4cf67afbd265e96eed1f0f8c8d82c725fc3d9a8b987fbe742db0cd423707bffb3e97c3849c52d6d1154bbab61a3231701d08ee8a9a51b33596cbb" "9c818d4f4929d156a6926336048cab4e398047037f45a177cdb71ede9c54d7b16992b7e5437999b2c72d3604c22092790e112abb234647abb0b34adf8e56b76b")
package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	ls
	cat "raw"
	mv "raw" "${pkgdir}/lib/systemd/system/synergy.service"
	# Fix directories structure differencies
	cd "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/share/doc/synergy/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	mkdir -p usr/lib 2> /dev/null; cp -r lib/* usr/lib; rm -rf lib
	sed -i "s/{DISPLAY}/${DISPLAY}/g" "${pkgdir}/usr/lib/systemd/system/synergy.service"
	cd ..
}
