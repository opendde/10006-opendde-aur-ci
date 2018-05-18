# $Id$
# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
# Contributor: Carl George < arch at cgtx dot us >

pkgname=gnome-shell-extension-dash-to-panel-git
pkgver=14.r0.g8906e51
pkgrel=1
pkgdesc='Extension for GNOME shell to combine the dash and main panel'
arch=(any)
_githubname=dash-to-panel
_githubowner=jderose9
url="https://github.com/${_githubowner}/${_githubname}"
license=(GPL2)
depends=('gnome-shell>=3.18')
makedepends=('git' 'gnome-common' 'intltool')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install='gnome-shell-extension.install'
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_githubname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_githubname}"
  make VERSION="$pkgver" _build
}

package() {
  cd "${srcdir}/${_githubname}"
  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
