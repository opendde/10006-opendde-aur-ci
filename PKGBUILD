# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Julio González <juliolokoo at gmail dot com>
# Contributor: Jose Valecillos <valecillosjg (at) gmail (dot) com>
# Contributor: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >
# Contributor: alegotta <algottardi at disroot dot org>
# Contributor: oguzkagan <me@oguzkaganeren.com.tr>

pkgname='xampp'
pkgver='7.4.10'
_uppkgrel=0
pkgrel=9
pkgdesc='A stand-alone LAMPP distribution'
url='https://www.apachefriends.org/'
license=('GPL')
# This PKGBUILD is configured for both 32-bit and 64-bit architectures, but
# currently no binaries for 32-bit architectures are distributed. The last
# versions where these are available are 5.6.23-0 and 7.0.8-0.
arch=('x86_64')
depends=('net-tools')
optdepends=('polkit: for launching XAMPP Manager and Control Panel from menu'
            'pygtk: for using XAMPP Control Panel')
makedepends=('sdx' 'tclkit' 'rsync')
source=('bitrock-unpacker.tcl'
	'org.apachefriends.xampp.policy'
	'properties.ini.in'
	'xampp.service.in'
	'xampp.svg'
	'xampp.sysusers'
	'xampp.tmpfiles.in'
	'xampp-control-panel.in'
	'xampp-control-panel.desktop'
	'xampp-manager.in'
	'xampp-manager.desktop')
_build32name='linux'
_build64name='linux-x64'
source_i686=("${url}/${pkgname}-files/${pkgver}/${pkgname}-${_build32name}-${pkgver}-${_uppkgrel}-installer.run")
source_x86_64=("${url}/${pkgname}-files/${pkgver}/${pkgname}-${_build64name}-${pkgver}-${_uppkgrel}-installer.run")
options=('staticlibs' 'libtool' '!strip')
install='xampp.install'
sha256sums=('3f262ef4b3e752992667ab482cbf364e3b9e6f95b4b6fb12a1ce6fa7a88f124e'
            'ce87d4c7d227a94ca8252cde1f6dca7e1691a213779c8e6485ac1e2bd4cc63ba'
            'ae9dc07ce5cd57987cdd03af5fff415be471d60fe71563b900c9f4bd9cd71e04'
            'f3165bfb3b5fac6e840b423b62a0aee4ab7c60d1955b7f5f1bc58e33f5174f6a'
            'a3fc7f2b570af9d05435f2f9a0b8d7d9b30ee1dbeaea152f8e249ef5ef0461c9'
            '37e24dacf3a52037d0cddb11d979917f81741bf399ec5fa5e847359909b7bc25'
            'e8e0ddeb7201b7ee6e7e6838b3b37cdca03f0f3e8ba1b9e05fbd657c18efb99e'
            '94976a27b06192c5cc8fea64058cda164751be137d853c863238e965db51db40'
            'b03a927a8bc13de2f8ad728607f4b0841e738246ee858a0c202fe10dc8ed26dd'
            '0cbfb01a844e48ac64a256b1639eebbe6a36c60f712b0c8794eef8722f436762'
            '9d0cc215118fdb3aae00cbd64e284bcbbda28273f0b82ee2a3bb0aa725336ffd')
sha256sums_x86_64=('dc216c55f99b04a9e1a458c7c881127fdbf30963710a32f6d5228a09c3cde722')
sha256sums_i686=('SKIP')


_platform="$(test "${CARCH}" = 'x86_64' && echo "${_build64name}" || echo "${_build32name}")"
_pkgstring="${pkgname}-${_platform}-${pkgver}-${_uppkgrel}"

# Make a string suitable for `sed`, by escaping []/&$.*^ - syntax: `_sed_escape STRING`
_sed_escape() {
	echo "${1}" | sed 's/[]\/&.*$^[]/\\&/g'
}

prepare() {

	cd "${srcdir}"

	msg 'Extracting package...'
	chmod +x "${srcdir}/bitrock-unpacker.tcl"
	rm -rf "${srcdir}/${_pkgstring}"
        "${srcdir}/bitrock-unpacker.tcl" "${srcdir}/${_pkgstring}-installer.run" \
		"${srcdir}/${_pkgstring}"

}

