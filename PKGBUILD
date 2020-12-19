# Maintainer: xgdgsc <xgdgsc @t gmail dot com>
# Maintainer: mynacol <paul ät dismail _ de>

pkgname=android-sdk-build-tools
#_ver=$(cat "${srcdir}/$_android/source.properties" |grep ^Pkg.Revision=|sed 's/Pkg.Revision=\([0-9.]*\).*/\1/')
_ver=30.0.3
pkgver=r$_ver
pkgrel=2
pkgdesc='Build-Tools for Google Android SDK (aapt, aidl, dexdump, dx, llvm-rs-cc)'
arch=('i686' 'x86_64')
url="https://developer.android.com/studio/releases/build-tools"
license=('custom')
depends=('gcc-libs' 'zlib')
optdepends=('lib32-gcc-libs' 'lib32-zlib')

source=("https://dl-ssl.google.com/android/repository/build-tools_${pkgver}-linux.zip")
sha512sums=('7e5d1f672b249d074ba3b1a175bff987983d8e47c573856d5088ebde0be2db0de83c9ee8b8d4a99a358040d50e67a5a135a593feca8997921d818e2d74cdc090')
options=('!strip')

_sdk=android-sdk
_android=android-11

package() {
  cd "$pkgdir"

  install -Dm644 "${srcdir}/$_android/NOTICE.txt" usr/share/licenses/$pkgname/NOTICE.txt

  target="opt/$_sdk/build-tools/$_ver"
  mkdir -p "$target"
  cp -r "$srcdir/$_android/"* "$target"
  chmod +Xr -R "$target"

  # Add binaries to PATH
  mkdir -p etc/profile.d
  echo "append_path '/$target'" > etc/profile.d/${pkgname}.sh
  chmod 755 etc/profile.d/${pkgname}.sh
}
