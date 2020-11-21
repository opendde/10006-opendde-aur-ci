# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
#
# Generated by aur-fd-scripts - https://git.respiranto.de/aur-fd-scripts.git/

_lang=fra-deu
pkgname=dict-freedict-${_lang}
pkgver=2020.10.04
pkgrel=1
pkgdesc="French -> German dictionary for dictd et al. from Freedict.org"
arch=('any')
url="https://freedict.org/"
license=('CCPL:by-sa' 'FDL')
optdepends=('dictd: dict client and server')
makedepends=('freedict-tools')
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.src.tar.xz")
sha512sums=('624ccbc0d6fcd298f244feab2a2001fa9881111007ff49f01d9de276ebb2b5ed0fe1a8ec87ae32e39b9616cc3e9d179c83182c891ef85efe4e69aea6dc43ad26')

build()
{
	cd $_lang
	make FREEDICT_TOOLS=/usr/lib/freedict-tools build-dictd
}

package()
{
	install -m 755 -d "${pkgdir}/usr/share/dictd"
	install -m 644 -t "${pkgdir}/usr/share/dictd/" \
		${_lang}/build/dictd/${_lang}.{dict.dz,index}

	for file in ${_lang}/{AUTHORS,README,NEWS,ChangeLog}
	do
		if test -f ${file}
		then
			install -m 644 -Dt "${pkgdir}/usr/share/doc/freedict/${_lang}/" ${file}
		fi
	done
}
