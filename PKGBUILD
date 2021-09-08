# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: redfish <redfish AT galactica DOT pw>
# Contributor: kertase <kertase AT gmail DOT com>
# Contributor: Sergej Pupykin <pupykin DOT s+arch AT gmail.com>
# Contributor: wahnby <wahnby AT yahoo DOT fr>

_appname='gnunet'
pkgname="${_appname}-git"
pkgver='0.15.4.alpha.0.r29825.3da9cbd62'
pkgrel=2
pkgdesc='A framework for secure peer-to-peer networking'
arch=('i686' 'x86_64')
url="http://${_appname}.org"
license=('AGPL')
conflicts=("${_appname}" "${_appname}-bin")
provides=("${_appname}")
depends=('bash' 'brotli' 'gettext' 'gnurl' 'gnutls' 'jansson' 'libextractor'
         'libgcrypt' 'libidn2' 'libmicrohttpd' 'libsodium' 'libtool'
         'libunistring' 'nss' 'openssl' 'sqlite' 'which' 'zlib')
makedepends=('bluez-libs' 'gettext' 'git' 'libpulse' 'libtool' 'opus'
             'pkgconfig' 'python')
optdepends=('bluez: for bluetooth transport'
            'libgabe: for Attribute-Based Encryption'
	    'libogg: for conversation service'
            'libpabc: for re:claimID zero-knowledge privacy credentials'
	    'libpulse: for conversation service'
            'miniupnpc: for NAT uPnP support'
            'mysql: for an alternative to sqlite in the database plugin'
	    'opus: for conversation service'
            'pbc: for Attribute-Based Encryption'
            'postgresql: for an alternative to sqlite in the database plugin'
            'python: for test suite'
            'texi2mdoc: for automatic mdoc generation'
            'texlive-core: for generating GNS business cards via gnunet-bcd'
            'zbar: for reading/writing GNUnet URIs from/to QR codes using gnunet-qr')
backup=("etc/${_appname}.conf")
source=("git+https://${_appname}.org/git/${_appname}.git"
        "${_appname}-system.service"
        "${_appname}-user.service"
        "${_appname}.sysusers"
        "${_appname}.tmpfiles")
sha256sums=('SKIP'
            '163818b89beddcaf78937daba5bdf0ae060b2975de0731aa13d1ccdd813cf262'
            '60caee20b53bcc69522556b35ac3d35d89e28c49b9a22a2ed5121df4a2c33be5'
            '66299dbbdd0219d2f5f0520e69fc094f38f789724d973c2f63a421257ea4f755'
            'e89546c9116cb741b27e7edebc358ccf6d5127a4db8b517044f9fc6258dd5387')

pkgver() {

	cd "${_appname}" > /dev/null 2>&1

	printf "'%s.r%s.%s'" \
		"$(echo 'changequote([,])define([AC_INIT],[patsubst([[$2]],[-],[.])])[]'"$(cat 'configure.ac' | tr '\n' ' ' | grep -o 'AC_INIT([^)]\+)')" | m4)" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"

}

prepare() {

	cd "${srcdir}/${_appname}"

	export GNUNET_PREFIX='/usr/lib'
	./bootstrap

}

build() {

	cd "${srcdir}/${_appname}"

	./configure --prefix='/usr' --enable-experimental
	make
	make -C contrib

}

package() {

	cd "${srcdir}/${_appname}"

	make DESTDIR="${pkgdir}" install
	make DESTDIR="${pkgdir}" -C contrib install

	install -dm755 "${pkgdir}/usr/lib/systemd/system"
	install -Dm644 "${srcdir}/${_appname}-system.service" \
		"${pkgdir}/usr/lib/systemd/system/${_appname}.service"

	install -dm755 "${pkgdir}/usr/lib/systemd/user"
	install -Dm644 "${srcdir}/${_appname}-user.service" \
		"${pkgdir}/usr/lib/systemd/user/${_appname}.service"

	install -dm755 "${pkgdir}/usr/lib/sysusers.d"
	install -Dm644 "${srcdir}/${_appname}.sysusers" \
		"${pkgdir}/usr/lib/sysusers.d/${_appname}.conf"

	install -dm755 "${pkgdir}/usr/lib/tmpfiles.d"
	install -Dm644 "${srcdir}/${_appname}.tmpfiles" \
		"${pkgdir}/usr/lib/tmpfiles.d/${_appname}.conf"

	# Automatically generate a configuration file using the content of
	# `/usr/share/gnunet/config.d/` as model; in this way we can ensure
	# that this configuration file is the one backed up with each update,
	# while `/usr/share/gnunet/config.d/` is kept as immutable default
	# configuration.

	install -dm755 "${pkgdir}/etc"

	{
		echo "# /etc/${_appname}.conf"
		(cd "${pkgdir}" > /dev/null 2>&1 && find "usr/share/${_appname}/config.d" -type f -name '*.conf' \
			-printf '\n\n# For the default values of the the following lines please refer to\n# /%p\n\n' \
			-exec cat '{}' ';')
	} > "${pkgdir}/etc/${_appname}.conf"

}

