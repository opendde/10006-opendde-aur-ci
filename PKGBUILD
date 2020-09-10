# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Chris Cromer <chris@cromer.cl>
# Contributor: artoo <artoo@manjaro.org>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Ivailo Monev <xakepa10@gmail.com>

_udev_ver=243

pkgbase=eudev
pkgname=( 'eudev' 'libeudev')
pkgver=3.2.9
pkgrel=1
arch=('x86_64')
url="https://github.com/gentoo/eudev"
license=('GPL')
makedepends=('gobject-introspection' 'gperf' 'gtk-doc' 'intltool' 'kmod')
options=('!libtool' '!staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gentoo/eudev/archive/v${pkgver}.tar.gz"
	'initcpio_hooks'
	'initcpio_install'
	'udev-hwdb.hook')
sha256sums=('7d281276b480da3935d1acb239748c2c9db01a8043aad7e918ce57a223d8cd24'
            '892ce43218e0a458981bbce451252c8987dc398e60b8de288e7542b8f2409c13'
            '77dd1fd318b4456409aceb077f060b87944defb07cf39d29ad1968dc6f361875'
            '846e9ddbb95c8394ba7efe75107cc1308426921bc042f5d6b48fa4c2dcbac151')

prepare(){
	cd "${srcdir}/${pkgbase}-${pkgver}"
	sed -e 's/GROUP="dialout"/GROUP="uucp"/' \
		-e 's/GROUP="tape"/GROUP="storage"/' \
		-e 's/GROUP="cdrom"/GROUP="optical"/' \
		-i rules/*.rules
}

groups=('base' 'base-openrc')

build() {
	cd "${srcdir}/${pkgbase}-${pkgver}"
	./autogen.sh
	./configure \
		--prefix=/usr \
		--with-rootprefix=/usr \
		--sysconfdir=/etc \
		--libdir=/usr/lib \
		--sbindir=/usr/bin \
		--enable-introspection \
		--enable-kmod \
		--enable-manpages \
		--enable-split-usr

	make
}

package_eudev() {
	pkgdesc="The userspace dev tools (udev) forked by Gentoo"
	provides=("udev=${_udev_ver}")
	depends=("libeudev" 'kbd' 'kmod' 'hwids' 'util-linux')
	backup=('etc/udev/udev.conf')


	cd "${srcdir}/${pkgbase}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	rm -rv "$pkgdir"/usr/lib/pkgconfig
	rm -v "$pkgdir"/usr/include/libudev.h
	rm -v "$pkgdir"/usr/lib/libudev*.{so*,a}

	install -Dm644 "${srcdir}/initcpio_hooks" "${pkgdir}/usr/lib/initcpio/hooks/udev"
	install -Dm644 "${srcdir}/initcpio_install" "${pkgdir}/usr/lib/initcpio/install/udev"
	install -Dm644 "$srcdir/udev-hwdb.hook" "$pkgdir/usr/share/libalpm/hooks/udev-hwdb.hook"
}

package_libeudev() {
	pkgdesc="eudev client libraries"
	depends=('glib2' 'glibc')
	conflicts=('libudev.so')
	provides=("libudev=${_udev_ver}" 'libudev.so')

	cd "${srcdir}/${pkgbase}-${pkgver}"
	make -C src/libudev DESTDIR="$pkgdir" install
}
