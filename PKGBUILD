# Maintainer : Ashwin Vishnu <ashwinvis+arch At protonmail DoT cOm>
# Contributor : Einhard Leichtfuß <alguien@respiranto.de>
_lang=eng-swe
pkgname=dict-freedict-${_lang}
pkgver=0.2
pkgrel=3
pkgdesc="English -> Swedish dictionary for dictd et al. from Freedict.org"
arch=('any')
url="https://freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
makedepends=('dictd' 'freedict-tools')
install=${pkgname}.install
source=("https://download.freedict.org/dictionaries/${_lang}/${pkgver}/freedict-${_lang}-${pkgver}.src.tar.xz")
sha512sums=('16bde111c5a4b8842fd6d3f7687d3e520a9f3d1da9fc5dbdf21d1b843056212e672fdb148d8b3af8cf9cd777421ee3bb31f05db8c0e8daa9055ce60adf4fbd1b')
changelog="ChangeLog"

prepare()
{
        cp -f ${_lang}/ChangeLog ..
}

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
