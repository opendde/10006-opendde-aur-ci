# Maintainer: DenBrahe <denbrahe@hotmail.com>
# Contributor: Philipp A. <flying-sheep@web.de>
# Contributor: theSander <aur@sandervanbalen.be>
pkgname=rambox-os-git
pkgver=r1020.92c1c48
pkgrel=1
pkgdesc="Free and Open Source messaging and emailing app that combines common web applications into one."
arch=(i686 x86_64)
url="https://github.com/TheGoddessInari/rambox"
license=('GPL3')
depends=(electron)
makedepends=('jre8-openjdk' 'git' 'desktop-file-utils' 'ruby' 'npm' 'sencha-cmd-6')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "rambox" "rambox-bin")
replaces=()
backup=()
options=()
install=
source=(
	'rambox-os::git+https://github.com/TheGoddessInari/rambox.git'
	"${pkgname%-git}.desktop"
	)
noextract=()
md5sums=('SKIP' 'SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	sed -Ei 's/\s+"electron": "[^"]+",//' package.json
}

build() {
	cd "$srcdir/${pkgname%-git}"
	npm install
	env PATH="/usr/lib/jvm/java-8-openjdk/jre/bin/:$PATH" npm run repack:linux64
}

package() {
	install -d "$pkgdir/usr/lib"
	install -d "$pkgdir/usr/bin"

	cp -r "$srcdir/${pkgname%-git}/dist/linux-unpacked" "$pkgdir/usr/lib/${pkgname%-git}"
	
	install -Dm644 "$srcdir/${pkgname%-git}/resources/Icon.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
	ln -s "/usr/lib/${pkgname%-git}/rambox" "${pkgdir}/usr/bin/${pkgname%-git}"
	desktop-file-install "$srcdir/${pkgname%-git}.desktop" --dir "$pkgdir/usr/share/applications/"
}
