# Maintainer: Tom Kuther <archlinux@kuther.net>
# Maintainer: kevku <kevku@gmx.com>
# Contributor: Cedric Sougne <cedric@sougne.name>
# Contributor: Tom < reztho at archlinux dot us >
pkgname=java-jce_ustrength
pkgver=8
pkgrel=2
pkgdesc="Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files 8"
arch=('any')
url="http://www.oracle.com/technetwork/java/javase/downloads/jce8-download-2133166.html"
license=('custom')
install=${pkgname}.install
depends=('java-runtime>=8')
source=('http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip' 'install_java_jce_ustrength')
DLAGENTS=('http::/usr/bin/curl -LC - -b oraclelicense=a -O')
sha256sums=('f3020a3922efd6626c2fff45695d527f34a8020e938a49292561f18ad1320b59'
            '3c7cc3b3aa0d748ce540ef4b679a1e01e3609144d3ca37ec9885d05d44d4c467')

package() {
	cd "$srcdir/UnlimitedJCEPolicyJDK8"
	# Fixed place for the jce_policy files
	install -Dm644 US_export_policy.jar "${pkgdir}/usr/share/java/java-jce_ustrength/US_export_policy.jar"
	install -Dm644 local_policy.jar "${pkgdir}/usr/share/java/java-jce_ustrength/local_policy.jar"
	
	# Installing the script
	install -Dm755 "${srcdir}/install_java_jce_ustrength" "${pkgdir}/usr/bin/install_java_jce_ustrength"

	# The documentation
	install -Dm644 README.txt "${pkgdir}/usr/share/doc/java-jce_ustrength/README.txt"
}

