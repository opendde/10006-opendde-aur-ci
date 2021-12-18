# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=nxp-gui-guider
_pkgname="Gui-Guider"
pkgver=1.2.1
_pkg_file_name="${_pkgname}-Setup-${pkgver}-GA.deb"
pkgrel=1
pkgdesc="A user-friendly graphical user interface development tool from NXP that enables the rapid development of high quality displays with the open-source LVGL graphics library"
arch=('x86_64')
url="https://www.nxp.com/design/software/development-software/gui-guider:GUI-GUIDER"
license=('unknown')
options=('!strip')
makedepends=('tar'
             'xdg-user-dirs')

_DOWNLOADS_DIR=`xdg-user-dir DOWNLOAD`
if [ ! -f ${PWD}/${_pkg_file_name} ]; then
	if [ -f $_DOWNLOADS_DIR/${_pkg_file_name} ]; then
		ln -sfn $_DOWNLOADS_DIR/${_pkg_file_name} ${PWD}
	else
		msg2 ""
		msg2 "Package not found!"
		msg2 "The package can be downloaded here: ${url}"
		msg2 "Please remember to put a downloaded package ${_pkg_file_name} into the build directory ${PWD} or $_DOWNLOADS_DIR"
		msg2 ""
	fi
fi

source=("local://${_pkg_file_name}")
sha256sums=('94d0fa6021bb9cd41be35ae1a2af67715dfab41ad2123a57aa385300ef4cec74')

build() {
  cd ${srcdir}

  mkdir -p ${srcdir}/build

  tar -xf data.tar.xz -C ${srcdir}/build
}

package() {
  cp -a ${srcdir}/build/* ${pkgdir}/

  # soft link
  install -dm 755 ${pkgdir}/usr/bin
  ln -sf /opt/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
# vim: set sw=2 ts=2 et:
