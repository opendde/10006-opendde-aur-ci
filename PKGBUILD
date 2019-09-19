# Generated by debtap
# Maintainer: Callum Denby <me@callumdenby.com>
# Contributor: Callum Denby <me@callumdenby.com>
pkgname=aws-session-manager-plugin
pkgver=1.1.31.0
pkgrel=2
pkgdesc="AWS Session Manager Plugin for aws-cli."
arch=('i686' 'x86_64')
url="https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html"
license=('custom')
depends=('aws-cli')
backup=('etc/init/session-manager-plugin.conf' 'usr/lib/systemd/system/session-manager-plugin.service' 'usr/sessionmanagerplugin/LICENSE' 'usr/sessionmanagerplugin/seelog.xml' 'usr/sessionmanagerplugin/VERSION')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_i686=(https://s3.amazonaws.com/session-manager-downloads/plugin/${pkgver}/ubuntu_32bit/session-manager-plugin.deb)
source_x86_64=(https://s3.amazonaws.com/session-manager-downloads/plugin/${pkgver}/ubuntu_64bit/session-manager-plugin.deb)
sha512sums_i686=('9ff1895cd29592ee8c75d4f53af04b76e075387b2fca33bfd787b9a71880ed6a1091d34fe29c4af9f450f96856eb9fddbf366313ecda5185cc8a52a822b9bc93')
sha512sums_x86_64=('b24dc8ebaa21689d4d2af2084a774a8b2037111438352cca065a0ac8140e4fe3b98eaf9dfde7f304d51aea19af93de0a9acdf400c684838720876827fb92eaf7')

package(){

	# Extract package data
	tar xzf data.tar.gz -C "${pkgdir}"

	# Fix directories structure differencies
	cd "${pkgdir}"

	mkdir -p usr/lib 2> /dev/null; mv lib/* usr/lib; rm -rf lib

	rm -fr etc/init/

	sed -i 's/usr\/local/usr/' usr/lib/systemd/system/session-manager-plugin.service

	mv usr/local/* usr; rm -rf usr/local

	cd ..

}
