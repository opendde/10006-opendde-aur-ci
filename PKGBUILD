# Maintainer : Taiki Sugawara <buzz.taiki@gmail.com>
pkgname=gcviewer-git
_pkgname=gcviewer
pkgver=1.35.SNAPSHOT.r60.fc841de
pkgrel=1
pkgdesc="GCViewer is a little tool that visualizes verbose GC output generated by Sun, IBM, HP and BEA Java Virtual Machines."
arch=('any')
url="https://github.com/chewiebug/GCViewer"
license=('LGPL')
depends=('java-runtime')
makedepends=('git' 'java-environment' 'maven' 'imagemagick' 'perl-xml-xpath')
conflicts=('gcviewer-bin')
provides=('gcviewer')
source=("$_pkgname::git+https://github.com/chewiebug/GCViewer.git#branch==develop"
        'gcviewer.sh'
        'gcviewer.desktop')
sha256sums=('SKIP'
            '20316cd8975215966d9983aab9cc61a1a95acdbd397d30db6ad1da7f2ecc2e0b'
            '255f2a7b966832b98b0e8683d3a2b97a3a71bd354000d226ab21500ec52e8a91')

_mvn() {
  mvn -Dmaven.repo.local="$srcdir/m2" "$@"
}

pkgver() {
  cd "$srcdir/$_pkgname"
  local ver="$(xpath pom.xml '/project/version/text()' 2> /dev/null)"
  local rev="$(git describe --long | sed -e 's/.*-\([0-9]*\)-g/r\1./')"
  echo "$ver"."$rev" | tr - .
}

build() {
  cd "$srcdir/$_pkgname"
  _mvn package -DskipTests
  convert "target/classes/com/tagtraum/perf/gcviewer/gcviewericon.gif" "$srcdir/gcviewericon.png"
}

check() {
  cd "$srcdir/$_pkgname"
  _mvn test
}

package() {
  install -D -m644 "$srcdir/$_pkgname/target/$_pkgname"-*.jar  "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"
  install -D -m644 "$srcdir/$_pkgname/README.md"  "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -D -m644 "$srcdir/gcviewericon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -D -m755 "$srcdir/gcviewer.sh" "$pkgdir/usr/bin/gcviewer"
  install -D -m644 "$srcdir/gcviewer.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
