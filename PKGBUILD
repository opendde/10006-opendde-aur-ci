#
# PKGBUILD for sidfactory2 (SID Factory II))
#
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#
# blog: http://blog.chordian.net/sf2/
# github: https://github.com/Chordian/sidfactory2
#

_pkgname=sidfactory2
_pkgver=20210104
_commit=fed95a77b995fc594c83d84eee073af1a396cf2b

pkg_ident="release-${_pkgver//_/-}"
pkg_name_ver="${_pkgname}-${_pkgver//_/-}"
pkg_name_dir="${_pkgname}-release-${_pkgver}"

#pkg_ident="${_commit}"
#pkg_name_ver="${_pkgname}-${_commit}"
#pkg_name_dir="${pkg_name_ver}"

pkgname=${_pkgname}
pkgver=${_pkgver}
pkgrel=1
pkgdesc="Cross-platform editor for composing music for the Commodore C64 SID chip"
arch=('i686' 'x86_64')
url="https://github.com/Chordian/sidfactory2"
license=('GPL')
makedepends=('pkgconfig' 'make' 'gcc')
depends=('sdl2')
optdepends=()
conflicts=('sidfactory2-unstable')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Chordian/${_pkgname}/archive/${pkg_ident}.tar.gz")
md5sums=('4ac9c5003f89caa629becf8e01f8e436')


#
#
#
prepare()
{
  cd "${srcdir}/${pkg_name_dir}"
  cp "${startdir}/Makefile.sf2" Makefile
  patch -b -p0 < "${startdir}/patch-Makefile.diff"
}

#
#
#
build()
{
  cd "${srcdir}/${pkg_name_dir}"
  make
}

#
#
#
package()
{
  cd "${srcdir}/${pkg_name_dir}"
  make dist

  #install -m 755 -D "${srcdir}/${pkg_name_dir}/artifacts/SIDFactoryII" "${pkgdir}/usr/bin/SIDFactoryII.exe"
  #ln -sf SIDFactoryII "${pkgdir}/usr/bin/sidfactory2"
  #ln -sf sf2 "${pkgdir}/usr/bin/sidfactory2"

  #for aa in "${srcdir}/${pkg_name_dir}/dist/documentation/"*.txt; do
  #  aaa=$(basename "${aa}")
  #  install -m 644 -D "${aa}" "${pkgdir}/usr/share/doc/${pkgname}/${aaa}"
  #done

  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -R "${srcdir}/${pkg_name_dir}/dist/documentation/"* "${pkgdir}/usr/share/doc/${pkgname}/"

  install -m 755 -d "${pkgdir}/usr/share/${pkgname}"
  cp -R "${srcdir}/${pkg_name_dir}/artifacts/config" "${pkgdir}/usr/share/${pkgname}"
  cp -R "${srcdir}/${pkg_name_dir}/artifacts/drivers" "${pkgdir}/usr/share/${pkgname}"
  cp -R "${srcdir}/${pkg_name_dir}/artifacts/overlay" "${pkgdir}/usr/share/${pkgname}"
  cp -R "${srcdir}/${pkg_name_dir}/artifacts/color_schemes" "${pkgdir}/usr/share/${pkgname}"
  cp -R "${srcdir}/${pkg_name_dir}/artifacts/music" "${pkgdir}/usr/share/${pkgname}"

  #
  #make -j1 DESTDIR="${pkgdir}" install
  #install -m 644 -D "${srcdir}/${pkg_name_dir}/SIDFactoryII/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
  #

  # HACK: SF2 expects to find drivers etc in the same dir as the binary  :-S
  mkdir -p "${pkgdir}/opt/${_pkgname}"
  install -m 755 -D "${srcdir}/${pkg_name_dir}/artifacts/SIDFactoryII" "${pkgdir}/opt/${_pkgname}/SIDFactoryII"
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/opt/${_pkgname}/SIDFactoryII" "${pkgdir}/usr/bin/SIDFactoryII"
  ln -sf SIDFactoryII "${pkgdir}/usr/bin/sidfactory2"
  ln -sf SIDFactoryII "${pkgdir}/usr/bin/sf2"

  ln -s "/usr/share/${pkgname}/config" "${pkgdir}/opt/${_pkgname}/"
  ln -s "/usr/share/${pkgname}/drivers" "${pkgdir}/opt/${_pkgname}/"
  ln -s "/usr/share/${pkgname}/overlay" "${pkgdir}/opt/${_pkgname}/"
  ln -s "/usr/share/${pkgname}/color_schemes" "${pkgdir}/opt/${_pkgname}/"
  ln -s "/usr/share/${pkgname}/music" "${pkgdir}/opt/${_pkgname}/"

}

#
# EOF
#
