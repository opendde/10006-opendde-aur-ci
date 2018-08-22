# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Konrad <konrad AT knauber DOT name>
# Contributor: Luka Perkov <archlinux <at> lukaperkov <dOt> net>
# Contributor: Fernando M <f <at> beford.net>
# Author: Wintershade <Wintershade AT google mail DOT com>

pkgname=rpm-org
pkgver=4.14.2
pkgrel=1
pkgdesc="RPM Package Manager - RPM.org fork, used in major RPM distros"
arch=('i686' 'x86_64')
url="http://www.rpm.org/"
license=('GPL2')
depends=('lua>=5.1' 'file' 'nss>=3.12' 'popt' 'elfutils' 'libarchive' 'libcap')
makedepends=('python2' 'python')
optdepends=('libdbus: systemd inhibit plugin')
conflicts=('rpm' 'rpmextract')
options=('!libtool')
provides=("rpm=${pkgver}" 'rpmextract=1.0-4')

_base_pkgver=${pkgver%.*}.x
_pkgver=$pkgver

#source=(https://github.com/rpm-software-management/rpm/releases/download/rpm-${pkgver}-release/rpm-${pkgver}.tar.bz2
source=(http://ftp.rpm.org/releases/rpm-$_base_pkgver/rpm-$pkgver.tar.bz2
	rpmextract.sh rpmlib-filesystem-check.patch bfdfix.patch)
sha1sums=('1ca664af796ab8d05ea3fccabe2b2e4767a97c74'
          '74849919207885ae024f1ab8ed68a76474d67ad7'
          '0c5fa516dde1f10211af896c729e4b00c313e12b'
          '456d4a2c9f71c2e3bfa5011800855a73a55aa5bc')

prepare() {
	cd ${srcdir}/rpm-${_pkgver}
	patch -p1 < ../rpmlib-filesystem-check.patch
	#patch -p1 < ../bfdfix.patch
}

build() {
	cd ${srcdir}/rpm-${_pkgver}

	./configure \
		--prefix=/usr  \
		--sysconfdir=/etc  \
		--localstatedir=/var \
		--enable-python \
		--with-external-db \
		--with-lua \
		--with-cap \
		CPPFLAGS="`pkg-config --cflags nss`" \
		PYTHON=python2
	make
}

package() {
	cd ${srcdir}/rpm-${_pkgver}
	make prefix=${pkgdir}/usr localstatedir=${pkgdir}/var install
	rmdir ${pkgdir}/var/tmp
	rmdir ${pkgdir}/var
	# rpmextract using bsdtar, needs libarchive
	install -m755 ${srcdir}/rpmextract.sh ${pkgdir}/usr/bin/

	# move rpm from /bin to /usr/bin
	rm ${pkgdir}/usr/bin/rpm{query,verify}
	cd ${pkgdir}/usr/bin
	ln -s rpm rpmquery
	ln -s rpm rpmverify

	# also install python 3 files
	# building with python 3 files as default doesn't seem to work
	cd ${srcdir}/rpm-${_pkgver}
	cd python
	python setup.py install --root="$pkgdir/" --optimize=1
}
