# Maintainer: Yurii <yu.hrysh@posteo.net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Det <nimetonmaili@gmail.com>
# Contributor: Godane aka Christopher Rogers <slaxemulator@gmail.com>
# Contributor: Michai Coman <mihai@m1x.ro>

pkgname=unetbootin-qt5-git
_pkgname=unetbootin
pkgver=655.r4.g9cc0841
pkgrel=1
arch=('x86_64')
license=('GPL')
pkgdesc='Create bootable Live USB drives (Qt5 fork)'
url='https://unetbootin.github.io'
depends=('syslinux' 'p7zip' 'qt5-base' 'mtools')
makedepends=('git' 'qt5-tools')
provides=('unetbootin')
conflicts=('unetbootin')
optdepends=('polkit: run unetbootin directly from menu'
            'zenity: display an error if no authentication agent is found')
source=("${pkgname}::git+https://github.com/Chemrat/unetbootin.git"
        'org.archlinux.pkexec.unetbootin.policy'
	'remove-qt-x11-no-mitshm.patch'
        'unetbootin.sh')
sha256sums=('SKIP'
            'fa9bb53d90cb10a0ab8dd317ed6a3506b228b0e26ed2ed8b108b5990f641641a'
            '50595cb9ee105d422d35aba8ec17b67395226220c59d928a4c0761ac11ca3de8'
            '773f9a88c5ebda368afdda374365a328abec5cb636d0b895a9864fe22c23cf3f')
b2sums=('SKIP'
        '4aa0788a91c6326ebe07ea7cd814d1907b3615bb25c8dd4658253254a2bec18817835937e59a5a30bc39b62abbb4a1e30d0abc81e3441e5ad1cbea94b95e2348'
        '1dacbc91e2b2784ebe01ffb2288c30113d10ece136bccce7e7cac12fec7c2926990be3130f4da5da3c9561a06dbcff4feed21e1951ce95926c491439862ea12c'
        '6fdc4e4cf0497532a363f7dbd8760f66ba6c12c851c30738f20975767c9a1cbf8f0bc1022feff3d284a865d662bb184621850b94fab5f0baa107f3b8272935a1')

prepare() {
	cd "${pkgname}"
	patch --forward --strip=1 --input="${srcdir}/remove-qt-x11-no-mitshm.patch"

	cd "src/unetbootin"
	# Use Qt5 build tools instead
	sed -i -e 's/-qt4/-qt5/g' build-nostatic

}

build() {
	cd "${pkgname}/src/unetbootin"

	./build-nostatic
}

# Using the most recent un-annotated tag (name does not contain dashes)
pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
	cd "${pkgname}/src/unetbootin"

	install -d "${pkgdir}/usr/share/${_pkgname}"
	install -m644 unetbootin_*.qm "${pkgdir}/usr/share/${_pkgname}/"
	install -Dm755 unetbootin "${pkgdir}/usr/bin/${_pkgname}.elf"

	# Application shortcut
	install -Dm644 unetbootin.desktop \
		"${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	for i in 16 22 24 32 48 256; do
		install -Dm644 "unetbootin_${i}.png" \
			"${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png"
	done

	cd "$srcdir"

	install -m755 "unetbootin.sh" "${pkgdir}/usr/bin/${_pkgname}"

	# Polkit policy
	install -Dm644 'org.archlinux.pkexec.unetbootin.policy' \
		"${pkgdir}/usr/share/polkit-1/actions/org.archlinux.pkexec.unetbootin.policy"
}
