# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
pkgname=sonic-pi
_progname="Sonic Pi"
pkgver=2.9.0
pkgrel=2
pkgdesc="A music-centric programming environment, originally built for the raspberry pi."
arch=('i686' 'x86_64')
url="http://sonic-pi.net/"
license=('MIT')
depends=('bash' 'sed' 'ruby' 'libffi' 'lua' 'qscintilla-qt5' 'jack' 'supercollider' 'http-parser')
makedepends=('cmake' 'qt5-tools')
optdepends=('qjackctl: for graphical jackd spawning/configuration'
	'jack2: better jackd if you want to use without gui'
	'sc3-plugins-git: plugins for supercollider')
source=("https://github.com/samaaron/${pkgname}/archive/v${pkgver}.tar.gz" "${pkgname}.png")
md5sums=('4b3ab8346a25e2327967cb61cb9270b8' 'e3ca8a1d949baf35cdf438c8d10159ff')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}/app/gui/qt"
	sed -i 's/lqscintilla2/lqt5scintilla2/g' SonicPi.pro
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/app/server/bin"
    ./compile-extensions.rb
	cd "${srcdir}/${pkgname}-${pkgver}/app/gui/qt"
    ./rp-build-app
}

package() {
	install -d -m 755 "${pkgdir}/opt"
	cp -R "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt"
    mv "${pkgdir}/opt/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"

	install -D -m 644 "${srcdir}/${pkgname}-${pkgver}/app/gui/qt/info/LICENSE.html" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.html"

    install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

	install -d -m 755 "${pkgdir}/usr/bin/"
	printf "#!/bin/sh
echo \"Remember to start jackd (using qjackctl or some other program) before launching!\"
/opt/${pkgname}/app/gui/qt/${pkgname}
" >> "${pkgdir}/usr/bin/${pkgname}"
	chmod +x "${pkgdir}/usr/bin/${pkgname}"

	install -d -m 755 "${pkgdir}/usr/share/applications/"
	printf "[Desktop Entry]
Version=${pkgver}
Type=Application
Name=${_progname}
Comment=${pkgdesc}
Exec=${pkgname}
Icon=${pkgname}
Categories=Education
Terminal=false
StartupNotify=true
" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"

}
