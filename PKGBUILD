# Maintainer: Atte Virtanen <aten.email@gmail.com>
pkgname=vrk-mpollux-digisign-client
pkgver=4.0.8_5448
pkgrel=1
pkgdesc="Client program for Finnish chip ID cards"
arch=('i686' 'x86_64')
url="https://eevertti.vrk.fi/linux-versiot"
license=('custom')
depends=('pcsclite' 'qt4')

source_i686=("https://eevertti.vrk.fi/documents/2634109/2857792/Ubuntu_14.04.2_LTS_mpollux-digisign-client-for-vrk_${pkgver//_/-}_i386.deb")
source_x86_64=("https://eevertti.vrk.fi/documents/2634109/2857792/Ubuntu_14.04.2_LTS_mpollux-digisign-client-for-vrk_${pkgver//_/-}_amd64.deb")

md5sums_i686=('0e04f31d0769b1d35c9bc4647487d20c')
md5sums_x86_64=('c1f4bd545e245ae3f09d6306cf6aa576')
sha1sums_i686=('a64c93e7ae71212392b3c64306a14ca6779cf754')
sha1sums_x86_64=('d04b35810601871c3b53928aa8239d898e257287')
sha256sums_i686=('e7f0d1f8176715847e15c549ef3733cf7175ae71874aa82f55dce6f6a1f49abc')
sha256sums_x86_64=('0523672812e2d54c43cbf476ae95ccb9df57fa50229e7e4528d1521105f0ff6e')
sha384sums_i686=('4619ee85d379892938436368dbb80459f26201dc3ea7bd4771ee9f91dab48d0fbd3194aa264d3c4c52205bcda4a3dd15')
sha384sums_x86_64=('3a8392189e9256a4a4ff71be8761125455b408a88a3b3a8a8e07602920008e694be793d7570754f14a3d6c4b3dc33433')
sha512sums_i686=('c1d6599674cedb8d1ca0a218e0af929b4df9b9bdf54992438bc7be169d680b0bb021cef068eaa58c2913019907cceb5b6ad11a0b707a01d1ac47263198306abc')
sha512sums_x86_64=('6886f6a7d10b7b93ea371f8a42e28ad6e0f3cfb38cac4433a77c086ef8b6a9a9905381ae255f6f3bed8a1ac4b18bf73928ca6b1a0129541404401ff9c81e52d2')

package() {
	tar xvfJ data.tar.xz
	cp -r etc usr "$pkgdir/"

	rmdir "$pkgdir/usr/sbin"
	mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
	mv "$pkgdir/usr/share/doc/mpollux-digisign-client-for-vrk" "$pkgdir/usr/share/doc/$pkgname"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
	mv "$pkgdir/usr/share/doc/$pkgname/"{copyright,Legal_Notice_*.html} "$pkgdir/usr/share/licenses/$pkgname/"
}
