# Maintainer: Sebastien Duthil <duthils@free.fr>

# Note: I can't test on x86, feel free to drop me an email/comment with the
# working PKGBUILD for x86

pkgname=blackvoxel
pkgver=2.40
pkgrel=2
pkgdesc="Game of automation and programming in a voxel world"
arch=('x86_64')
url='http://www.blackvoxel.com/'
license=('GPL3')
depends=('glew' 'hicolor-icon-theme' 'mesa' 'sdl')
install="${pkgname}.install"
source=("${pkgname}_source_2_40.tar.bz2::${url}/dm_download.php?file=149&key=1"
        "blackvoxel.patch")
sha256sums=('5e11959a147d888ec7985a10b11fdfef136b14a85bcf9136b16550d64e9dc04c'
            '5423a426434498480abe47a18ef10a11d8ee99fca8d2d05aec070814ccd6628a')

prepare() {
  # Disable #include glext. Should be already included by glew.
  patch "${srcdir}/${pkgname}_source_2_40/src/main.cpp" "${srcdir}/blackvoxel.patch"
}

build() {
	cd "${srcdir}/${pkgname}_source_2_40"
	make blackvoxeldatadir="/usr/share/${pkgname}/"
}

package() {
	cd "${srcdir}/${pkgname}_source_2_40"
	make install \
		specialinstall=true \
		DESTDIR="${pkgdir}/" \
		bindir="usr/bin/" \
		blackvoxeldatadir="usr/share/${pkgname}/" \
		icondir2="usr/share/icons/" \
		desktopdir="usr/share/applications/"
}
