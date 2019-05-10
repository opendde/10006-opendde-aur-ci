# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributer: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Arnaud Durand <biginozNOSPAM_at_free.dot.fr>
# Contributor: Nuno Araujo <nuno.araujo at russo79.com>

pkgname=bleachbit-cli
_pkgname=bleachbit
pkgver=2.2
pkgrel=1
pkgdesc='Deletes unneeded files to free disk space and maintain privacy. CLI version/no GUI.'
provides=("bleachbit=${pkgver}")
arch=(any)
url='https://www.bleachbit.org/'
license=(GPL3)
makedepends=(python)
source=(https://download.bleachbit.org/$_pkgname-$pkgver.tar.bz2)
sha256sums=('0318cd1bc83655971c9ffd6bf27f4866bbe57381e92cfbcf8a2a6833075b49fa')

package() {
    cd $_pkgname-$pkgver

    make prefix=/usr DESTDIR="$pkgdir" PYTHON=python2 install
	
	  #	suggestion by Meow to force script to operate in cli mode
  	sed -i 's/if 1/if 0/' "$pkgdir"/usr/bin/bleachbit
  	rm -rf "$pkgdir"/usr/share/{applications,pixmaps}
}
