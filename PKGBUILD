# Maintainer : Michael DeGuzis <mdeguzis@gmail.com>
# Contributor: Nick Shvelidze <captain@pirrate.me>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: K. Hampf <khampf@users.sourceforge.net>
# Contributor: Skunnyk <skunnyk@archlinux.fr>

# Build notes:
# http://wiki.playonlinux.com/index.php/Building_PlayOnLinux_5

_pkgname=playonlinux5
pkgname=$_pkgname-git
pkgver=r1262.6404de4
pkgrel=3
epoch=2
pkgdesc="GUI for managing Windows programs under linux (development version based on Java)"
arch=('any')
url="http://www.playonlinux.com/"
license=('GPL')
makedepends=('gradle' 'maven' 'java-openjfx' 'jdk8-openjdk')
depends=('wine')
options=(!strip)
source=("$_pkgname::git://github.com/PlayOnLinux/POL-POM-5.git"
        'PlayOnLinux5.desktop')
md5sums=('SKIP'
         '7fe925810fc7ec6d8745817b1c541e7b')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"

  # Set environment
  export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"

  # Clean up
  mvn clean

  # Build
  mvn package
}

package() {
  # Extract
  install -d "$pkgdir/opt/"
  bsdtar -xf "$_pkgname/phoenicis-dist/target/phoenicis-dist.zip"
  cp -r phoenicis-dist/ "$pkgdir/opt/$_pkgname/"

  # Launcher
  install -d "$pkgdir/usr/bin/"
  ln -s "/opt/$pkgname/PlayOnLinux.sh" "$pkgdir/usr/bin/$_pkgname"
  sed -i 's|$(dirname $0)|/opt/playonlinux5|' "$pkgdir/opt/$_pkgname/PlayOnLinux.sh"

  # Icon + Desktop
  install -Dm644 "$srcdir/$_pkgname/phoenicis-javafx/target/classes/com/playonlinux/javafx/common/playonlinux.png" \
                 "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 PlayOnLinux5.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
