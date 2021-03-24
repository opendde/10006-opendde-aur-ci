# Maintainer: Martin Rys <rys.pw/#contact_me>
# Previous Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=haste-server-git
_gitname=haste-server
pkgver=r384.5d2965f
pkgrel=2
pkgdesc="Prettiest, easiest to use pastebin ever made"
arch=('any')
url="https://github.com/seejohnrun/haste-server"
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm')
provides=('haste-server')
conflicts=('haste-server')
options=(!emptydirs)
source=('git://github.com/seejohnrun/haste-server.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_gitname}"

	# Adding missing files to package.json
	sed -i '38i "config.js","about.md",' package.json

	# Changing defaut storage to file
	sed -i '36c "path": "./data","type": "file"' config.js

	# Unable to run haste from /usr/bin, so removing it
	sed -i '32,34d' package.json

	# Fix error with npm5 issue
	npm pack
}

package() {
	cd "${srcdir}/${_gitname}"
	install -Dm644 "../../${_gitname}.service" -t "${pkgdir}/usr/lib/systemd/system"
	npm install --cache ../cache -g --prefix "${pkgdir}/usr" *.tgz
}
