# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=fortune-mod-de-git
pkgver=0.34.r383.gc0e2322
pkgrel=1
pkgdesc="Fortune Cookies in German, from the Debian project"
url="https://salsa.debian.org/debian/fortunes-de"
depends=('fortune-mod')
makedepends=('recode')
groups=('fortune-mods')
source=("${pkgname%-git}::git+https://salsa.debian.org/debian/fortunes-de.git")
arch=('any')
options=('!strip')
license=('GPL2')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long | sed 's/^upstream\///;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	
  PREFIX=`pwd`/build \
  DOCDIR=usr/share/doc/${pkgname%-git} \
  BINDIR=usr/bin \
  FORTUNESDIR=usr/share/fortune ./install.sh -utf8
}

package() {
  cd "${srcdir}/${pkgname%-git}/build"
  rm -r {man,usr/bin}
  cp -r * "${pkgdir}"
  # Remove *.u8 files and strip ".fortunes" from filenames
  cd $pkgdir/usr/share/fortune/de
  rm *.u8
  for f in *.fortunes*; do
    mv $f ${f/.fortunes}
  done
}
