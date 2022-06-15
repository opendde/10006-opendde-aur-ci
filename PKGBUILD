# Maintainer: Vadim Yanitskiy <axilirator@gmail.com>
pkgname=libfftranscode
pkgver=0.3
pkgrel=5
pkgdesc="Proprietary library for ASN.1 APER <-> BER transcoding of RUA/RANAP/HNBAP/S1AP"
arch=('x86_64')
url="http://ftp.osmocom.org/binaries/libfftranscode/"
license=('proprietary')
groups=('devel')
source=("http://ftp.osmocom.org/binaries/${pkgname}/${pkgname}-dev_${pkgver}_amd64.deb"
        "http://ftp.osmocom.org/binaries/${pkgname}/${pkgname}0_${pkgver}_amd64.deb")
md5sums=("88c83c41fb3136b518e323a827987985"
         "22e949d93831b13d01bbe2c917aceed9")

exz() {
	ar x $1
	tar xJf data.tar.xz
	rm data.tar.xz
}

package() {
	exz "${srcdir}/${pkgname}-dev_${pkgver}_amd64.deb"
	exz "${srcdir}/${pkgname}0_${pkgver}_amd64.deb"

	mkdir -p "${pkgdir}/usr/lib"
	cp "${srcdir}/usr/lib/x86_64-linux-gnu/libfftranscode.so.0.0.0" "${pkgdir}/usr/lib/"
	ln -s "libfftranscode.so.0.0.0" "${pkgdir}/usr/lib/libfftranscode.so.0"
	ln -s "libfftranscode.so.0.0.0" "${pkgdir}/usr/lib/libfftranscode.so"

	mkdir -p "${pkgdir}/usr/lib/pkgconfig"
	cp "${srcdir}/usr/lib/x86_64-linux-gnu/pkgconfig/libfftranscode.pc" "${pkgdir}/usr/lib/pkgconfig/"
	sed -i "s#/lib/x86_64-linux-gnu#/lib#" "${pkgdir}/usr/lib/pkgconfig/libfftranscode.pc"

	mkdir -p "${pkgdir}/usr/include"
	cp -r "${srcdir}/usr/include/fftranscode/" "${pkgdir}/usr/include/"
}
