# Maintainer: Matthias Lisin <ml@visu.li>
# Contributor: sum01 <sum01@protonmail.com>
pkgname=rocketchat-desktop
pkgver=2.16.0
_srcname="Rocket.Chat.Electron-$pkgver"
pkgrel=1
pkgdesc='Rocket.Chat Native Cross-Platform Desktop Application via Electron.'
arch=('i686' 'x86_64')
url="https://github.com/RocketChat/Rocket.Chat.Electron"
license=('MIT')
depends=('electron')
makedepends=('gulp' 'nodejs' 'node-gyp' 'python2' 'yarn')
optdepends=('hunspell-en_US: spell checking')
conflicts=('rocketchat-client-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        rocketchat-desktop
        fix-build.patch
        fix-spellchecking.patch
        rocketchat-desktop.desktop)
sha512sums=('c6111ad391d9b62003d503274a60b32d0af3b79f58ee2caf35381d88cf861079f361f79977c3487b5eed999b8a4c45e5e0f79ebd0e0ad2168fd3c929de070f09'
            '09c770d09973ce0aa2299c9162788d387fc558e95ad0b11596e199a6c67edc5c5258e8ec4bd73c84b494a1d20931fc50c16efc74311930158edd8cf704285351'
            'f614b29f3fb330e870edd51a3f1b9ca05c72c2c937a5a4d23797947751d55f8ac8db217f8edbe277e721c1a07f5bc84fd0be7a4903a7d991f7a9eb9625f34ce9'
            '030f7088dcff15cfe6f7f16814f800d92a833f2ac53eb373554587b64979f77081013c93dd7559b8198aa8aa2bf871e422c6c86d579936c7378670dac52944e8'
            'd87664b9bdf30eac3011393d094962e0d568a94b5eaf4c8e5f17529442dcba905cea7341527066102a97a07a981acd6ce045b8737eb78a7d81a2a2d05023fe26')
if [[ $CARCH == "i686" ]]; then
    _releasename="release:linux-ia32"
    _distname="linux-ia32-unpacked"
else
    _releasename="release:linux-x64"
    _distname="linux-unpacked"
fi

prepare() {
    for patch in *.patch; do
        patch -p1 -d "$_srcname" < "$patch"
    done
}

build() {
    cd "$_srcname"
    yarn upgrade "electron@$(sed 's/^v//' </usr/lib/electron4/version)" --non-interactive --cache-folder "$srcdir/yarn-cache"
    NODE_ENV=production yarn gulp build "$_releasename"
}

package() {
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    cd "$_srcname"
    install -Dm644 "build/icons/512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "dist/$_distname/resources/app.asar" "$pkgdir/usr/lib/$pkgname.asar"
}
