# Maintainer: jdn06 <jdn06.jdn06@outlook.fr>

pkgname=cryfs-git
_pkgname=cryfs
pkgver=2016.03
pkgrel=1
pkgdesc="CryFS encrypts your files, so you can safely store them anywhere"
arch=('i686' 'x86_64')
url="https://www.cryfs.org"
license=('LGPL')
depends=('fuse' 'openssl' 'crypto++')
makedepends=('git' 'cmake' 'boost' 'python2')
provides=('cryfs')
conflicts=('cryfs')

source=("$_pkgname"::"git://github.com/$_pkgname/$_pkgname.git")
sha256sums=(SKIP)

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed 's/-//g'
}

prepare() {
	cd "$srcdir/$_pkgname"
	mkdir cmake && cd cmake
	cmake ..
}

build() {
	cd "$srcdir/$_pkgname/cmake"
	make
}

package() {
	cd "$srcdir/$_pkgname/cmake"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
