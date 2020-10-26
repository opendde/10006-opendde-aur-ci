# Maintainer: José Miguel Sarasola <jmsaraur@gmail.com>

_pkgname='superproductivity'
pkgname="${_pkgname}-bin"
pkgver=6.0.1
pkgrel=1
pkgdesc="ToDo List / Time Tracker / Personal Jira Task Manager"
arch=('x86_64')
url="http://super-productivity.com/"
license=('MIT')
depends=('gtk3' 'nss')
provides=("${_pkgname}")
conflicts=("${_pkgname}"
		   "${_pkgname}-git")
source=("https://github.com/johannesjo/super-productivity/releases/download/v${pkgver}/superProductivity_${pkgver}_amd64.deb")
md5sums=("59ca05a904289a9bb7bd32d82b8ee914")

package() {
	tar -xvf data.tar.xz -C "${pkgdir}"
	rm -rf "${pkgdir}/usr/share/doc"
    install -d "${pkgdir}/usr/bin"
	ln -sf "/opt/superProductivity/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${pkgdir}/opt/superProductivity/"{'LICENSE.electron.txt','LICENSES.chromium.html'}
}
