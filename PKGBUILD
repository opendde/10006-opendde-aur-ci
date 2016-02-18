# Contributer: Donald Carr <sirspudd@gmail.com>

# Documentation

# Set up the pi for Qt compilation.
# For a comprehensive set of deps I just install chromium which pulls in everything

#* I had to removed xcomposite as code path breaks
#* Remove 2 (mesa) pkgconfig files we allow to screw our mkspec
# * rm /usr/lib/pkgconfig/glesv2.pc
# * rm /usr/lib/pkgconfig/egl.pc

# I use NFS to develop against my sysroot personally: sudo mount qpi2.local:/ /mnt/pi

# NB: Mandatory edit: set this variable to point to your raspberry pi's sysroot
_sysroot=/mnt/pi

# Options
_skip_web_engine=true
_static_build=false
_build_from_head=false
_local_qt5_repo="/opt/dev/src/qtproject/qt5"

pkgver=5.6.0
pkgrel=5

# PKGBUILD
_piver=2
_pkgname=qt-sdk-raspberry-pi

if $_static_build; then
  _pkgname="${_pkgname}-static"
fi

if $_build_from_head; then
  _pkgver=6.6.6
fi

provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
pkgname="${_pkgname}${_piver}"
_packaginguser=$(whoami)
_libspkgname="${pkgname}-target-libs"
_mkspec="linux-rpi${_piver}-g++"
_pkgver=${pkgver}-beta
_baseprefix=/opt
_installprefix=${_baseprefix}/${pkgname}-${_pkgver}
_source_package_name=qt-everywhere-opensource-src-${_pkgver}
pkgdesc="Qt SDK for the Raspberry Pi${_piver}"
arch=("x86_64")
url="http://www.qt.io"
license=("LGPL3" "GPL3")
depends=("qpi-toolchain" "qtcreator")
makedepends=("git" "pkgconfig" "gcc")
source=("git://github.com/sirspudd/mkspecs.git" "https://download.qt.io/development_releases/qt/5.6/${_pkgver}/single/${_source_package_name}.tar.gz")
sha256sums=("SKIP" "d69103ec34b3775edfa47581b14ee9a20789d4b0d7d26220fb92f2cd32eb06f9")
options=('!strip')
install=qpi.install
_fully_qualified_install_script="${startdir}/${install}"
_device_configure_flags=""

#Sanity check
__pkgconfigpath="${_sysroot}/usr/lib/pkgconfig"
__eglpkgconfigpath="${__pkgconfigpath}/egl.pc"
__glespkgconfigpath="${__pkgconfigpath}/glesv2.pc"

if [[ ! -d ${__pkgconfigpath} ]]; then
  echo "You have to set a valid sysroot to proceed with the build"
  exit 1
fi

if [[ -f ${__eglpkgconfigpath} ]] || [[ -f ${__glespkgconfigpath} ]] ; then
  echo "Mesa is about to eat our communal poodle; delete egl.pc and glesv2.pc in your sysroot"
  exit 1
fi

#end sanity check

if $_skip_web_engine || [[ ${_piver} = "1" ]]; then
  _device_configure_flags="$_device_configure_flags -skip qtwebengine"
fi

if $_static_build; then
  _device_configure_flags="$_device_configure_flags -static"
fi

if $_build_from_head; then
  _device_configure_flags="$_device_configure_flags -skip qt3d -skip qtsystems -skip qttools -skip qtwebkit"
fi

