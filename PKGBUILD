# Maintainer: Andrei Alexeyev <akari@alienslab.net>
# Contributor: Frantic1048 <archer@frantic1048.com>
# Contributor: Fredrick Brennan <admin@8chan.co>

pkgname=waifu2x-git
pkgver=0.13.1.r39.g7dad4bc
pkgrel=1
epoch=1
pkgdesc="Image rescaling and noise reduction using the power of convolutional neural networks"
arch=('any')
url="https://github.com/nagadomi/waifu2x"
license=('MIT')
groups=()
depends=(
    'luajit'
    'lua51-penlight'
    'lua51-graphicsmagick-git'
    'graphicsmagick' # XXX: lua51-graphicsmagick-git should require this
    'lua-moses-git'
    'torch7-sys-git'
    'torch7-cutorch-git'
    'torch7-cunn-git'
    'torch7-image-git'
    'torch7-xlua-git' # XXX: torch7-image-git should require this
    'torch7-dok-git' # XXX: torch7-image-git should require this
)
makedepends=(
    'git'
    'cmake'
    'make'
    'pkg-config'
)
optdepends=(
    'torch7-cudnn-r7-git: for CUDNN backend'
)
provides=('waifu2x')
conflicts=('waifu2x')
replaces=()
backup=()
options=()
install=
source=(
    'git+https://github.com/nagadomi/waifu2x.git'
    'waifu2x.sh'
    '0001-Use-absolute-path-to-models-directory.patch'
)
noextract=()
md5sums=('SKIP'
         'f6e182a8278a4dd9b4a9168200d7666b'
         '0942efd456a6f6a83bff9c21759876e6'
)

prepare() {
    cd waifu2x
    patch -Np1 -i "$srcdir/0001-Use-absolute-path-to-models-directory.patch"
}

package() {
    cd waifu2x
    local prefix="$pkgdir/usr/share/${pkgname%%-git}"

    for luafile in {.,lib}/*.lua; do
        install -Dm644 "$luafile" "$prefix/$luafile"
        luajit -b "$prefix/$luafile" "$prefix/$luafile"
    done

    cp -dpr --no-preserve=ownership models "$prefix/models"
    install -Dm755 "$srcdir/waifu2x.sh" "$pkgdir/usr/bin/waifu2x"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
    cd waifu2x
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
