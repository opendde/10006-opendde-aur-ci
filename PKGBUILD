# Maintainer: Einhard Leichtfuß <alguien@respiranto.de>
_lang=deu-eng
_pkgname=dict-freedict-${_lang}
pkgname=${_pkgname}-svn
pkgver=r1775
pkgrel=2
pkgdesc="German -> English dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
makedepends=('subversion' 'dictd' 'freedict-tools')
provides=(${_pkgname})
conflicts=(${_pkgname})
install=${pkgname}.install
source=("svn+https://github.com/freedict/fd-dictionaries/trunk/${_lang}")
md5sums=('SKIP')

pkgver()
{
	cd $_lang
	local _ver="$(svnversion)"
	printf "r%s" "${_ver//[[:alpha:]]}"
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
