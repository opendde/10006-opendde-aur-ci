# Maintainer: Jonathon Fernyhough <jonathon"manjaro+org>
# Contributor: Sam Guymer <sam at guymer dot me>

# This PKGBUILD adapted from zulu-11-bin

_jdkname=liberica-jdk-11-lite
pkgname="${_jdkname}-bin"
_java_ver=11
pkgver=11.0.9+11
pkgrel=1
pkgdesc='BellSoft builds of OpenJDK are fully certified and 100% open source Java Development Kits (JDKs) for all Java development and production workloads. Lite version has compressed modules.'
arch=(aarch64 armv7h armv8h i686 x86_64)
url='https://bell-sw.com/'
license=('custom')
depends=('java-environment-common=3' 'java-runtime-common>=3' 'ca-certificates-utils')
optdepends=(ffmpeg freetype2 gtk2 gtk3 libnet)
provides=(
  "java-environment=$_java_ver"
  "java-environment-openjdk=$_java_ver"
  "java-runtime-headless=$_java_ver"
  "java-runtime-headless-openjdk=$_java_ver"
  "java-runtime=$_java_ver"
  "java-runtime-openjdk=$_java_ver"
  "liberica-jdk-11-bin=$pkgver"
  "liberica-jre-11-bin=$pkgver"
)
install=$_jdkname.install

backup=(etc/${_jdkname}/logging.properties
        etc/${_jdkname}/management/jmxremote.access
        etc/${_jdkname}/management/jmxremote.password.template
        etc/${_jdkname}/management/management.properties
        etc/${_jdkname}/net.properties
        etc/${_jdkname}/security/java.policy
        etc/${_jdkname}/security/java.security
        etc/${_jdkname}/security/policy/README.txt
        etc/${_jdkname}/security/policy/limited/default_US_export.policy
        etc/${_jdkname}/security/policy/limited/default_local.policy
        etc/${_jdkname}/security/policy/limited/exempt_local.policy
        etc/${_jdkname}/security/policy/unlimited/default_US_export.policy
        etc/${_jdkname}/security/policy/unlimited/default_local.policy
        etc/${_jdkname}/sound.properties)

source_aarch64=(https://download.bell-sw.com/java/$pkgver/bellsoft-jdk$pkgver-linux-aarch64-lite.tar.gz)
source_armv7h=(https://download.bell-sw.com/java/$pkgver/bellsoft-jdk$pkgver-linux-arm32-vfp-hflt-lite.tar.gz)
source_armv8h=(${source_armv7h[@]})
source_i686=(https://download.bell-sw.com/java/$pkgver/bellsoft-jdk$pkgver-linux-i586-lite.tar.gz)
source_x86_64=(https://download.bell-sw.com/java/$pkgver/bellsoft-jdk$pkgver-linux-amd64-lite.tar.gz)

# Upstream-provided
sha1sums_aarch64=('94c8e2aad9aff8761be3d06d0a67d64dbf03bb90')
sha1sums_armv7h=('441270c23d12d3674b57f1d75b8d8b4d625d7768')
sha1sums_armv8h=(${sha1sums_armv7h[@]})
sha1sums_i686=('a299248645ee0bf9e9bf50536c97e056bee2e0ef')
sha1sums_x86_64=('d42fa621eba19ceead1399584b0688db221a653d')

_jvmdir="/usr/lib/jvm/${_jdkname}"

package() {
  cd jdk-${pkgver/+*/}-lite

  install -dm 755 "${pkgdir}/${_jvmdir}"
  cp -a . "${pkgdir}/${_jvmdir}/"

  # copied from java11-openjdk

  # Conf
  install -dm 755 "${pkgdir}/etc"
  cp -r conf "${pkgdir}/etc/${_jdkname}"
  rm -rf "${pkgdir}/${_jvmdir}/conf"
  ln -s "/etc/${_jdkname}" "${pkgdir}/${_jvmdir}/conf"

  # Legal
  install -dm 755 "${pkgdir}/usr/share/licenses"
  cp -r legal "${pkgdir}/usr/share/licenses/${_jdkname}"
  rm -rf "${pkgdir}/${_jvmdir}/legal"
  ln -s "/usr/share/licenses/${_jdkname}" "${pkgdir}/${_jvmdir}/legal"

  # Man pages
  #for f in man/man1/* man/ja/man1/*; do
  #  install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-$_jdkname.1}"
  #done
  #rm -rf "${pkgdir}/${_jvmdir}/man"
  #ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

  # Link JKS keystore from ca-certificates-utils
  rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
  ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"
}
