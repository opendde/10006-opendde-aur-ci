# Maintainer: Jeffrey Shaffner <risoftwi@gmail.com>
# Contributer: Matheus de Alcantara <matheus.de.alcantara@gmail.com>

pkgname=atom-editor-beta
_pkgbeta=3
_pkgver=1.8.0
pkgver="${_pkgver}.beta${_pkgbeta}"
pkgrel=1
pkgdesc='Chrome-based text editor from Github - Beta Channel'
arch=('x86_64' 'i686')
url='https://github.com/atom/atom'
license=('MIT')
depends=('alsa-lib' 'desktop-file-utils' 'gconf' 'gtk2' 'libgnome-keyring' 'libnotify' 'libxtst' 'nodejs' 'nss' 'python2')
optdepends=('gvfs: file deletion support')
makedepends=('git' 'npm')
conflicts=('atom-editor-bin' 'atom-editor-git' 'atom-editor-beta-bin' 'atom-editor')
install=atom.install
source=("https://github.com/atom/atom/archive/v${_pkgver}-beta${_pkgbeta}.tar.gz"
        "atom-beta.desktop"
        "package.patch")

sha256sums=('updpkgsums'
            'updpkgsums'
            'updpkgsums')

prepare() {
	cd "atom-${_pkgver}-beta${_pkgbeta}"

	sed -i -e "/exception-reporting/d" \
		-e "/metrics/d" package.json

	patch -Np0 -i "$srcdir/package.patch"
}

build() {
	cd "$srcdir/atom-${_pkgver}-beta${_pkgbeta}"

	export PYTHON=python2
	script/build --build-dir "$srcdir/atom-build"
}

package() {
	cd "$srcdir/atom-${_pkgver}-beta${_pkgbeta}"
	script/grunt install --build-dir "$srcdir/atom-build" --install-dir "$pkgdir/usr"

	[[ -f "${pkgdir}/usr/share/applications/atom-beta.destkop" ]] && rm -rf "${pkgdir}/usr/share/applications/atom-beta.destkop"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
	install -Dm644 "${srcdir}/atom-beta.desktop" "${pkgdir}/usr/share/applications/atom-beta.desktop"
}
