# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
pkgname=gnome-shell-extension-proxy-switcher-git
pkgver=1.4.r1.gec79104
pkgrel=1
pkgdesc='Extension for GNOME shell to switch between the system proxy settings.'
arch=(any)
_githubname=proxy-switcher
_githubowner=tomflannaghan
url="https://github.com/${_githubowner}/${_githubname}"
license=(GPL2)
depends=('gnome-shell>=3.40')
makedepends=('git' 'python')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install='gnome-shell-extension.install'
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_githubname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_githubname}"
    sed -i 's|INSTALL_LOC=.*|INSTALL_LOC=$(DESTDIR)/usr/share/gnome-shell/extensions|g' \
        Makefile
}

build() {
    cd "${_githubname}"
    make build
}

package() {
    cd "${_githubname}"
    install -d "${pkgdir}/usr/share/gnome-shell/extensions"
    make DESTDIR="${pkgdir}" install
}
# vim:set ts=4 sw=4 et:
