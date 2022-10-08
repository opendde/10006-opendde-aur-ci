# Maintainer: Christian Schendel (doppelhelix@gmail.com)
# Maintainer: Kevin Concilio (kevin.concilio1@gmail.com)

pkgname=gnome-shell-extension-pano
pkgver=10
pkgrel=3
pkgdesc="Next-gen Clipboard Manager (forked from -git package)"
arch=('any')
url="https://github.com/oae/gnome-shell-pano"
license=('GPL2')
depends=('gnome-shell>=42'
         'libgda'
         'gsound')
makedepends=('gobject-introspection'
             'yarn'
             'appstream')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=(21754ab62c1c5c1f2d700fb535759ed2)

prepare() {
  cd "gnome-shell-pano-$pkgver"
  yarn install
}

build() {
  cd "gnome-shell-pano-$pkgver"
  yarn build:package
}

package() {
  cd "gnome-shell-pano-$pkgver/dist"
  
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  local schema=$(grep -Po '(?<="settings-schema": ")[^"]*' metadata.json).gschema.xml
  local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
  
  install -d "${destdir}"
  bsdtar xvf ${uuid}.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/"
  install -Dm644 "schemas/${schema}" -t "${pkgdir}/usr/share/glib-2.0/schemas/"
  
  rm -rf "${destdir}/schemas"
}

