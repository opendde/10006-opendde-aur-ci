# Maintainer: Alex Taber <aft dot pokemon at gmail dot com>

pkgname=teamviewer
pkgver=13.1.3026
pkgrel=9
pkgdesc='All-In-One Software for Remote Support and Online Meetings'
arch=('i686' 'x86_64' 'armv7h')
url='http://www.teamviewer.com'
license=('custom')
options=('!strip')
provides=('teamviewer')
conflicts=('teamviewer-beta')
depends_x86_64=(
	'hicolor-icon-theme'
	'qt5-webkit'
	'qt5-x11extras'
	'lib32-libxtst'
	'lib32-libpng12'
	'lib32-libjpeg6-turbo'
	'lib32-libxinerama'
	'lib32-qt4')
depends_i686=(
	'hicolor-icon-theme'
	'qt5-webkit'
	'qt5-x11extras'
	'libxtst'
	'libpng12'
	'libjpeg6-turbo'
	'libxinerama'
	'qt4')
depends_armv7h=(${depends_i686[*]})
install=teamviewer.install
source_x86_64=("https://dl.tvcdn.de/download/linux/version_${pkgver%%.*}x/teamviewer_${pkgver}_amd64.deb")
source_i686=("https://dl.tvcdn.de/download/linux/version_${pkgver%%.*}x/teamviewer_${pkgver}_i386.deb")
#source_armv7h=("https://dl.tvcdn.de/download/linux/version_${pkgver%%.*}x/teamviewer_${pkgver}_armhf.deb")
source_armv7h=("https://dl.tvcdn.de/download/linux/version_${pkgver%%.*}x/teamviewer-host_13.1.1548_armhf.deb")
sha256sums_i686=('46f1b697a113f304ff8e5792f9893319c0de6b802355e7e5fdf7dba6f4b415c8')
sha256sums_x86_64=('33eacc8ebeaf34aea5fa932e3d80553f358629ad454740f05aafba267b50ea93')
sha256sums_armv7h=('d887c4faae3b85542e982dbb8add5271fdeb1da98c669b230d82dd56e04724bf')

prepare() {
	warning "If the install fails, you need to uninstall previous major version of Teamviewer"
	[ -d data ] && rm -rf data
	mkdir data
	cd data
	for datatar in ../data.tar.*; do
		msg2 "Unpacking $datatar"
		tar -xf $datatar
	done
}

package() {
	# Install
	warning "If the install fails, you need to uninstall previous major version of Teamviewer"
	cp -dr --no-preserve=ownership ./data/{etc,opt,usr,var} "${pkgdir}"/

	# Additional files
	rm "${pkgdir}"/opt/teamviewer/tv_bin/xdg-utils/xdg-email
	rm -rf "${pkgdir}"/etc/apt
	install -D -m0644 "${pkgdir}"/opt/teamviewer/tv_bin/script/teamviewerd.service \
		"${pkgdir}"/usr/lib/systemd/system/teamviewerd.service
	install -d -m0755 "${pkgdir}"/usr/{share/applications,share/licenses/teamviewer}
	ln -s /opt/teamviewer/License.txt \
		"${pkgdir}"/usr/share/licenses/teamviewer/LICENSE
}
