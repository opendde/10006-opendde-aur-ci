# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
# Contributor: Hanno Zulla <kontakt@hanno.de>
pkgname=sonic-pi
_progname="Sonic Pi"
pkgver=2.11.1
pkgrel=4
pkgdesc="A music-centric programming environment, originally built for the raspberry pi."
arch=('i686' 'x86_64')
url="http://sonic-pi.net/"
license=('MIT')
depends=('lua' 'qscintilla-qt5' 'jack' 'supercollider' 'ruby-hamster' 'ruby-wavefile'
		 'ruby-activesupport' 'ruby-kramdown' 'ruby-rugged' 'ruby-multi_json'
		 'ruby-thread_safe' 'ruby-gettext' 'ruby-fast_osc' 'ruby-aubio' 'qwt'
		 'ruby-memoist' 'boost' 'ruby-sys-proctable')
makedepends=('cmake' 'qt5-tools' 'sed' 'quilt')
optdepends=('qjackctl: for graphical jackd spawning/configuration'
			'jack2: better jackd if you want to use without gui'
			'supercollider-with-plugins: includes sc3-plugins e.g. piano synth')
source=("https://github.com/samaaron/${pkgname}/archive/v${pkgver}.tar.gz" "${pkgname}.png" "${pkgname}.desktop"
		"${pkgname}.install" "01-do-no-require-unused-ruby-gems.patch"
		"02-use-debian-gems.patch" "03-rename-ruby-beautify-legacy.patch" "04_rp_build_app.patch"
		"05_adjust_paths.patch" "06_temp_remove_randstream.patch" "series")
md5sums=('54dcc89d8ff362d2a1362cc71fed4950'
         'e3ca8a1d949baf35cdf438c8d10159ff'
         '19a64d717674f75918c176197650b44a'
         '20d0d75ffccf48af2728441652d8afd6'
         '290351f08d17e43cd4a218a2b04a2d5c'
         '65d9f0e5f6c9cddad7e8e96dff101091'
         '7854f578da8384f918a6a4fd223cd9db'
         '2a1e1f84caf9bf88e618ccbf20ed0031'
         '158c587e1083510074e3572437f38e58'
         '781b567c4dc78277263ec8f67e578676'
         '4f814de4feab7c0a7950409bb52ab0d2')
install="${pkgname}.install"

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir patches
	mv ../series ../*.patch patches
	sed -i 's/lqt5scintilla2/lqscintilla2_qt5/g' "app/gui/qt/SonicPi.pro"
	quilt push -a
	mv "app/server/vendor/ruby-beautify/lib/ruby-beautify.rb" "app/server/vendor/ruby-beautify/lib/ruby-beautify-legacy.rb"
	rm -fr "app/server/vendor/ruby-beautify/lib/ruby-beautify-legacy"
	mv "app/server/vendor/ruby-beautify/lib/ruby-beautify" "app/server/vendor/ruby-beautify/lib/ruby-beautify-legacy"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/app/server/bin"
    ./compile-extensions.rb
	cd "${srcdir}/${pkgname}-${pkgver}/app/gui/qt"
    ./rp-build-app
    cd "${srcdir}/${pkgname}-${pkgver}"
    quilt pop
}

package() {
	install -d "${pkgdir}/usr/share/pixmaps"
	install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps"

	install -d "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications"

	cd "${srcdir}/${pkgname}-${pkgver}"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}"

	install -d "${pkgdir}/usr/bin"
	install -D "app/gui/qt/sonic-pi" "${pkgdir}/usr/bin"

	install -d "${pkgdir}/usr/share/sonic-pi"
	cp -r "etc/samples" "${pkgdir}/usr/share/sonic-pi"
	cp -r "etc/buffers" "${pkgdir}/usr/share/sonic-pi"
	cp -r "etc/snippets" "${pkgdir}/usr/share/sonic-pi"
	cp -r "etc/examples" "${pkgdir}/usr/share/sonic-pi"
	
	install -d "${pkgdir}/usr/share/doc/sonic-pi"
	cp -r "etc/doc/cheatsheets" "${pkgdir}/usr/share/doc/sonic-pi"
	cp -r "etc/doc/generated" "${pkgdir}/usr/share/doc/sonic-pi"
	cp -r "etc/doc/lang" "${pkgdir}/usr/share/doc/sonic-pi"
	cp -r "etc/doc/tutorial" "${pkgdir}/usr/share/doc/sonic-pi"
	cp -r "app/gui/qt/book" "${pkgdir}/usr/share/doc/sonic-pi"
	cp -r "app/gui/qt/theme" "${pkgdir}/usr/share/doc/sonic-pi"
	
	install -d "${pkgdir}/usr/share/doc/sonic-pi/images"
	cp -r "app/gui/qt/images/tutorial" "${pkgdir}/usr/share/doc/sonic-pi/images"
	
	install -d "${pkgdir}/usr/lib/sonic-pi/server"
	install -D "app/server/core.rb" "${pkgdir}/usr/lib/sonic-pi/server"
	cp -r "app/server/bin" "${pkgdir}/usr/lib/sonic-pi/server"

	install -d "${pkgdir}/usr/lib/sonic-pi/server/vendor"
	cp -r "app/server/vendor/ruby-beautify" "${pkgdir}/usr/lib/sonic-pi/server/vendor"
	
	install -d "${pkgdir}/usr/lib/sonic-pi/server/sonicpi"
	cp -r "app/server/sonicpi/lib" "${pkgdir}/usr/lib/sonic-pi/server/sonicpi"
	
	install -d "${pkgdir}/usr/share/sonic-pi/synthdefs"
	cp -r "etc/synthdefs/compiled" "${pkgdir}/usr/share/sonic-pi/synthdefs"
}
