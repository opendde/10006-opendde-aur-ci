# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
pkgname=apache-gremlin-console
pkgver=3.0.1
pkgrel=1
pkgdesc="Gremlin console from Apache TinkerPop "
arch=('any')
url="https://tinkerpop.incubator.apache.org"
license=('Apache')

depends=('bash' 'java-environment')
makedepends=()
source=(https://www.apache.org/dist/incubator/tinkerpop/${pkgver}-incubating/apache-gremlin-console-${pkgver}-incubating-bin.zip)
md5sums=('c15faf942ef82b5bddf1902d5b0896df')
sha256sums=('2956625b742c6c8d9178bed6090b0bfceab7239fbc24db7ccc78dbb4ac9de750')

package() {
  cd apache-gremlin-console-${pkgver}-incubating

  mkdir -p "${pkgdir}/usr/share/${pkgname}/bin"
  cp bin/gremlin.sh "${pkgdir}/usr/share/${pkgname}/bin"
  
  for i in conf data ext lib ; do
    cp -R "$i" "${pkgdir}/usr/share/${pkgname}"
  done

  mkdir -p "${pkgdir}/usr/bin"
  printf "#!/bin/sh\ncd /usr/share/${pkgname}/bin\n./gremlin.sh \"\$@\"" >> "${pkgdir}/usr/bin/gremlin"
  chmod 755 "${pkgdir}/usr/bin/gremlin"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Workaround for the following startup exception:
  # Exception in thread "main" java.io.FileNotFoundException: /usr/share/apache-gremlin-console/bin/../ext/plugins.txt
  #
  # Possible fix: skip the cleanup if the file is not writable:
  # https://github.com/apache/incubator-tinkerpop/blob/master/gremlin-console/src/main/groovy/org/apache/tinkerpop/gremlin/console/Console.groovy#L137
  chmod a+w "${pkgdir}/usr/share/${pkgname}/ext/plugins.txt"
}
