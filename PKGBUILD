# Contributor: Adam Nielsen <malvineous@shikadi.net>
# Contributor: Vitaliy Berdinskikh <skipper13@archlinux.org.ua>
# Contributor: Andrea Agosti <cifvts@gmail.com>
# Contributor: Viliam Pucik <viliam.pucik@gmail.com>
# Maintainer: Adam Nielsen <malvineous@shikadi.net>

_pkgname=instantclient-jdbc
pkgname=oracle-${_pkgname}
pkgver=18.3.0.0.0
pkgrel=1
pkgdesc="Additional support for XA, Internationalization, and RowSet operations under JDBC"
arch=('i686' 'x86_64')
url="http://www.oracle.com/technetwork/database/features/instant-client/"
license=('custom:OTN')
depends=(oracle-instantclient-basic=$pkgver)
replaces=('instantclient-jdbc')
options=(!strip)

# Fail if retrieval is attempted of any of the manual:// URLs
DLAGENTS+=('manual::/usr/bin/false');

# These are the only files we want to include in the source package
source=(LICENSE)
md5sums=('2d62e22e4f2d7e6d220fafde0f692a7d')
sha256sums=('f904a30b07ddf7806a33620f93b94c3d315154d26a371ece48695bb3555064a2')

# Add the main file, depending on which architecture we're building for
case "$CARCH" in
	i686)
		source[1]="manual://${_pkgname}-linux-${pkgver}dbru.zip"
		md5sums[1]='5ae0e414506ffc00d6a1996f0b37736b'
		sha256sums[1]='2da44a8ce769b6d66c921f00181d4223d9a0701743756a5a8e58a880c0a8a537'
		;;
	x86_64)
		source[1]="manual://${_pkgname}-linux.x64-${pkgver}dbru.zip"
		md5sums[1]='5034da506725419c24716fbda0c67612'
		sha256sums[1]='4be32ef7db118aed2dab046b2c4338f6abb517cb575acf7032e02ec7d531d689'
		;;
esac

msg "Warning: This software cannot be downloaded automatically."
plain "You will need to sign up for an Oracle account and download the software from"
plain "Oracle directly.  Place the downloaded file in the same directory as the"
plain "PKGBUILD and re-run makepkg."
plain ""
plain "The source .zip files can be downloaded from:"
plain ""
plain "i686   - http://www.oracle.com/technetwork/topics/linuxsoft-082809.html"
plain "x86_64 - http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html"
plain ""
plain "Alternatively, unofficial prebuilt Arch packages are available by adding the"
plain "following lines to /etc/pacman.conf, if you agree to the Oracle licence[1]:"
plain ""
plain "  [oracle]"
plain "  SigLevel = Optional TrustAll"
plain '  Server = http://linux.shikadi.net/arch/$repo/$arch/'
plain ""
plain "Then run 'pacman -Sys oracle' to see available packages."
plain ""
plain "[1]: http://www.oracle.com/technetwork/licenses/instant-client-lic-152016.html"
plain ""

package() {
	local basedir="$srcdir/instantclient_18_3"
	install -d "$pkgdir/usr/lib"
	install -m 755 -t "$pkgdir/usr/lib" "$basedir/"*.so
	install -m 644 -t "$pkgdir/usr/lib" "$basedir/"*.jar
}
