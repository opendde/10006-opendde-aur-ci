# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-snapshot
_rpmversion=5.0.2497.10-1
pkgver=5.0.2497.10
pkgrel=1
pkgdesc='An advanced browser made with the power user in mind. Snapshot'
url="https://vivaldi.com"
options=(!strip !zipman)
license=('custom')
arch=('x86_64')
depends=('gtk3' 'libcups' 'nss' 'alsa-lib' 'libxss' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
makedepends=('imagemagick' 'w3m')
optdepends=(
    'vivaldi-snapshot-ffmpeg-codecs: playback of proprietary video/audio'
    'libnotify: native notifications'
)
source=("https://downloads.vivaldi.com/snapshot/vivaldi-snapshot-${_rpmversion}.x86_64.rpm")
sha512sums=('3897da067bbdeb7bd9099b12ecd1401b22719df0b3d05090e278fb284288d0aa2a293b242f6d4a2a73b61e8e05d29731590b4c00e006eefaf0d0aa5fb4077892')

package() {
    cp --parents -a {opt,usr/bin,usr/share} "$pkgdir"

    # suid sandbox
    chmod 4755 "$pkgdir/opt/$pkgname/vivaldi-sandbox"

    # make /usr/bin/vivaldi-snapshot available
    binf="$pkgdir/usr/bin/$pkgname"
    if [[ ! -e "$binf" ]] && [[ ! -f "$binf" ]] && [[ ! -L "$binf" ]]; then
        install -dm755 "$pkgdir/usr/bin"
        ln -s /opt/$pkgname/$pkgname "$binf"
    fi

    # 256 and 24 are proper colored icons
    for res in 128 64 48 32; do
        convert "$pkgdir/opt/$pkgname/product_logo_256.png" \
            -resize ${res}x${res} \
            "$pkgdir/opt/$pkgname/product_logo_$res.png"
    done
    for res in 22 16; do
        convert "$pkgdir/opt/$pkgname/product_logo_24.png" \
            -resize ${res}x${res} \
            "$pkgdir/opt/$pkgname/product_logo_$res.png"
    done

    # install icons
    for res in 16 22 24 32 48 64 128 256; do
        install -Dm644 "$pkgdir/opt/$pkgname/product_logo_${res}.png" \
            "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/$pkgname.png"
    done

    # license
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    w3m -dump "$pkgdir/opt/$pkgname/LICENSE.html" \
        | head -n 5 \
        > "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
