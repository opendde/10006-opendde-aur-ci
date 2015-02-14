# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: TuxSpirit<tuxspirit@archlinux.fr>  2007/11/17 21:22:36 UTC
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgbase=p7zip-natspec
pkgname=p7zip-natspec
_pkgname=p7zip
pkgver=9.38
pkgrel=1
pkgdesc='Command-line version of the 7zip compressed file archiver, using libnatspec patch from ubuntu zip-i18n PPA (https://launchpad.net/~frol/+archive/zip-i18n).'
url='http://p7zip.sourceforge.net/'
license=('GPL' 'custom')
arch=('i686' 'x86_64')
depends=('gcc-libs' 'bash' 'libnatspec')
optdepends=('wxgtk: GUI'
            'desktop-file-utils: desktop entries')
makedepends=('yasm' 'nasm' 'wxgtk')
conflicts=('p7zip')
provides=('p7zip')
source=("http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}/${pkgver}/${_pkgname}_${pkgver}_src_all.tar.bz2"
        'osversion.patch'
        '7zFM.desktop'
        'natspec.patch')
sha1sums=('ae7f483799ca463aa5f0a856491a3410907348ed'
          '8c086db1c7be0d52d2ac971f44adbdccf6dd82de'
          'f2c370d6f1b286b7ce9a2804e22541b755616a40'
          'd4a39ae62cfa031782fd3c8c25f5e9c45ae64eec')

options=('!makeflags')
install=install

prepare() {
	cd "${srcdir}/${_pkgname}_${pkgver}"
	patch -p1 < ../natspec.patch
	[[ $CARCH = x86_64 ]] &&
	cp makefile.linux_amd64_asm makefile.machine ||
	cp makefile.linux_x86_asm_gcc_4.X makefile.machine

	patch -p1 -i ../osversion.patch
	sed -i 's/x86_64-linux-gnu//g' CPP/7zip/*/*/*.depend

	rm GUI/kde4/p7zip_compress.desktop # FS#43766
}

build() {
	cd "${srcdir}/${_pkgname}_${pkgver}"
	make all4 OPTFLAGS="${CXXFLAGS}"
}

package() {
	cd "${srcdir}/${_pkgname}_${pkgver}"
	make install \
		DEST_DIR="${pkgdir}" \
		DEST_HOME="/usr" \
		DEST_MAN="/usr/share/man"

	# Doc and licenses
	cp -a DOC/* "${pkgdir}"/usr/share/doc/p7zip
	install -d "${pkgdir}"/usr/share/licenses/p7zip
	ln -s -t "${pkgdir}"/usr/share/licenses/p7zip \
		/usr/share/doc/p7zip/License.txt \
		/usr/share/doc/p7zip/unRarLicense.txt

	# Integration with stuff...
	install -Dm644 GUI/p7zip_32.png "${pkgdir}"/usr/share/icons/hicolor/32x32/apps/p7zip.png
	install -d "${pkgdir}"/usr/share/{applications,kde4/services/ServiceMenus}
	cp GUI/kde4/* "${pkgdir}"/usr/share/kde4/services/ServiceMenus/
	cp ../7zFM.desktop "${pkgdir}"/usr/share/applications/
	ln -s 7zCon.sfx "${pkgdir}"/usr/lib/p7zip/7z.sfx

	find GUI/help -type d -exec chmod 755 {} \;
	cp -r GUI/help "${pkgdir}"/usr/lib/p7zip/

	chmod -R u+w,o+r "${pkgdir}/usr"
}