build() {
  local _srcdir="${srcdir}/${_source_package_name}"
  local _bindir="${_srcdir}-build"
  local _mkspec_dir="${_srcdir}/qtbase/mkspecs/devices/${_mkspec}"

  # Qt tries to do the right thing and stores these, breaking cross compilation
  unset LDFLAGS
  unset CFLAGS
  unset CXXFLAGS

if $_build_from_head; then
  _srcdir="${_local_qt5_repo}"
fi

  # Get our mkspec
  rm -Rf $_mkspec_dir
  cp -r "${srcdir}/mkspecs/${_mkspec}" $_mkspec_dir

  mkdir -p ${_bindir}
  cd ${_bindir}

  # skipping due to build issues: qtquickcontrols2
  # skipping on principle: qtscript xcb
  # skipping because of the target in question: widgets qtwebchannel
  # TODO: qtwebengine, a little bulky but useful

  # Too bleeding big
  # -developer-build \
  # -separate-debug-info \

  # Chromium requires python2 to be the system python on your build host
  # I literally symlink /usr/bin/python to /usr/bin/python2 on arch

  # patch
  local _webenginefileoverride="${_srcdir}/qtwebengine/tools/qmake/mkspecs/features/functions.prf"
  sed -i "s/linux-clang/linux*/" ${_webenginefileoverride} || exit 1
  local _reducerelocations="${_srcdir}/qtbase/config.tests/unix/bsymbolic_functions.test"
  sed -i "s/error/warning/" ${_reducerelocations} || exit 1

  # No longer required as we explicitly set CFLAGS = foo in the mkspec
  # Work around our embarresing propensity to stomp on your own tailored build configuration
  # sed -i "s/O[23]/Os/"  ${_srcdir}/qtbase/mkspecs/common/gcc-base.conf || exit 1

  # end patch

  # Breaks in qtwayland
  # -qtnamespace Pi \

  ${_srcdir}/configure \
    -qreal float \
    -release \
    -silent \
    -confirm-license \
    -opensource \
    -qtlibinfix "Pi${_piver}" \
    -reduce-exports \
    -reduce-relocations \
    -pch \
    -ltcg \
    -no-compile-examples \
    -hostprefix ${_installprefix} \
    -prefix ${_installprefix} \
    -opengl es2 \
    -egl \
    -no-icu \
    \
    -no-widgets \
    -make libs \
    -no-xcb \
    \
    -skip qtscript \
    -skip qtwayland \
    -skip qtquickcontrols2 \
    \
    -sysroot ${_sysroot} \
    -device ${_mkspec} \
    -device-option CROSS_COMPILE=/opt/arm-sirspuddarch-linux-gnueabihf/bin/arm-sirspuddarch-linux-gnueabihf- \
    ${_device_configure_flags} || exit 1

  make || exit 1

  # regrettably required, as qtwayland barfs on shadow builds
  # as private header paths not included: no clue how to fix, bypassing

  cp -r "${_srcdir}/qtwayland" "${_bindir}" || exit 1
  cd "${_bindir}/qtwayland"
  ${_bindir}/qtbase/bin/qmake CONFIG+=wayland-compositor || exit 1
  make || exit 1
}

create_install_script()
{
  local _fully_qualified_install_script_template="${startdir}/_${install}"

  rm ${_fully_qualified_install_script}

  # populate vars
  echo "_piver=\"${_piver}\"" >> ${_fully_qualified_install_script}
  echo "_qmakepath=\"${_installprefix}/bin/qmake\"" >> ${_fully_qualified_install_script}
  echo "_sysroot=\"${_sysroot}\"" >> ${_fully_qualified_install_script}

  cat ${_fully_qualified_install_script_template} >> ${_fully_qualified_install_script}
}

package() {
  local _srcdir="${srcdir}/${_source_package_name}"
  local _bindir="${_srcdir}-build"

  create_install_script

  # cleanup
  rm -Rf ${pkgdir}
  mkdir -p ${pkgdir}

  cd "${_bindir}"
  INSTALL_ROOT="$pkgdir" make install || exit 1

  # regrettably required
  cd "${_bindir}/qtwayland"
  INSTALL_ROOT="$pkgdir" make install || exit 1

  # Qt is now installed to $pkgdir/$sysroot/$prefix
  # manually generate/decompose host/target
  local _libsdir="${startdir}/${_libspkgname}"
  local _libspkgdir="${_libsdir}/topkg"
  local _libspkgbuild="${_libsdir}/PKGBUILD"
  local _pkgprofiled=${_libspkgdir}/etc/profile.d
  rm -Rf ${_libspkgdir}
  mkdir -p ${_libspkgdir}

  cp ${startdir}/PKGBUILD.libs ${_libspkgbuild}
  mv "${pkgdir}/${_sysroot}/${_baseprefix}" ${_libspkgdir}
  # set correct libs version
  sed -i "s/libspackagename/${_libspkgname}/" ${_libspkgbuild} || exit 1
  sed -i "s/libspiversion/${_piver}/" ${_libspkgbuild} || exit 1

  sed -i "s/6.6.6/${pkgver}/" ${_libspkgbuild} || exit 1

  mkdir -p ${_pkgprofiled}
  cp ${startdir}/qpi.sh ${_pkgprofiled} || exit 1
  sed -i "s,localpiprefix,${_installprefix}," ${_pkgprofiled}/qpi.sh || exit 1

  cd ${_libsdir}
  runuser -l ${_packaginguser} -c 'makepkg -f' || exit 1

  echo "the libs package for the Raspberry Pi${_piver} is in the ${_packaginguser} home directory awaiting deployment"

  mv ${_libsdir}/${_libspkgname}-${pkgver}-1-any.pkg.tar.xz ${HOME}
}
