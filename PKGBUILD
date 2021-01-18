# Contributer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributer: Guillaume ALAUX <guillaume@archlinux.org>

# This PKGBUILD is directly modified from community/java11-openjdk

# TODO add test, see about packaging jtreg and using it here
# TODO see about building with OpenJDK10
# TODO add javazi
# TODO when IcedTea provides it, package icedtea-web and add it as optdepends
# TODO package OpenJFX for OpenJDK10 and add it as optdepends

## EXPLORATIONS
# TODO extract a jmods package from jdk10-openjdk?
# TODO extract a jdk-headless package?

pkgbase=java11-jetbrains-imfix
_pkgbase=java11-jetbrains
pkgname=('jre11-jetbrains-headless-imfix' 'jre11-jetbrains-imfix' 'jdk11-jetbrains-imfix')
_majorver=11
_ver=11.0.9.1
_hgver=11_0_9_1
_updatever=11
_jbver1=1145
_jbver2=77
pkgrel=1
pkgver=${_ver}.b${_jbver1}.${_jbver2}
_hg_tag=jb${_hgver}-b${_jbver2}
arch=('x86_64')
url='https://confluence.jetbrains.com/display/JBR/JetBrains+Runtime'
license=('custom')
makedepends=('java-environment>=10' 'java-environment<12' 'cpio' 'unzip' 'zip' 'libelf' 'libcups' 'libx11'
             'libxrender' 'libxtst' 'libxt' 'libxext' 'libxrandr' 'alsa-lib' 'pandoc'
             'graphviz' 'freetype2' 'libjpeg-turbo' 'giflib' 'libpng' 'lcms2'
             'libnet' 'bash')
source=(https://github.com/JetBrains/JetBrainsRuntime/archive/${_hg_tag}.tar.gz
        https://github.com/prehonor/myJetBrainsRuntime/raw/master/idea.patch
        freedesktop-java.desktop
        freedesktop-jconsole.desktop
        freedesktop-jshell.desktop)
sha256sums=('0a2936873a8afd1a0de18740bc91b1ea494873c35e97574fa78211b590fee333'
            'ceb149421aeceb286143a9c9979f3b9ce9fc9b161dfda1e20d41352c5e4741c4'
            '915bd0722e897fd811bb0d77829528017ecdfd703880454bc690018ee54e44b6'
            '3f072ef4d1f59e1188d4b36ff83378c67b9f77db532b4f5cbaeb57cd37620f07'
            'c0c01fcc02dc18ed96ef697b3bedce0e8336b212cb1fcee90b2129987f4ae8ec')

case "${CARCH}" in
  x86_64) _JARCH='x86_64';;
  i686)   _JARCH='x86';;
esac

_jvmdir=/usr/lib/jvm/java-${_majorver}-jetbrains
_jdkdir=JetBrainsRuntime-${_hg_tag}
_imgdir=${_jdkdir}/build/linux-${_JARCH}-normal-server-release/images

_nonheadless=(lib/libawt_xawt.{so,debuginfo}
              lib/libjawt.{so,debuginfo}
              lib/libjsound.{so,debuginfo}
              lib/libsplashscreen.{so,debuginfo})

