# Maintainer: robertfoster
# Contributor: kehon

pkgname=traccar-bin
pkgver=4.6
pkgrel=1
pkgdesc="Open source GPS tracking system"
arch=('i686' 'x86_64')
url="http://www.traccar.org/"
license=('APACHE')
depends=(java-runtime)
source=("https://github.com/tananaev/traccar/releases/download/v${pkgver}/${pkgname%%-*}-linux-64-$pkgver.zip")

package() {
	cd ${srcdir}
	./traccar.run --noexec --target $pkgdir/opt/traccar/
	install -m755 -d "${pkgdir}/usr/lib/systemd/system"
	mv "${pkgdir}/opt/traccar/traccar.service" "${pkgdir}/usr/lib/systemd/system/"
	chmod 755 -R $pkgdir/opt
}

md5sums=('c1a640673052a99aff4956b90a23ab47')
