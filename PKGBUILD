# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Joey Dumont <joey.dumont@gmail.com>
# Contributor: Pierre Bourdon <delroth@gmail.com>
# Contributor: larsrh <hupel@in.tum.de>

pkgname=gcc6-gcj-ecj
pkgver=4.9
pkgrel=1
pkgdesc="A fork of the Eclipse Java bytecode compiler for GCJ"
depends=()
provides=('eclipse-ecj' 'gcc-gcj-ecj')
conflicts=('eclipse-ecj' 'gcc-gcj-ecj')
arch=('any')
license=('EPL')
url="http://gcc.gnu.org/java/"
source=(http://mirrors.kernel.org/sources.redhat.com/java/ecj-${pkgver}.jar)
noextract=("ecj-${pkgver}.jar")

package() {
	install -D -m644 $srcdir/ecj-${pkgver}.jar $pkgdir/usr/share/java/eclipse-ecj.jar
}
md5sums=('7339f199ba11c941890031fd9981d7be')
