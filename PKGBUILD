# Maintainer: xgdgsc <xgdgsc @t gmail dot com>

pkgname=android-sdk-build-tools
_ver=23.0.3
pkgver=r$_ver
pkgrel=1
pkgdesc='Build-Tools for Google Android SDK (aapt, aidl, dexdump, dx, llvm-rs-cc)'
arch=('i686' 'x86_64')
url="http://developer.android.com/sdk/index.html"
license=('custom')
depends=('gcc-libs' 'zlib')
optdepends=()

if [[ $CARCH = x86_64 ]]; then
  depends=('lib32-gcc-libs' 'lib32-zlib')
fi

_sdk=android-sdk

source=("https://dl-ssl.google.com/android/repository/build-tools_${pkgver}-linux.zip")
sha1sums=('368f2600feac7e9b511b82f53d1f2240ae4a91a3')
_android=android-6.0
options=('!strip')

package() {

  cd "$pkgdir"
  install -Dm644 "${srcdir}/$_android/NOTICE.txt" usr/share/licenses/$pkgname/NOTICE.txt
  # mkdir -p opt etc/profile.d
  # echo 'export PATH=$PATH:/opt/android-sdk/build-tools/'"$_ver/" > etc/profile.d/${pkgname}.sh
  # echo 'setenv PATH ${PATH}:/opt/android-sdk/build-tools/'"$_ver/" > etc/profile.d/${pkgname}.csh
  # chmod 755 etc/profile.d/${pkgname}.{csh,sh}

  mkdir -p opt/$_sdk/build-tools/$_ver
  cp -r "$srcdir/$_android/"* "$pkgdir/opt/$_sdk/build-tools/$_ver"
  chmod +Xr -R "$pkgdir/opt/$_sdk/build-tools/$_ver"
}