build() {
  cd ${_jdkdir}

  # Fix im cursor follow
  patch -Np1 -i ${srcdir}/idea.patch

  NUM_PROC_OPT=''
  MAKEFLAG_J=$(echo ${MAKEFLAGS} | sed -En 's/.*-j([0-9]+).*/\1/p')
  if [ -n "${MAKEFLAG_J}" ]; then
    # http://hg.openjdk.java.net/jdk10/jdk10/file/85e6cb013b98/make/InitSupport.gmk#l105
    echo "Removing '-j${MAKEFLAG_J}' from MAKEFLAGS to prevent build fail. Passing it directly to ./configure."
    export MAKEFLAGS=${MAKEFLAGS/-j${MAKEFLAG_J}/}
    NUM_PROC_OPT="--with-num-cores=${MAKEFLAG_J}"
  fi

  # Avoid optimization of HotSpot being lowered from O3 to O2
  local _CFLAGS="${CFLAGS//-O2/-O3} ${CPPFLAGS} -fcommon"
  local _CXXFLAGS="${CXXFLAGS//-O2/-O3} ${CPPFLAGS} -fcommon"
  local _LDFLAGS=${LDFLAGS}
  if [[ ${CARCH} = i686 ]]; then
    echo "Removing '-fno-plt' from CFLAGS and CXXFLAGS to prevent build fail with this architecture"
    _CFLAGS=${CFLAGS/-fno-plt/}
    _CXXFLAGS=${CXXFLAGS/-fno-plt/}
  fi

  # CFLAGS, CXXFLAGS and LDFLAGS are ignored as shown by a warning
  # in the output of ./configure unless used like such:
  #  --with-extra-cflags="${CFLAGS}"
  #  --with-extra-cxxflags="${CXXFLAGS}"
  #  --with-extra-ldflags="${LDFLAGS}"
  # See also paragraph "Configure Control Variables from "jdk${_majorver}-${_hg_tag}/common/doc/building.md
  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS

  bash configure \
    --with-version-build="${_updatever}" \
    --with-version-pre="" \
    --with-version-opt="b${_jbver1}.${_jbver2}" \
    --with-stdc++lib=dynamic \
    --with-extra-cflags="${_CFLAGS}" \
    --with-extra-cxxflags="${_CXXFLAGS}" \
    --with-extra-ldflags="${_LDFLAGS}" \
    --with-libjpeg=system \
    --with-giflib=system \
    --with-libpng=system \
    --with-lcms=system \
    --with-zlib=system \
    --with-jvm-features=zgc \
    --enable-unlimited-crypto \
    --disable-warnings-as-errors \
    ${NUM_PROC_OPT}
    #--disable-javac-server

  make images legacy-jre-image

  # https://bugs.openjdk.java.net/browse/JDK-8173610
  find "../${_imgdir}" -iname '*.so' -exec chmod +x {} \;
}

check() {
  cd ${_jdkdir}
  # TODO package jtreg
  # make -k check
}

