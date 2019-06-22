# Maintainer: Giuseppe Sellaroli <g.sellaroli  at  yahoo  dot  it>
pkgname=input-wacom-dkms
_pkgname=input-wacom
pkgver=0.43.0
pkgrel=1
pkgdesc="Latest Kernel modules form Wacom tablets (DKMS). Useful if your wacom tablet is not supported upstream yet."
arch=('i686' 'x86_64')
url="https://github.com/linuxwacom/input-wacom/wiki/Installing-input-wacom-from-source"
license=('GPL2')
depends=('dkms')
optdepends=('xf86-input-wacom: for actually using a Wacom tablet')
install=$pkgname.install
source=("https://github.com/linuxwacom/input-wacom/releases/download/$_pkgname-$pkgver/$_pkgname-$pkgver.tar.bz2"
	"dkms.conf"
	"blacklist-input-wacom-dkms.conf"
	"move-modules")
noextract=()
md5sums=('c950180c19b2c467fc4a9128f8e8577e'
         '9622a13aa1f4c93edabc50b04c82260c'
         'da99119208e69b9a611b1809e1f241f8'
         '8a851dede08da29c2810fb58e8b69910')
package() {      
 
	installdir="$pkgdir/usr/src/$_pkgname-$pkgver"
       
        install -dm755 "$installdir"
        install -m644 "$srcdir/dkms.conf" "$installdir"
        install -m644 "$srcdir/move-modules" "$installdir"
        
        install -dm755 "$pkgdir/etc/modprobe.d"
        install -m644 "$srcdir/blacklist-input-wacom-dkms.conf" "$pkgdir/etc/modprobe.d"
       
        cd "${srcdir}/${_pkgname}-${pkgver}/"
       
        for d in `find . -type d`
        do
                install -dm755  "$installdir/$d"
        done
       
        for f in `find . -type f`
        do
                install -m644 "${srcdir}/${_pkgname}-${pkgver}/$f" "$installdir/$f"
        done
        chmod +x "$installdir/configure"
        chmod +x "$installdir/move-modules"
}
