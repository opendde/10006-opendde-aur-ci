# Maintainer: emersion <contact emersion fr>
pkgname=drm_info-git
_pkgname=drm_info
pkgver=1.1.0.r45.g6bb0405046ed
pkgrel=1
license=('MIT')
pkgdesc='Small utility to dump info about DRM devices'
makedepends=("meson" "git")
depends=("libdrm" "json-c")
arch=("x86_64")
url='https://github.com/ascent12/drm_info'
source=("${_pkgname}::git+https://github.com/ascent12/drm_info.git")
sha1sums=('SKIP')
provides=('drm_info')
conflicts=('drm_info')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"

	meson --prefix=/usr . build
	ninja -C build
}

package() {
	cd "${srcdir}/${_pkgname}"

	DESTDIR="$pkgdir/" ninja -C build install
}
