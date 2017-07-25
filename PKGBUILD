# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

# ToDo: Enable propretary codec
# Bugs: Permission issue, wants to write to /opt/depot_tools/external_bin chmod -R a+w :/

pkgname=nwjs
pkgver=0.23.6
pkgrel=4
pkgdesc="node-webkit is an app runtime based on Chromium and node.js"
arch=("i686" "x86_64")
url="https://nwjs.io/"
license=("MIT")
depends=("alsa-lib" "gconf" "gtk2" "nss" "ttf-font" "libxtst" "libxss")
makedepends=("depot-tools-git")
optdepends=(
    "nodejs: npm package support"
    "nw-gyp: native add-on build tool for node-webkit"
)
source=("nwjs-nw-v${pkgver}.tar.gz::https://github.com/nwjs/nw.js/archive/nw-v${pkgver}.tar.gz"
	"node-nw-v${pkgver}.tar.gz::https://github.com/nwjs/node/archive/nw-v${pkgver}.tar.gz"
	"v8-nw-v${pkgver}.tar.gz::https://github.com/nwjs/v8/archive/nw-v${pkgver}.tar.gz"
	"chromium-nw-v${pkgver}.tar.gz::https://github.com/nwjs/chromium.src/archive/nw-v${pkgver}.tar.gz")
sha512sums=("b7a03e3b09c5c439af68e728b21e500fed2eb940b25c4b0c712bb0eefbf9c7e17524fcaf13b15c2489437f1f484f45c46afe46023f2be723347f27e59ee5b431"
	    "aa0d6cf62dfd0f07b75bcfb8db30525669f13a2ee699225fc37bb13c00b3c67daa0a65d68af0b98a284cc3a31e3b5fe40ff8157b28747ae197059aaa9409148f"
	    "698fbc1924048b5043b3607b06d85cdbe295bb0fab0234ed15b89778da75dd63006662fb48371c8b7ed91a1209b42d4397e9fb06787a06addf2f17e8d4d43ce9"
	    "86b94a63b0da1d1644d76c57be326adbde8f82c6cf704e2990f9e812d5d7a5d367b1d0f33304b9878ed02db77c4958099e438b6d96e7d3b6f1924b0d862a68fc")

prepare() {
  cd "${srcdir}/"
  mkdir -p path
  ln -s /usr/bin/python2 path/python
}
  
build() {
  cd "${srcdir}/"
  mkdir -p nwjs
  cd nwjs

  export PATH="/opt/depot_tools:$PATH"
  export PATH="${srcdir}/path:$PATH"

  gclient config --name=src https://github.com/nwjs/chromium.src.git@origin/nw17
  gclient sync --with_branch_heads --nohooks

  mv "${srcdir}/nw.js-nw-v${pkgver}" src/content/nw
  mv "${srcdir}/node-nw-v${pkgver}" src/third_party/node-nw
  mv "${srcdir}/v8-nw-v${pkgver}" src/v8

  gclient sync --with_branch_heads

  cd src
  gn gen out/nw

  GYP_CHROMIUM_NO_ACTION=0 ./build/gyp_chromium -I third_party/node-nw/common.gypi third_party/node-nw/node.gyp

  ninja -C out/nw nwjs
  ninja -C out/Release node
  ninja -C out/nw copy_node

}

package() {
  cd "$srcdir/$_pkgname-v$pkgver-linux-$_arch"
  install -Ddm755 "$pkgdir/opt/$_pkgname"
  install -Ddm755 "$pkgdir/usr/bin"
  chmod -R +r *
  chmod +x nw lib lib/lib{ffmpeg,node,nw}.so locales
  cp -r * "$pkgdir/opt/$_pkgname"
  ln -s "/opt/$_pkgname/nw" "$pkgdir/usr/bin/nw"
}
