# Maintainer: Václav Šmejkal <business.engo150@gmail.com>

pkgname=why2
pkgver=v
pkgrel=1
epoch=
pkgdesc="Installation of WHY2 Encryption System library on your machine!"
arch=(x86_64)
url="https://github.com/ENGO150/WHY2.git"
license=('MIT')
groups=()
depends=()
makedepends=(git gcc curl json-c)
checkdepends=()
optdepends=()
provides=(why2)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"

	printf "vr%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname"

#	chmod +x build.sh
#	./build.sh install lib
#
#	install -Dm644 libwhy2.so "${pkgdir}/usr/lib/libwhy2.so"
#	install -Dm644 include/*.h "${pkgdir}/usr/include/${pkgname}/"

	echo "You're gay."

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
