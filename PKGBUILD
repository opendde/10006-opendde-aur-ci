# Maintainer: lily wilson <lily@lily.ml>

_pkgname=openssl
pkgname=$_pkgname-pre
_ver=1.1.0-pre3
# use a pacman compatible version scheme
pkgver=${_ver/-/.}
#pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
#pkgver=$_ver
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security, including alpha and beta versions'
arch=('i686' 'x86_64')
url='https://www.openssl.org'
license=('custom:BSD')
depends=('zlib' 'perl' 'openssl102')
optdepends=('ca-certificates')
options=('!makeflags')
backup=('etc/ssl/openssl.cnf')
source=("https://www.openssl.org/source/${_pkgname}-${_ver}.tar.gz"
        "https://www.openssl.org/source/${_pkgname}-${_ver}.tar.gz.asc"
        'no-rpath.patch'
        'ca-dir.patch')
md5sums=('bd5c39bf81a5350a58692a9cb88c4bea'
         'SKIP'
         'dc78d3d06baffc16217519242ce92478'
         '381ecca640ea989c8deb57e8a2505c8c')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491')

prepare() {
	cd $srcdir/$_pkgname-$_ver

	# remove rpath: http://bugs.archlinux.org/task/14367
	patch -p0 -i $srcdir/no-rpath.patch
	# set ca dir to /etc/ssl by default
	patch -p0 -i $srcdir/ca-dir.patch
}

build() {
	cd $srcdir/$_pkgname-$_ver

	if [ "${CARCH}" == 'x86_64' ]; then
		openssltarget='linux-x86_64'
		optflags='enable-ec_nistp_64_gcc_128'
	elif [ "${CARCH}" == 'i686' ]; then
		openssltarget='linux-elf'
		optflags=''
	fi

	# mark stack as non-executable: http://bugs.archlinux.org/task/12434
	./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib \
		shared zlib ${optflags} \
		"${openssltarget}" \
		"-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

	make depend
	make
}

check() {
	cd $srcdir/$_pkgname-$_ver

	# make test now fails because CA.sh is gone and the patch
	# changes CA.pl.in, but not CA.pl. Will try to fix later.

	# the test fails due to missing write permissions in /etc/ssl
	# revert this patch for make test
	#patch -p0 -R -i $srcdir/ca-dir.patch
	#make test
	#patch -p0 -i $srcdir/ca-dir.patch
}

package() {
	cd $srcdir/$_pkgname-$_ver
	make INSTALL_PREFIX=$pkgdir MANDIR=/usr/share/man MANSUFFIX=ssl install
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
