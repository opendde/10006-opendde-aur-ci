# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Alex Jones <jonesax@hush.com>
# Contributor: Dragan Glumac <dragan.glumac@gmail.com

set -u
_gitauth='AlexsJones'
_pkgname='jnxlibc'
_vopt='v' # '' or 'v', starts at v1.7
pkgname="${_pkgname}"
pkgver='2.0'
pkgrel='1'
pkgdesc='General purpose C library with many useful components'
arch=('any')
url="https://github.com/${_gitauth}/${_pkgname}"
license=('GPL')
groups=('base-devel')
depends=('glibc')
makedepends=('doxygen' 'cmake')
_verwatch=("${url}/releases" "${url#*github.com}/archive/${_vopt}\(.*\)\.tar\.gz" 'l')
_srcdir="${pkgname}-${pkgver}"
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${_vopt}${pkgver}.tar.gz")
sha256sums=('dcffe7225a6f087c755cd519d5035ddc4213426c8b5225a197a0734c71322ff2')

prepare() {
  set -u
  cd "${_srcdir}"
  #cd 'platform/linux' || :
  #if [ -s 'CMakeLists.txt' ]; then
    cmake .
  #fi
  #if [ -s 'configure' ]; then
  #  ./configure
  #fi
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  #cd 'platform/linux' || :
  make
  set +u
}

check() {
  set -u
  cd "${_srcdir}"
  # Tests are slow
  #./test/run_tests
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  #cd 'platform/linux' || :
  make DESTDIR="${pkgdir}" install

  #mkdir -p "${pkgdir}/usr/include/"
  #cp -prf 'jnxc_headers' "${pkgdir}/usr/include"
  ##mkdir -p "${pkgdir}/usr/share/man/man3"
  #install -Dpm755 'lib/libjnxc.so.1.0' -t "${pkgdir}/usr/lib"
  #ln -sf '/usr/lib/libjnxc.so.1.0' "${pkgdir}/usr/lib/libjnxc.so"
  #ln -sf '/usr/lib/libjnxc.so.1.0' "${pkgdir}/usr/lib/libjnxc.so.1"
  set +u
}
set +u