package_jre11-jetbrains-headless-imfix() {
  pkgdesc="JetBrains Java ${_majorver} headless runtime environment (With patch that allows the IME window follow the cursor)"
  depends=('java-runtime-common>=3' 'ca-certificates-utils' 'nss' 'libjpeg-turbo' 'lcms2' 'libnet' 'freetype2')
  optdepends=('java-rhino: for some JavaScript support')
  provides=("java-runtime-headless=${_majorver}" "java-runtime-headless-jetbrains=${_majorver}" "jre${_majorver}-jetbrains-headless=${pkgver}-${pkgrel}")
  _pkgname="jre11-jetbrains-headless"
  backup=(etc/${_pkgbase}/logging.propertopenjdkies
          etc/${_pkgbase}/management/jmxremote.access
          etc/${_pkgbase}/management/jmxremote.password.template
          etc/${_pkgbase}/management/management.properties
          etc/${_pkgbase}/net.properties
          etc/${_pkgbase}/security/java.policy
          etc/${_pkgbase}/security/java.security
          etc/${_pkgbase}/security/policy/README.txt
          etc/${_pkgbase}/security/policy/limited/default_US_export.policy
          etc/${_pkgbase}/security/policy/limited/default_local.policy
          etc/${_pkgbase}/security/policy/limited/exempt_local.policy
          etc/${_pkgbase}/security/policy/unlimited/default_US_export.policy
          etc/${_pkgbase}/security/policy/unlimited/default_local.policy
          etc/${_pkgbase}/sound.properties)
  install=install_jre-jetbrains-headless.sh

  cd ${_imgdir}/jre

  install -dm 755 "${pkgdir}${_jvmdir}"

  cp -a bin lib \
    "${pkgdir}${_jvmdir}"

  for f in "${_nonheadless[@]}"; do
    rm "${pkgdir}${_jvmdir}/${f}"
  done

  cp ../jdk/release "${pkgdir}${_jvmdir}"
  cp ../jdk/lib/modules "${pkgdir}${_jvmdir}/lib"

  # Conf
  install -dm 755 "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/${_pkgbase}"
  ln -s /etc/${_pkgbase} "${pkgdir}/${_jvmdir}/conf"

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses"
  cp -r legal "${pkgdir}/usr/share/licenses/${_pkgbase}"
  ln -s ${_pkgbase} "${pkgdir}/usr/share/licenses/${_pkgname}"
  ln -s /usr/share/licenses/${_pkgbase} "${pkgdir}/${_jvmdir}/legal"

  # Man pages
  for f in man/man1/* man/ja/man1/*; do
    install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-jetbrains${_majorver}.1}"
  done
  ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}${_jvmdir}/lib/security/cacerts"
}

package_jre11-jetbrains-imfix() {
  pkgdesc="JetBrains Java ${_majorver} full runtime environment (With patch that allows the IME window follow the cursor)"
  depends=("jre${_majorver}-jetbrains-headless=${pkgver}-${pkgrel}" 'giflib')
  optdepends=('alsa-lib: for basic sound support'
              'gtk2: for the Gtk+ 2 look and feel - desktop usage'
              'gtk3: for the Gtk+ 3 look and feel - desktop usage')
  provides=("java-runtime=${_majorver}" "java-runtime-jetbrains=${_majorver}" "jre${_majorver}-jetbrains=${pkgver}-${pkgrel}")
  conflicts=("jre11-jetbrains")
  _pkgname="jre11-jetbrains"
  install=install_jre-jetbrains.sh

  cd ${_imgdir}/jre

  install -dm 755 "${pkgdir}${_jvmdir}"

  for f in "${_nonheadless[@]}"; do
    install -Dm 644 ${f} "${pkgdir}${_jvmdir}/${f}"
  done

  # Licenses
  install -dm 755 "${pkgdir}/usr/share/licenses"
  ln -s ${_pkgbase} "${pkgdir}/usr/share/licenses/${_pkgname}"
}

package_jdk11-jetbrains-imfix() {
  pkgdesc="JetBrains Java ${_majorver} development kit (With patch that allows allow the IME window follow the cursor)"
  depends=("jre${_majorver}-jetbrains=${pkgver}-${pkgrel}" 'java-environment-common=3' 'hicolor-icon-theme' 'libelf')
  provides=("java-environment=${_majorver}" "java-environment-jetbrains=${_majorver}" "jdk${_majorver}-jetbrains=${pkgver}-${pkgrel}")
  conflicts=("jdk11-jetbrains")
  _pkgname="jdk11-jetbrains"
  install=install_jdk-jetbrains.sh

  cd ${_imgdir}/jdk

  install -dm 755 "${pkgdir}${_jvmdir}"

  cp -a bin demo include jmods lib \
    "${pkgdir}${_jvmdir}"

  rm "${pkgdir}${_jvmdir}/lib/src.zip"

  # Remove files held by JRE
  pushd ../jre
  for d in bin lib; do
    find ${d} ! -type d -exec rm "${pkgdir}${_jvmdir}/{}" \;
  done
  popd
  find "${pkgdir}${_jvmdir}/lib" -type d -empty -delete

  # Conf files all belong to JRE

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses"
  cp -r legal "${pkgdir}/usr/share/licenses/${_pkgbase}"
  pushd ../jre/legal
  find . ! -type d -exec rm "${pkgdir}/usr/share/licenses/${_pkgbase}/{}" \;
  popd
  find "${pkgdir}/usr/share/licenses" -type d -empty -delete
  ln -s ${_pkgbase} "${pkgdir}/usr/share/licenses/${_pkgname}"

  # Man pages
  for f in man/man1/* man/ja/man1/*; do
    if [ ! -e "../jre/${f}" ]; then
      install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-jetbrains${_majorver}.1}"
    fi
  done

  # Icons
  for s in 16 24 32 48; do
    install -Dm 644 \
      "${srcdir}/${_jdkdir}/src/java.desktop/unix/classes/sun/awt/X11/java-icon${s}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${s}x${s}/apps/${_pkgbase}.png"
  done

  # Desktop files
  for f in jconsole java jshell; do
    install -Dm 644 \
      "${srcdir}/freedesktop-${f}.desktop" \
      "${pkgdir}/usr/share/applications/${f}-${_pkgbase}.desktop"
  done
}

# vim: ts=2 sw=2 et:
