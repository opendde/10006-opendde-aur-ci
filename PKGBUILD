pkgname=bdf2psf
pkgdesc='Debian utility to convert BDF font files to PSF format.'
pkgver=1.148
pkgrel=1
arch=('any')
license=('GPL2+')
url='https://packages.debian.org/sid/bdf2psf'
source=("ftp://ftp.debian.org/debian/pool/main/c/console-setup/bdf2psf_${pkgver}_all.deb")
sha1sums=('fbcaf728f395773b53b477408a9e01a695158823')
depends=('perl')

build() {
	cd "$srcdir"
	tar -xf data.tar.xz
	sed -i '44s/if (/if (\$\#ARGV \< 0 \|\| /' usr/bin/bdf2psf
}

package() {
	cd "$srcdir"
	cp -r usr "$pkgdir"
}
