# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Tobias T. <OldShatterhand at gmx-topmail dot de>
# Contributor: SanskritFritz (gmail)
# Maintainer: Bink <bibletime-gitwfhu4sip@katink.net>

pkgname=bibletime-git
_gitname="bibletime"
pkgver=v3.0_rc1.r905.gf4615754e
pkgrel=1
epoch=2
pkgdesc="BibleTime is a Bible study application based on the Sword library and Qt toolkit."
arch=('x86_64' 'i686')
url="https://bibletime.info/"
license=('GPL2')
depends=('sword>=1.8.1' 'qt5-webengine>=5.15')
makedepends=('cmake' 'git' 'fop' 'po4a' 'docbook-xsl=1.79.2-7' 'docbook-xml')
provides=('bibletime')
conflicts=('bibletime')
source=("git+https://github.com/bibletime/bibletime.git")

md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	mkdir -p "$srcdir/$_gitname/build_dir"
	cd "$srcdir/$_gitname/build_dir"

	CXXFLAGS+=" -fpermissive"
	cmake -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_BUILD_TYPE=Release \
	      -DBUILD_HANDBOOK_HTML=ON \
	      -DBUILD_HANDBOOK_PDF=ON \
	      -DBUILD_HOWTO_HTML=ON \
	      -DBUILD_HOWTO_PDF=ON \
	      -DBT_DOCBOOK_XSL_HTML_CHUNK_XSL=/usr/share/xml/docbook/xsl-stylesheets-1.79.2/html/chunk.xsl \
	      -DBT_DOCBOOK_XSL_PDF_DOCBOOK_XSL=/usr/share/xml/docbook/xsl-stylesheets-1.79.2/fo/docbook.xsl \
	      ..
	make
}

package() {
	cd "$srcdir/$_gitname/build_dir"
	make DESTDIR="$pkgdir" install
}