package() {

	# This is a constant, you should not change it - this path is hard coded in some of the files
	local _xamppdir='/opt/lampp'

	local _sed_subst="
		s/@PACKAGE_VERSION@/$(_sed_escape "${pkgver}-${_uppkgrel}")/g
		s/@PACKAGE_PLATFORM@/$(_sed_escape "${_platform}")/g
		s/@PACKAGE_INSTALLDIR@/$(_sed_escape "${_xamppdir}")/g
	"

	cd "${srcdir}"

	# Package tree
	msg 'Recreating package tree...'
	install -dm755 "${pkgdir}${_xamppdir}"
	rsync -azq --remove-source-files \
		"${srcdir}/${_pkgstring}/xampp_core_files/xampp_core_folder"/. \
		"${srcdir}/${_pkgstring}/xampp_developer_files/xampp_developer_folder"/. \
		"${srcdir}/${_pkgstring}/native_apache_adapter/apache_xampp_linux"/. \
		"${srcdir}/${_pkgstring}/native_proftpd_adapter/proftpd_xampp_linux"/. \
		"${srcdir}/${_pkgstring}/native_mysql_adapter/mysql_xampp_linux"/. \
		"${srcdir}/${_pkgstring}/manager/binary"/. \
		"${srcdir}/${_pkgstring}/common_native_adapter/common"/. \
		"${pkgdir}${_xamppdir}"

	rm "${pkgdir}${_xamppdir}/ctlscript.bat" "${pkgdir}${_xamppdir}/killprocess.bat"

	# Root location in all files
	msg 'Setting root location globally (it might take a few minutes)...'
	find "${pkgdir}${_xamppdir}/" -type f \
		-exec sed -i "s/@@BITNAMI_XAMPP_ROOT@@\|@@BITROCK_INSTALLDIR@@/$(_sed_escape "${_xamppdir}")/gI" '{}' \;

	# Temp folders
	install -dm777 "${pkgdir}${_xamppdir}/phpmyadmin/tmp"
	chmod 777 "${pkgdir}${_xamppdir}/temp"

	# Links and missing files
	sed "${_sed_subst}" "${srcdir}/properties.ini.in" > "${pkgdir}${_xamppdir}/properties.ini"
	echo -n "${pkgver}-${_uppkgrel}" > "${pkgdir}${_xamppdir}/lib/VERSION"
	ln -s "${_xamppdir}/xampp" "${pkgdir}${_xamppdir}/lampp"
	test -d "${pkgdir}${_xamppdir}/share/lampp" || \
		ln -sf "${_xamppdir}/share/xampp" "${pkgdir}${_xamppdir}/share/lampp"

	msg 'Copying executables and launcher...'

	# Licenses
	install -dm755 "${pkgdir}/usr/share/licenses"
	chmod -R a+rX,u+w "${pkgdir}${_xamppdir}/licenses"
	ln -s "${_xamppdir}/licenses" "${pkgdir}/usr/share/licenses/xampp"

	# Executables
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "${_xamppdir}/xampp" "${pkgdir}/usr/bin/xampp"
	sed "${_sed_subst}" "${srcdir}/xampp-manager.in" > "${pkgdir}/usr/bin/xampp-manager"
	sed "${_sed_subst}" "${srcdir}/xampp-control-panel.in" > "${pkgdir}/usr/bin/xampp-control-panel"
	chmod +x "${pkgdir}/usr/bin/xampp-control-panel" "${pkgdir}/usr/bin/xampp-manager"

	# Systemd files
	install -dm755 \
		"${pkgdir}/etc/systemd/system" \
		"${pkgdir}/usr/lib/sysusers.d" \
		"${pkgdir}/usr/lib/tmpfiles.d"

	sed "${_sed_subst}" "${srcdir}/xampp.service.in" > "${pkgdir}/etc/systemd/system/xampp.service"
	install -Dm644 "${srcdir}/xampp.sysusers" "${pkgdir}/usr/lib/sysusers.d/xampp.conf"
	sed "${_sed_subst}" "${srcdir}/xampp.tmpfiles.in" > "${pkgdir}/usr/lib/tmpfiles.d/xampp.conf"

	# Launchers and icons
	install -dm755 \
		"${pkgdir}/usr/share/pixmaps" \
		"${pkgdir}/usr/share/applications"

	install -Dm644 "${srcdir}/xampp.svg" "${pkgdir}/usr/share/pixmaps/xampp.svg"
	install -Dm644 "${srcdir}/xampp-manager.desktop" "${pkgdir}/usr/share/applications/xampp-manager.desktop"
	install -Dm644 "${srcdir}/xampp-control-panel.desktop" "${pkgdir}/usr/share/applications/xampp-control-panel.desktop"
	ln -s "${_xamppdir}" "${pkgdir}/usr/share/xampp"

	# Polkit files
	install -dm755 "${pkgdir}/usr/share/polkit-1/actions"
	install -Dm644 "${srcdir}/org.apachefriends.xampp.policy" \
		"${pkgdir}/usr/share/polkit-1/actions/org.apachefriends.xampp.policy"

}

