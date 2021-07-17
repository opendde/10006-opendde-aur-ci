## Maintainer: Cain Atkinson <yellowsink@protonmail.com>

pkgname=armcord-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Discord client for lower end and ARM devices."
arch=('x86_64' 'aarch64')
provides=('armcord')
url="https://github.com/smartfrigde/armcord"
license=('MIT')
options=(!strip)

source_x86_64=("armcord.tar.gz::https://github.com/smartfrigde/armcord/releases/download/v2.5.0/ArmCord-2.5.0.tar.gz")
sha256sums_x86_64=("62e71be81f56eaf99e59b24dc07878fa1579dc0caf71e1ea57091bbf02dfd547")
source_aarch64=("armcord.tar.gz::https://github.com/ArmCord/ArmCord/releases/download/v2.5.0/ArmCord-2.5.0-arm64.tar.gz")
sha256sums_aarch64=("6c9e02d91c264fe24b1eb2c26e7cd52d9a4fb95eae78f675608161db7ae56195")

package() {
    echo "CPU arch: $CARCH"
    # enter directory
    if [ $CARCH = "x86_64" ]; then
        cd "$srcdir/ArmCord-2.5.0"
    fi
    if [ $CARCH = "aarch64" ]; then
        cd "$srcdir/ArmCord-2.5.0-arm64"
    fi

    # move all files to the appropriate place
    mkdir -p "$pkgdir/opt/armcord"
    cp -r * "$pkgdir/opt/armcord/"

    # fix perms
    chmod 644 -R "$pkgdir/opt/armcord/"*
    chmod 755 "$pkgdir/opt/armcord/armcord"

    # create link
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/armcord/armcord" "$pkgdir/usr/bin/armcord"
}
