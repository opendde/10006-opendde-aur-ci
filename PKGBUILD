# Maintainer: Konarev Alexander <avkonarev@gmail.com>

pkgname=ehaspd
pkgver=7.40.10
pkgrel=1
pkgdesc="Etersoft daemon supporting Sentinel HASP, HASP HL, HASP4 and Hardlock keys."
arch=('i686' 'x86_64')
url="http://etersoft.ru"
license=('custom')
source=(
  "http://ftp.etersoft.ru/pub/Etersoft/HASP/last/ArchLinux/CUR/haspd-7.40-10-i686.pkg.tar.xz"
	"$pkgname.service"
  )

install=$pkgname.install

if test "$CARCH" == x86_64; then
	depends=("lib32-glibc")
else
	depends=()
fi

conflicts=('aksusbd')

depends=('systemd' 'lib32-ncurses')
optdepens=('java-environment-common: is required to view the documentation html')

prepare(){
  cd $srcdir
  mv $srcdir/usr/sbin $srcdir/usr/bin
}

package() {
	cd $srcdir

	cp -r $srcdir/usr $pkgdir/usr
	cp -r $srcdir/etc $pkgdir/etc

	install -Dm644 ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
}

md5sums=('79d703c66b73fb8ea6064d801076a2af'
         '49ffda07eaf5c034bb9409ea56f26fea')

# vim: set noet ci pi sts=0 sw=4 ts=4:
