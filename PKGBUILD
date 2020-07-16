# Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>, Marcel Unbehaun <f.rostze.ux at gmail dot com>
pkgname=steamtinkerlaunch
pkgver=0.99.1
pkgrel=1
pkgdesc="Wrapper script for Steam custom launch options"
arch=('any')
url="https://github.com/frostworx/steamtinkerlaunch"
license=('GPL3')
depends=('bash')
makedepends=('git')
optdepends=(
    'strace'
    'zenity'
    'gamemode'
    'mangohud'
    'vkbasalt'
    'winetricks'
    'wget: for optional reshade download'
    'unzip: for optional reshade download'
    'git: for pulling optional shaders'
    'xdotool: for playing regular games side-by-side in VR'
    'xorg-xwininfo: for playing regular games side-by-side in VR'
    'vr-video-player: for playing regular games side-by-side in VR'
    'xdg-utils: for opening the ProtonDB URL of started game'
    'nyrna: for using nyrna per game'
)
_commit='c10d1ab0f58b2403a4efc62b9877d939b95a9264'
source=("git+https://github.com/frostworx/steamtinkerlaunch.git#commit=$_commit")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf $(grep 'PROGVERS=' stl | head -n1 | cut -d\" -f2 | sed 's/^v//')
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 stl -t "$pkgdir/usr/bin"

    install -d "$pkgdir/usr/share/stl"
    cp -r sbs tweaks "$pkgdir/usr/share/stl"

    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
