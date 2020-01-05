# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=molotov
pkgver=4.2.2
pkgrel=2
pkgdesc="Streaming access to French (only) TV channels."
arch=('i686' 'x86_64')
url="http://www.molotov.tv/"
license=('unknown')
depends=('fuse' 'desktop-file-utils' 'xdg-utils')
makedepends=('p7zip')
options=('!strip')
source=("Molotov-${pkgver}.AppImage::http://desktop-auto-upgrade.molotov.tv/linux/${pkgver}/$pkgname.AppImage"
        'molotov')
sha256sums=('1ff500ec303a86a03d4f09e7ed05485080ada69b478fa8298c8b6b4f5cd6e802'
            '3a2d0c45ec2a964b229ee44a729d5d86319d573296ca44c8a33e171ce23a3b47')

prepare() {
    cd $srcdir
    chmod u+x Molotov-${pkgver}.AppImage
    ./Molotov-${pkgver}.AppImage --appimage-extract &> /dev/null
}

build() {
    cd $srcdir
    sed -i "s/^Exec=AppRun$/Exec=$pkgname/" squashfs-root/molotov.desktop
    sed -i "s/^Categories=AudioVideo/Categories=Video;Player;AudioVideo/" squashfs-root/molotov.desktop
    sed -i "s/MOLOTOV_VERSION/${pkgver}/g" molotov
}

package() {
    cd $srcdir

    install -d -m755 $pkgdir/usr/share/{applications,icons/hicolor}
    install -d -m755 $pkgdir/opt/appimages
    # TODO find a decent license
    #install -d -m755 $pkgdir/usr/share/licenses/$pkgname

    hicolor="squashfs-root/usr/share/icons/hicolor"
    for size in $(ls -1 $hicolor); do
        install -d -m755 $pkgdir/usr/share/icons/hicolor/$size/apps
        install -D -m644 $hicolor/$size/apps/molotov.png $pkgdir/usr/share/icons/hicolor/$size/apps/molotov.png
    done

    install -D -m644 squashfs-root/molotov.desktop $pkgdir/usr/share/applications/appimagekit-molotov.desktop
    install -D -m755 molotov $pkgdir/usr/bin/molotov
    install -D -m755 Molotov-$pkgver.AppImage $pkgdir/opt/appimages/Molotov-$pkgver.AppImage
    rm -r squashfs-root
}


# Local Variables:
# sh-basic-offset: 4
# End:
