# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgname=xtandem
pkgver=15.12.15.2
pkgrel=1
pkgdesc="Software that can match tandem mass spectra with peptide sequences, in a process known as protein identification."
arch=('x86_64')
url="http://www.thegpm.org/TANDEM/"
license=('custom')
depends=('expat' 'gcc-libs')
source=("ftp://ftp.thegpm.org/projects/tandem/source/tandem-linux-${pkgver//\./-}.zip"
        "xtandem.sh")
md5sums=('40058cd84fc3f56d671d32ff393f7aa3'
         'ddde2d73df3b72f30d5906fefaeece09')
package() {
	cd "tandem-linux-${pkgver//\./-}"
	install -Dt $pkgdir/usr/bin bin/*.exe
    install -m 644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/license.txt
    install -Dt $pkgdir/etc/profile.d ../xtandem.sh
}
