# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=vis
_commit='8572b58'
pkgver=0.r737.g8572b58
pkgrel=1
pkgdesc='suckless vim like editor'
arch=('i686' 'x86_64')
url='http://repo.or.cz/vis.git'
depends=('ncurses' 'libtermkey' 'lua')
optdepends=('lua-lpeg: for syntax highlighting')
makedepends=('git' 'markdown')
license=('custom:ISC')
source=("git://repo.or.cz/vis.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
	cd vis/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git log -1 --format='%h')"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git log -1 --format='%h')"
	fi
}

prepare() {
	cd vis/

	sed -i '/^\(C\|LD\)FLAGS_LUA =/s/lua5.1/lua/' config.mk
}

build() {
	cd vis/

	make

	markdown README.md > README.html
}

package() {
	cd vis/

	make DESTDIR="${pkgdir}" PREFIX='/usr/' install

	install -D -m0644 'LICENSE' "${pkgdir}/usr/share/licenses/vis/LICENSE"
	install -D -m0644 'README.md' "${pkgdir}/usr/share/doc/vis/README.md"
	install -D -m0644 'README.html' "${pkgdir}/usr/share/doc/vis/README.html"
}

