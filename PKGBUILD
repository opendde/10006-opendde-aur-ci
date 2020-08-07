#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=nutstore-experimental
pkgver=5.0.1
pkgrel=1
pkgdesc='Nutstore experimental version.'
arch=(x86_64)
url='https://www.jianguoyun.com/'
license=(custom)
depends=(libappindicator-gtk3 libnotify python-gobject)
optdepends=('nautilus-nutstore: Nautilus plugin')
provides=(nutstore)
conflicts=(nutstore)
source=(nutstore license)
source_x86_64=("https://www.jianguoyun.com/static/exe/ex/$pkgver/nutstore_client-$pkgver-linux-x64-public.tar.gz")
sha256sums=('a4aa358d45b306cbeac449f2256f00a5b81a95197394eba7efa96eaae820cf5b'
            'f3d2861ff48f2d193a4eced23a02b4eba9fab4c1d3f727e934ed7c59f38f0f7e')
sha256sums_x86_64=('e4774d958bdeb626a5ab8d05dac32b392d6dc17148c7bef2037f80f404baf88d')

build() {
    cd $srcdir/gnome-config
    sed -i '/Exec=/s|~/\.nutstore/dist/bin/nutstore-pydaemon.py|/usr/bin/nutstore|' menu/nutstore-menu.desktop
    sed -i '/Exec=/s|~/\.nutstore/dist|/opt/nutstore|' autostart/nutstore-daemon.desktop
    cd $srcdir/bin
    python -m compileall .
}

package() {
    cd $srcdir
    install -D -m755 nutstore $pkgdir/usr/bin/nutstore
    install -D -m644 license $pkgdir/usr/share/licenses/nutstore/license
    rm nutstore license *.tar.gz
    mkdir -p $pkgdir/opt/nutstore && cp -aR ./ $pkgdir/opt/nutstore
    install -D -m644 gnome-config/menu/nutstore-menu.desktop $pkgdir/usr/share/applications/nutstore.desktop
    install -D -m644 app-icon/nutstore.png $pkgdir/usr/share/icons/hicolor/64x64/apps/nutstore.png
}
