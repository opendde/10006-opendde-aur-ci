# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>

pkgname=djgpp-djcrx-beta
pkgver=2.0.5
pkgrel=1
pkgdesc="Headers and utilities for the djgpp cross-compiler"
arch=(i686 x86_64)
url="http://www.delorie.com/djgpp/"
depends=('glibc')
provides=('djgpp-djcrx')
conflicts=('djgpp-djcrx')
license=("GPL")
source=(
	"http://www.delorie.com/pub/djgpp/beta/v2/djcrx${pkgver//./}.zip"
	"http://www.delorie.com/pub/djgpp/beta/v2/djlsr${pkgver//./}.zip"
)
sha512sums=(
	'5f47d6826ceb43b70bcc8386abe4103c25237d969b3d85ef7e60738128e65c75be9ba4e758fccbb6fb2323e41d19d3db2e143a9ebc773359a3bfbffb4e35b8d4'
	'4a3e8f85cff246863458f2ed291617d3e7b08f91d68b3c70ed8c8ff26536083dff3d478e98cfab8ecb2c55b50d73e02b5ac353fba4c51db10308cb9b9cbad6e3'
)
options=(!buildflags !strip)

_target_alias='i686-pc-msdosdjgpp'

prepare() {
	cd "$srcdir"

	sed -ie "s/i586-pc-msdosdjgpp/$_target_alias/" \
		src/makefile.def

	# gcc provides its own float.h which masks this one
	ln -fs float.h include/djfloat.h
	sed -ie 's/<float\.h>/<djfloat.h>/' \
		src/libc/emu387/npxsetup.c \
		src/libc/go32/dpmiexcp.c \
		src/utils/redir.c

	sed -ie '/XNOPGGPP/ s/$/ -Wno-strict-aliasing/' \
		src/libemu/src/makefile

	# cosmetics
	sed -ie '/@$(MISC) echo - / d; s/^\t@/\t/' \
		src/makefile.inc
}

build() {
	cd "$srcdir/src"

	make -j1
}

package() {
	install -Ddm 0755 "$pkgdir/usr/bin"
	install -Ddm 0755 "$pkgdir/usr/$_target_alias/bin"

	cp -r "$srcdir/lib"     "$pkgdir/usr/$_target_alias"
	cp -r "$srcdir/include" "$pkgdir/usr/$_target_alias"

	cd "$srcdir/hostbin"
	for file in dxegen.exe stubedit.exe stubify.exe; do
		install -Dm 0755 "$file" "$pkgdir/usr/$_target_alias/bin/${file%.exe}"
		ln -s "../$_target_alias/bin/${file%.exe}" "$pkgdir/usr/bin/$_target_alias-${file%.exe}"
	done
}
