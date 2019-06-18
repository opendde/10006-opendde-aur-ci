# Contributor: Benjamin Sick
# Contributor: Rich Li <rich@dranek.com>

pkgname=gmt6
_pkgname=gmt
_pkgdate=20190618
pkgver=6.0.0_${_pkgdate}
pkgrel=1
pkghashver=d44f184e22ef2cb9abdee4ebd11373c5825942ec
pkgdesc="Generic Mapping Tools: Collection of tools for manipulating geographic and Cartesian data sets, and generating EPS maps."
arch=(i686 x86_64)
url="https://gmt.soest.hawaii.edu/"
license=('LGPL')
makedepends=('cmake' 'ninja')
depends=('gdal' 'fftw' 'lapack' 'python-sphinx')
optdepends=(
    'ghostscript'
    'gmt-coast: coastlines'
    'gmt-dcw: digital chart of the world polygon map')
conflicts=('gmt4' 'gmt')
install='gmt.install'
#source=("ftp://ftp.soest.hawaii.edu/gmt/${_pkgname}-${pkgver}-src.tar.xz")
#source=("ftp://ftp.star.nesdis.noaa.gov/pub/sod/lsa/gmt/${_pkgname}-${pkgver}-src.tar.xz")
#source=("ftp://ftp.iris.washington.edu/pub/gmt/${_pkgname}-${pkgver}-src.tar.xz")
#source=("ftp://ftp.iag.usp.br/pub/gmt/${_pkgname}-${pkgver}-src.tar.xz")
#source=("https://mirrors.ustc.edu.cn/gmt/${_pkgname}-${pkgver}-src.tar.xz")
source=("https://github.com/GenericMappingTools/${_pkgname}/archive/${pkghashver}.tar.gz")
sha256sums=('3f8fae79a253e50eb40707abdb4edea64a7192c135ef07a09b1ea933c0e00bde')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkghashver}"
  sed -i 's/\*\.1\.gz/\*\.1gmt\.gz/g' doc/rst/CMakeLists.txt
  sed -i 's/\*\.3\.gz/\*\.3gmt\.gz/g' doc/rst/CMakeLists.txt
  sed -i 's/\*\.5\.gz/\*\.5gmt\.gz/g' doc/rst/CMakeLists.txt
}

build() {
  mkdir -p "${srcdir}/build/aur"
  cd "${srcdir}/build/aur"
  # -DLICENSE_RESTRICTED=off \
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DGSHHG_ROOT=/usr/share/gmt/coast \
    -DGMT_LIBDIR=lib \
    -DDCW_ROOT=/usr/share/gmt/dcw \
    -DGMT_DATADIR=share/gmt \
    -DGMT_MANDIR=share/man \
    -DGMT_DOCDIR=share/doc/gmt \
    -DCMAKE_BUILD_TYPE=Release \
    -GNinja \
    "${srcdir}/${_pkgname}-${pkghashver}"
  export MAKEFLAGS="-j$(nproc)"
  ninja || return 1
}

package() {
  cd "${srcdir}/build/aur"
  ninja docs_html docs_man
  cd doc/rst/man \
  && for i in $(ls *.1.gz); do mv $i ${i%".1.gz"}.1gmt.gz; done \
  && for i in $(ls *.3.gz); do mv $i ${i%".3.gz"}.3gmt.gz; done \
  && for i in $(ls *.5.gz); do mv $i ${i%".5.gz"}.5gmt.gz; done \
  && cd "${srcdir}/build/aur"
  DESTDIR="${pkgdir}" ninja install || return 1
}

# vim:set ts=2 sw=2 et:
