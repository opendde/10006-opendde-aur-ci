# Maintainer: filips <projects at filips dot si>
# Maintainer: Peter Cai <peter at typeblog dot net>
# Contributor: TheFool <rn6l05d28@relay.firefox.com>

# This file is automatically updated/generated on every package release
# Any changes made directly to the AUR repository will be overwritten
# Please contribute changes to the main GitHub repository instead
# See: https://github.com/filips123/PWAsForFirefox/blob/main/native/packages/aur/firefox-pwa/PKGBUILD

_pkgname="PWAsForFirefox"
pkgname="firefox-pwa"
pkgdesc="A tool to install, manage and use Progressive Web Apps (PWAs) in Mozilla Firefox (native component)"
pkgver="1.3.2"
pkgrel=1
url="https://github.com/filips123/PWAsForFirefox"
arch=("x86_64" "i686")
license=("MPL2")

makedepends=("rust" "cargo")
optdepends=("firefox: Support for browser extension")
install=package.install

source=("$pkgname-$pkgver.tar.gz::https://github.com/filips123/PWAsForFirefox/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f9b987f7104efc40b2c2e64fdeb65c4c027cdffdedcf15b2d07d811bc8385717')
b2sums=('582791ce90538a113f1a0eb46fb62671f8757a57e8b16573e6f3563d4b18e3d3157648b76e68f5f6318028572bdb9a5b1f77434777d30d932311e52343fc237c')

prepare() {
    cd $srcdir/$_pkgname-$pkgver/native/

    # Set the correct version in source files
    sed -i "s/version = \"0.0.0\"/version = \"$pkgver\"/g" Cargo.toml
    sed -i "s/DISTRIBUTION_VERSION = '0.0.0'/DISTRIBUTION_VERSION = '$pkgver'/g" userchrome/profile/chrome/pwa/chrome.jsm

    # We don't use libexec on Arch
    sed -i "s@/usr/libexec/firefoxpwa-connector@/usr/lib/firefoxpwa/firefoxpwa-connector@g" manifests/linux.json
}

build() {
    cd $srcdir/$_pkgname-$pkgver/native/
    RUSTUP_TOOLCHAIN=stable cargo build --release
}

check() {
    cd $srcdir/$_pkgname-$pkgver/native/
    [ "$(./target/release/firefoxpwa --version)" == "firefoxpwa $pkgver" ]
}

package() {
    cd $srcdir/$_pkgname-$pkgver/native/

    # Executables
    install -Dm755 target/release/firefoxpwa $pkgdir/usr/bin/firefoxpwa
    install -Dm755 target/release/firefoxpwa-connector $pkgdir/usr/lib/firefoxpwa/firefoxpwa-connector

    # Manifest
    install -Dm644 manifests/linux.json $pkgdir/usr/lib/mozilla/native-messaging-hosts/firefoxpwa.json

    # Completions
    install -Dm755 target/release/completions/firefoxpwa.bash $pkgdir/usr/share/bash-completion/completions/firefoxpwa
    install -Dm755 target/release/completions/firefoxpwa.fish $pkgdir/usr/share/fish/vendor_completions.d/firefoxpwa.fish
    install -Dm755 target/release/completions/_firefoxpwa $pkgdir/usr/share/zsh/vendor-completions/_firefoxpwa

    # Documentation
    install -Dm644 ../README.md $pkgdir/usr/share/doc/firefoxpwa/README.md
    install -Dm644 ../native/README.md $pkgdir/usr/share/doc/firefoxpwa/README-NATIVE.md
    install -Dm644 ../extension/README.md $pkgdir/usr/share/doc/firefoxpwa/README-EXTENSION.md
    install -Dm644 packages/debian/copyright $pkgdir/usr/share/doc/firefoxpwa/copyright

    # UserChrome
    mkdir -p $pkgdir/usr/share/firefoxpwa/userchrome/
    cp -r userchrome/* $pkgdir/usr/share/firefoxpwa/userchrome/
}
