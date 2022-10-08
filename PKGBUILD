#Maintainer: zebdo <zebdo [at] posteo [dot] ee>

pkgname=flipflip-bin
pkgver=3.2.1
pkgrel=1
pkgdesc="The latest pre-compiled package from the official GitHub page - a glorified slideshow, with lots of bells and whistles"
url="https://github.com/ififfy/flipflip"
arch=('x86_64')
makedepends=('wget' 'unzip')
license=('MIT')
source=("flipflip.sh" "flipflip.desktop" 
        "FlipFlip-Linux.zip::https://github.com/ififfy/flipflip/releases/download/v${pkgver}/FlipFlip-Linux.zip")
sha256sums=('456141af40b4d96c8d3fc6f5b31306e8db625fde1db48bbfa3e1f44e7cc8895f'
            'a8b776757171dc59876c9f0e938328beff3ab7c8f12dc38cde8caa063ddc3038'
            'dc5792e769f0df650b159084d9147421c49439651a25ef14d9c50e102b857028')

package() {
    # extract zip file
    unzip FlipFlip-Linux.zip
    
    # install license
    cd "${srcdir}/FlipFlip-linux-x64"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

    # move package into its resting place
    cd ${srcdir}
    cp -r FlipFlip-linux-x64 $pkgdir/usr/share/flipflip
    rm -fr FlipFlip-linux-x64

    # install .desktop file and bash launch script
    install -Dm644 "flipflip.desktop" "$pkgdir/usr/share/applications/flipflip.desktop"
    install -Dm755 "flipflip.sh" "$pkgdir/usr/bin/flipflip"
}
