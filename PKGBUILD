# Maintainer: Dustin Falgout <dustin@antergos.com>

pkgname=lightdm-webkit2-greeter
pkgver=2.1.6
pkgrel=1
pkgdesc="A webkit2 greeter for LightDM"
arch=('i686' 'x86_64')
url="https://github.com/antergos/lightdm-webkit2-greeter"
license=('GPL3')
source=("${pkgname}-${pkgver}.zip::https://github.com/antergos/${pkgname}/archive/${pkgver}.zip")
makedepends=('gnome-doc-utils' 'gobject-introspection' 'intltool' 'gnome-common' 'exo' 'git')
depends=('lightdm' 'webkit2gtk>=2.10.8' 'gtk3>=3.18')
provides=('lightdm-webkit-greeter' 'lightdm-webkit-theme-antergos')
conflicts=('lightdm-webkit-greeter' 'lightdm-webkit-theme-antergos')
replaces=('lightdm-webkit-greeter' 'lightdm-webkit-theme-antergos')
backup=("etc/lightdm/${pkgname}.conf")
md5sums=('29f653377cb59475cd478b650ed24aef')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./autogen.sh \
			--prefix=/usr \
			--sysconfdir=/etc \
			--libexecdir=/usr/lib/lightdm \
			--bindir=/usr/bin \
			--sbindir=/usr/bin
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install 
}
