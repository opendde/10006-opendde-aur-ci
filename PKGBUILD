# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=syncthing-bin
_realname=syncthing
pkgver=0.14.9
pkgrel=1
pkgdesc="Open Source Continuous Replication / Cluster Synchronization Thing: binary."
url="http://syncthing.net/"
arch=('any')
license=('MPLv2')
provides=('syncthing=0.14.9')
conflicts=('syncthing')
install=${_realname}.install
source=( 'syncthing.1')
sha256sums=('fb59747ca16d1b19e3cad1c147dcabea14a30a5e4177b90712e6bb837c107912')
 

case "$CARCH" in
	arm*) _pkgarch="arm"
		sha256sums+=('04817645a735939b4f221acd457f7a62b224634e6306b2b7b9edcae9e0c5a33f')
		;;
	i686) _pkgarch="386"
		sha256sums+=('5201de7b382d2d72169a5fbfd20d836efcdd859554b711a7ce249294bb1e0c82')
		;;
	x86_64) _pkgarch="amd64"
		sha256sums+=('5e4a505e0683d319c0d38f34be3f2bb53c7c7b8c53a7f0b672381271c1fc8ef4')
		;;
esac

source+=("https://github.com/syncthing/${_realname}/releases/download/v${pkgver}/${_realname}-linux-${_pkgarch}-v${pkgver}.tar.gz")

package() {
    cd "${_realname}-linux-${_pkgarch}-v${pkgver}"
    install -D -m 755 ${_realname} "${pkgdir}/usr/bin/${_realname}"
    install -D -m 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_realname}/LICENSE"
    install -D -m 644 README.txt "${pkgdir}/usr/share/doc/${_realname}/README.md"
    install -D -m 644 "etc/linux-systemd/system/${_realname}@.service" \
                      "${pkgdir}/usr/lib/systemd/system/${_realname}@.service"
    install -D -m 644 "etc/linux-systemd/user/${_realname}.service" \
                      "${pkgdir}/usr/lib/systemd/user/${_realname}.service"
    install -D -m 644 "../${_realname}.1" "${pkgdir}/usr/share/man/man1/${_realname}.1"
}

# vim:set ts=2 sw=2 et:
