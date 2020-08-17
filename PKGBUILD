# Ruijie Yu (first.last@outlook.com)
pkgname=cajviewer-app-image
_pkgname=${pkgname%-app-image}
pkgver=20200306.0.0
pkgrel=1
pkgdesc='Document Viewer for TEB, CAJ, NH, KDH and PDF format'
url="https://cajviewer.cnki.net/download.html"
arch=(any)
license=('Proprietary')
depends=(
    # explicit requirements (upstream website)
    'glibc>=2.24' # original text asks for "libc", which should probably be glibc in arch
    # explicit requirements (error if running binary without package)
    'fuse2'
    # implicit requirements (obtained through ldd)
    'libglvnd' # libGL.so.1 libGLdispatch.so.0 libGLX.so.0
    'libx11' # libX11.so.6
    'libxcb' # libxcb.so.1
    'libxau' # libXau.so.6
    'libxdmcp' # libXdmcp.so.6
    # implied requirements from ldd: assuming base base-devel dependency
    # 'gcc-libs' (libgcc_s.so.1) by "base"
    # 'zlib' (libz.so.1) by "file"
    # 'pcre' (libpcre.so.1) by "grep"
    # 'glib2' (libglib-2.0.so.0) by "gettext"
)
makedepends=(
    'curl'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
    "https://viewer.d.cnki.net/CAJViewer-x86_64-libc-2.24.AppImage"
)
sha512sums=('651e48f6d0d1acc4d5b035b9f3d9cd65188b7d2e524efbd49928dd40fd2d93e2d307e4433d3ecfe0f06c09a0791def95c3bd4a2382a0def348ed67a75ec3ffb7')

# stripping leads to errors unfortunately
options=('!strip')

_install_path="/opt/$_pkgname"
prepare() {
    filename="$(basename "${source[0]}")"
    cd "$srcdir"
    chmod +x "$filename" && "./$filename" --appimage-extract
}

package() {
    squash_path="$srcdir/squashfs-root"
    dest_path="$pkgdir/$_install_path"

    # don't bother whether executable bits are necessary from upstream
    # install executable files as-is
    find "$squash_path/usr" -type f -executable \
        -exec realpath --relative-to "$squash_path" {} \; \
        | xargs -I{} install -Dm0755 "$squash_path/{}" "$dest_path/{}"
    # install nonexecutable files as-is
    find "$squash_path/usr" -type f -not -executable \
        -exec realpath --relative-to "$squash_path" {} \; \
        | xargs -I{} install -Dm0644 "$squash_path/{}" "$dest_path/{}"

    # install launch script
    bin_path="$pkgdir/usr/bin/"
    install -dm0755 "$bin_path"
    ln -st "$bin_path" "$_install_path/usr/bin/cajviewer"
}

