# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
#
# Generated by aur-fd-scripts - https://git.respiranto.de/aur-fd-scripts.git/

_lang=fra-deu
pkgname="dict-freedict-${_lang}"
_pkgver=2022.04.06
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc="French -> German dictionary for dictd et al. from FreeDict.org"
arch=('any')
url="https://freedict.org/"
license=('CCPL:by-sa' 'FDL')
optdepends=('dictd: dict client and server')
makedepends=('freedict-tools')
install="${pkgname}.install"
source=("https://download.freedict.org/dictionaries/${_lang}/${_pkgver}/freedict-${_lang}-${_pkgver}.src.tar.xz")
sha512sums=('8a615b676b80adf8964fc603c1002767af6da055e24bfd89ae2f3fd562af50c71944d699ff17892d773935109b73f438ec44565905f6ca5104d63db2521d12da')

build()
{
	cd "$_lang"
	make FREEDICT_TOOLS=/usr/lib/freedict-tools build-dictd
}

package()
{
	install -m 755 -d "${pkgdir}/usr/share/dictd"
	install -m 644 -t "${pkgdir}/usr/share/dictd/" \
		"${_lang}/build/dictd/${_lang}".{dict.dz,index}

	for file in "$_lang"/{AUTHORS,README,NEWS,ChangeLog}
	do
		if test -f "$file"
		then
			install -m 644 -Dt "${pkgdir}/usr/share/doc/freedict/${_lang}/" "$file"
		fi
	done
}
