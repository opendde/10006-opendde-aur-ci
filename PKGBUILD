# Maintainer: drakkan <nicola dot murino at gmail dot com>
# Contributor: XZS <d dot f dot fischer at web dot de>
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Janne Haapsaari <haaja@iki.fi>
# Contributor: Christopher Krooß <didi2002 at web.de>

pkgname=gnome-shell-extension-dash-to-dock
_pkgname=dash-to-dock
pkgver=68+5+g6fba295
pkgrel=1
pkgdesc="Move the dash out of the overview transforming it in a dock"
arch=('any')
url="https://micheleg.github.io/dash-to-dock/"
license=('GPL')
depends=('gnome-shell')
makedepends=('intltool' 'gettext' 'git')
_commit=6fba29503d392c9a211b4b190e13a0653544f763
source=("git+https://github.com/micheleg/dash-to-dock.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/${_pkgname}
  git describe --tags | sed 's/^extensions\.gnome\.org-v//g' | sed 's/-/+/g'
}

build() {
  cd "${srcdir}"/${_pkgname}
  make
}

package() {
  cd "${srcdir}"/${_pkgname}
  make DESTDIR="${pkgdir}" VERSION="${pkgver}" install
}

# vim:set ts=2 sw=2 et:
