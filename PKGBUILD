# Author: mosra <mosra@centrum.cz>
pkgname=ardupilot-mission-planner
_pkgname=mission-planner
pkgver=2020_09_05
pkgrel=1
pkgdesc="Mission Planner Ground Control Station"
arch=('x86_64')
url="https://github.com/ArduPilot/MissionPlanner"
license=("GPL3")
depends=('mono')

source=("https://firmware.ardupilot.org/Tools/MissionPlanner/MissionPlanner-latest.zip" ${_pkgname}.desktop)
sha256sums=(
	'6d2d8e96be63d24d93beda043539253ba6cd195d49a08104ffdbbebd1a8d7949'
	'c7acaec9695d2df58ad7b7f950275d9acd086f5bbe6316eb6d0b0f6ab65b00d2'
)

package() {
	install -d "${pkgdir}/opt/${_pkgname}"
	cp -r ${srcdir}/* ${pkgdir}/opt/${_pkgname} -R

	install -d "${pkgdir}/usr/share/applications"
	install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
