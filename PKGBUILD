# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=processing
pkgver=3.5.4
pkgrel=3
arch=(x86_64)
pkgdesc='Programming environment for creating images, animations and interactions'
url='https://www.processing.org/'
license=(GPL LGPL)
# Can upgrade to OpenJDK 10 once java-openjfx has been upgraded to support it
depends=(java-runtime=8 libgl)
makedepends=(apache-ant gendesk java8-openjfx unzip)
options=(!strip)
install=openjdkmsg.install
# The Processing version scheme for the 3.5.x series uses a special magical
# version number above 0266 in addition to the ordinary version number.
# https is not available for reference.zip.
source=("https://github.com/$pkgname/$pkgname/archive/$pkgname-0$((266+${pkgver##3.5.}))-$pkgver.tar.gz"
        'https://download.processing.org/reference.zip'
        build.xml
        errormessage.patch)
sha256sums=('99a5d3cfccd106e79fe82cafa66b72b15c19e5747eac77e40dd0a82b032c2925'
            '2014fdb12f979f79c624acc514c14ce318f07cb2cc15a63e1b4febaff733f2a5'
            '9f4050475b3363eb5e966fa891caea0391b3dcc2cdb68245f1a053b0d7ffb220'
            '1417308bf43bec2a8d178b84043a3e8a498fa164f3bf7d7668ba17cf96de1282')

prepare() {
  gendesk -f -n --pkgname=$pkgname --pkgdesc="$pkgdesc"

  # Symbolic link for not having to repeat the revision number
  ln -sf "$pkgname-$pkgname-"*"-$pkgver" $pkgname

  # Add some details to one of the error messages
  patch -p0 -i errormessage.patch

  # Copy reference.zip to the java directory
  mkdir -p $pkgname/java
  cp "$srcdir/reference.zip" $pkgname/java/

  # Unpack reference.zip
  mkdir -p $pkgname/build/linux/work/modes/java
  unzip -q -u "$srcdir/reference.zip" -d $pkgname/build/linux/work/modes/java

  # Disable the "We only like Java from Sun and Oracle" GUI message
  sed -i 's,Messages.showWarning,\/\*Messages.showWarning,;s,null);,null);\*\/,' \
    "$pkgname/app/src/processing/app/platform/LinuxPlatform.java"

  # Create missing directories
  mkdir -p $pkgname/build/linux/work/java

  # Use the font's built-in hinting instructions
  sed 's|  java|  _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=gasp" java|g' \
    -i $pkgname/build/linux/processing

  # Use a custom build.xml file for ant
  cp -fv build.xml $pkgname/build/build.xml
}

build() {
  cd "$pkgname/build"

  ant build
}

package() {
  cd "$pkgname"

  install -d "$pkgdir/usr/"{bin/,share/$pkgname/}
  cp -r build/linux/work/* "$pkgdir/usr/share/$pkgname/"

  # Desktop shortcut
  install -Dm644 "build/shared/lib/icons/pde-256.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Symbolic links in /usr/bin
  ln -s "/usr/share/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  ln -s "/usr/share/$pkgname/$pkgname-java" "$pkgdir/usr/bin/$pkgname-java"

  # Use /usr/lib/jvm/default-runtime
  rmdir "$pkgdir/usr/share/processing/java"

  # Processing does not work with OpenJDK 10 or 11, use OpenJDK 8
  #ln -s /usr/lib/jvm/default-runtime/ "$pkgdir/usr/share/processing/java"
  ln -s /usr/lib/jvm/java-8-openjdk/ "$pkgdir/usr/share/processing/java"
}

# vim: ts=2 sw=2 et
