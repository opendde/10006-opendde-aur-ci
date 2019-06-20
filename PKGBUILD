# Maintainer: Tim Visee <tim@visee.me>
#
# This PKGBUILD is managed externally, and is automatically updated here:
# - https://gitlab.com/timvisee/ffsend/blob/master/pkg/aur/ffsend/PKGBUILD
# - Mirror: https://github.com/timvisee/ffsend/blob/master/pkg/aur/ffsend/PKGBUILD

pkgname=ffsend
pkgver=0.2.48
pkgrel=1
pkgdesc="Easily and securely share files from the command line. A Firefox Send client."
url="https://gitlab.com/timvisee/ffsend"
license=('GPL3')
source=("ffsend-v$pkgver.tar.gz::https://gitlab.com/timvisee/ffsend/-/archive/v0.2.48/ffsend-v0.2.48.tar.gz")
sha256sums=('ed4daf48493e4936b82225cb36bccd5eaac490ab29c5bedbc6e93d968b07e621')
arch=('x86_64' 'i686')
provides=('ffsend')
depends=('ca-certificates')
makedepends=('openssl>=1.0' 'rust>=1.32' 'cargo' 'cmake')
optdepends=('xclip: clipboard support'
            'bash-completion: support auto completion for bash')

build() {
    cd "ffsend-v$pkgver"
    env CARGO_INCREMENTAL=0 cargo build --release
}

package() {
    cd "$srcdir/ffsend-v$pkgver"

    # Install Binary
    install -Dm755 "./target/release/ffsend" "$pkgdir/usr/bin/ffsend"

    # Install completions
    cd "./contrib/completions"
    install -Dm644 "ffsend.bash" "$pkgver/usr/share/bash-completion/completions/ffsend"
    install -Dm644 "ffsend.fish" "$pkgver/usr/share/fish/vendor_completions.d/ffsend.fish"
}
