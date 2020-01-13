# Maintainer: Bet4 <0xbet4@gmail.com>

# Special thanks to the following people that provided the
# original PKGBUILD from hyper (https://aur.archlinux.org/packages/hyper/)
# Contributer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: ahrs <Forward dot to at hotmail dot co dot uk>
# Contributor: Aaron Abbott <aabmass@gmail.com>
# Contributer: fleischie
# Contributer: auk

_pkgname=hyper
pkgname=${_pkgname}-git
pkgver=3.0.1.canary.4.r302.g4f3e4522
pkgrel=1
pkgdesc="A terminal built on web technologies"
arch=('any')
url="https://hyper.is/"
license=('MIT')
depends=('nodejs' 'electron' 'gconf')
makedepends=('git' 'yarn' 'python2')
provides=(${_pkgname})
conflicts=(${_pkgname})

# You can set HYPER_BRANCH to master (or another branch) e.g
# export HYPER_BRANCH=master
if [[ -z "$HYPER_BRANCH" ]]
then
  export HYPER_BRANCH="canary"
fi

source=(
    "$pkgname::git+https://github.com/zeit/${pkgname/-git/}.git#branch=$HYPER_BRANCH"
    "disable-auto-update.diff"
    "https://raw.githubusercontent.com/zeit/art/master/hyper/mark/Hyper-Mark-120@3x.png"
    "Hyper.desktop"
)
noextract=()
sha256sums=('SKIP'
         '8b87e4c41b0abe7b98c5e12abd6f74025e0a0e39d9a5a4cafb83e5af036db4c5'
         'a928049af63f49dd270a26c7099dccbe038124e4195507919f2d062e5cd2ecaa'
         'ae29bd930c822c3144817a0e2fe2e2a8253fde90d31b0e19ad7880cd35609ebf')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    patch -p1 < ../disable-auto-update.diff

    # yarn is a build-dep according to the README
    yarn install
}

build() {
    cd "$pkgname"

    # This build command is the same as the one defined in package.json via
    # npm run dist except that it doesn't build for debian, rpm, etc. and
    # doesn't require some other dependencies

    # add node_modules binaries to PATH
    oldpath=$PATH
    PATH=$(pwd)/node_modules/.bin:$PATH

    yarn run build &&
    cross-env BABEL_ENV=production babel target/renderer/bundle.js \
        --out-file target/renderer/bundle.js \
        --no-comments \
        --minified &&
    electron-builder --linux --dir

    PATH=$oldpath
}

package() {
    cd "$pkgname"

    _appdir="/usr/lib/$pkgname"
    _libinstall="${pkgdir}${_appdir}"

    mkdir -p "$pkgdir/usr/bin" "$_libinstall"
    cp -R dist/linux-unpacked/* "$_libinstall"

    # link the binary to /usr/bin
    cd $pkgdir/usr/bin
    ln -s "../lib/$pkgname/resources/bin/hyper" hyper

    # # TODO: remove included electron libs and use the system ones by symlink
    # cd "$_libinstall"
    # rm libnode.so libffmpeg.so
    # ln -s /usr/share/electron/lib{node,ffmpeg}.so .

    install -Dm644 "$srcdir/Hyper.desktop" "$pkgdir/usr/share/applications/Hyper.desktop"
    install -Dm644 "$srcdir/Hyper-Mark-120@3x.png" "$pkgdir/usr/share/pixmaps/hyper.png"
}
