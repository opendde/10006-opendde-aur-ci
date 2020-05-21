# Maintainer: nalquas <nalquas.dev@gmail.com>

pkgname=vokey-git
pkgver=0.2.0.r0.g487319d
pkgrel=1
pkgdesc="Vokey is a voice-based hotkey application."
arch=('any')
url="https://github.com/nalquas/vokey"
license=('GPL3')
depends=('pocketsphinx' 'sphinxbase' 'libpulse' 'libx11' 'glibc' 'blas' 'lapack' 'libxtst' 'gcc-libs' 'qt5-base' 'alsa-utils' 'festival' 'festival-english')
makedepends=('git' 'nlohmann-json')
provides=('vokey')
conflicts=('vokey')
options=(!makeflags)
source=('git+https://github.com/nalquas/vokey')
md5sums=('SKIP')

_gitname='vokey'

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_gitname"
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="${pkgdir}" install
}
