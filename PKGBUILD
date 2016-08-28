# Maintainer: Leonidas Spyropoulos (artafinde at gmail dot com)
# Contributor: scrawler@gmail.com

pkgname=freeplane
pkgver=1.5.15
pkgrel=1
pkgdesc="A Java mindmapping tool"
arch=('any')
url="http://freeplane.sourceforge.net"
license=('GPL')
makedepends=('unzip')
depends=('java-environment' 'desktop-file-utils')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}_bin-${pkgver}.zip
        freeplane.desktop freeplane.run)
md5sums=('5845fdda2a4be9f34da656d75a061c95'
         '85d40893aef0b71f9ffdf2dec4fbb0f0'
         'f1505d5b6872e2dffe8ef2e82d065551')

package() {
  # Create required directories
  mkdir -p ${pkgdir}/usr/share/freeplane/core/org.freeplane.core/META-INF
  mkdir -p ${pkgdir}/usr/share/freeplane/core/org.freeplane.core/lib
  mkdir -p ${pkgdir}/usr/share/freeplane/resources/ortho
  mkdir -p ${pkgdir}/usr/share/freeplane/resources/templates
  mkdir -p ${pkgdir}/usr/share/freeplane/resources/xslt
  mkdir -p ${pkgdir}/usr/share/freeplane/resources/xml
  mkdir -p ${pkgdir}/usr/share/freeplane/fwdir/perms
  mkdir -p ${pkgdir}/usr/share/freeplane/fwdir/condperm
  mkdir -p ${pkgdir}/usr/share/freeplane/scripts
  mkdir -p ${pkgdir}/usr/share/freeplane/doc

  cd ${srcdir}/${pkgname}-${pkgver}
  for file in $( find plugins -type f ) ; do
    install -Dm644 ${file} ${pkgdir}/usr/share/freeplane/${file}
  done
  for file in $( find doc -type f ) ; do
    install -Dm644 ${file} ${pkgdir}/usr/share/freeplane/${file}
  done

  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/freeplane.sh ${pkgdir}/usr/share/freeplane/freeplane.sh
  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/freeplane.policy ${pkgdir}/usr/share/freeplane/freeplane.policy
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/init.xargs ${pkgdir}/usr/share/freeplane/init.xargs
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/props.xargs ${pkgdir}/usr/share/freeplane/props.xargs
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/license.txt ${pkgdir}/usr/share/freeplane/licence.txt
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/freeplane.l4j.ini ${pkgdir}/usr/share/freeplane/freeplane.l4j.ini
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/freeplaneConsole.l4j.ini ${pkgdir}/usr/share/freeplane/freeplaneConsole.l4j.ini
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/freeplaneIcons.dll ${pkgdir}/usr/share/freeplane/freeplaneIcons.dll
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/gitinfo.txt ${pkgdir}/usr/share/freeplane/gitinfo.txt
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/freeplanelauncher.jar ${pkgdir}/usr/share/freeplane/freeplanelauncher.jar
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/framework.jar ${pkgdir}/usr/share/freeplane/framework.jar

  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/core/org.freeplane.core/META-INF/* ${pkgdir}/usr/share/freeplane/core/org.freeplane.core/META-INF/
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/core/org.freeplane.core/lib/* ${pkgdir}/usr/share/freeplane/core/org.freeplane.core/lib
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/resources/ortho/* ${pkgdir}/usr/share/freeplane/resources/ortho/
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/resources/templates/* ${pkgdir}/usr/share/freeplane/resources/templates/
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/resources/xslt/* ${pkgdir}/usr/share/freeplane/resources/xslt/
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/resources/xml/* ${pkgdir}/usr/share/freeplane/resources/xml/
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/resources/gitinfo.properties ${pkgdir}/usr/share/freeplane/resources/gitinfo.properties
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/scripts/* ${pkgdir}/usr/share/freeplane/scripts/
  
  # Install the desktop entry
  install -Dm644 ${srcdir}/freeplane.desktop ${pkgdir}/usr/share/applications/freeplane.desktop
  # Install icons
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/freeplane.svg ${pkgdir}/usr/share/pixmaps/freeplane.svg
  # Install the executable script
  install -Dm755 ${srcdir}/freeplane.run ${pkgdir}/usr/bin/freeplane
}
