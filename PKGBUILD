# Maintainer: Almir Dzinovic <almir@dzinovic.net>
# Contributor: Alexander Pavel <alexpavel123@gmail.com>

pkgname=mattermost-desktop-bin
_pkgname=mattermost-desktop
pkgver=3.7.0
pkgrel=5
pkgdesc="Mattermost Desktop (Beta) for Linux (binary)"
arch=('i686' 'x86_64')

url="https://github.com/mattermost/desktop"
license=('Apache')

makedepends=()
depends=('gtk2' 'libxtst' 'libxss' 'gconf' 'nss' 'nspr' 'alsa-lib')
optdepends=()

conflicts=('mattermost-desktop')
provides=("${_pkgname}")

install=$pkgname.install

source=(${_pkgname}.desktop)
source_x86_64=("https://releases.mattermost.com/desktop/${pkgver}/${_pkgname}-${pkgver}-linux-x64.tar.gz")
source_i686=("https://releases.mattermost.com/desktop/${pkgver}/${_pkgname}-${pkgver}-linux-ia32.tar.gz")
sha512sums=('0b5eeb8c9e17bda686ac456fcdb89278028ea71ffe7560b211ce72b1327d04c1a9f1e2fe1b851354aa046362589501a4f48eb1c64a17ffe6b21d91762343a1be')
sha512sums_x86_64=('f46f13045850579c49a87ab2a01caf3c3d95ac6bb9bc807c414413df6804ea36342bbc0a31a75d10a3b048dc3ac5a3efe8c26883c0705aec8875900366b9b58a')
sha512sums_i686=('159e81dd0cf259cf32ca1b55905579df1b0227dd423a2fa71ee3b1c297ca8ca935ff4fba729e512edbc58358caa8dd1b1f5d565045b8cb56c49f1220c5092a72')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    install -d -m 755 "${pkgdir}"/usr/lib/mattermost

    cp -r * "$pkgdir/usr/lib/mattermost"

    install -d -m 755 "$pkgdir/usr/bin"
    ln -s /usr/lib/mattermost/${_pkgname} "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$pkgdir/usr/lib/mattermost/icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
