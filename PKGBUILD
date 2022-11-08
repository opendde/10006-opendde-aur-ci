# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-rounded-window-corners
pkgver=9
pkgrel=1
pkgdesc="A GNOME Shell extension that adds rounded corners for all windows"
arch=('any')
url="https://github.com/yilozt/rounded-window-corners"
license=('GPL3')
depends=('gnome-shell' 'libadwaita')
makedepends=('gobject-introspection' 'yarn')
source=("rounded-window-corners-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('f0a82059a00e22cff5322d89327674d6b61f76040e790114d80c602957f10dba')

build() {
  cd "rounded-window-corners-$pkgver"
  yarn config set cache-folder "$srcdir/yarn-cache"
  yarn install
  yarn build

  pushd _build
  gnome-extensions pack \
            --extra-source=dbus/ \
            --extra-source=effect/ \
            --extra-source=manager/ \
            --extra-source=preferences/ \
            --extra-source=utils/ \
            --extra-source=stylesheet-prefs.css \
            --force
  popd
}

package() {
  cd "rounded-window-corners-$pkgver"
  local uuid=$(grep -Po '(?<="uuid": ")[^"]*' _build/metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf "_build/${uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/"

  cp -r _build/locale "$pkgdir/usr/share/"

  install -Dm644 _build/schemas/org.gnome.shell.extensions.rounded-window-corners.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/schemas/"
}
