# Maintainer: Vincent Grande <shoober420@gmail.com>
# Maintainer: Aaron Plattner <aplattner@nvidia.com>
# Maintainer: Miguel A. Vico <mvicomoya@nvidia.com>
# Contributor: Eric Toombs
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Sébastien Luttringer
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=weston-eglstream-git
pkgver=8.0.0
pkgrel=1
pkgdesc='Reference implementation of a Wayland compositor with EGLStream support'
arch=('x86_64')
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('glibc' 'wayland' 'libxkbcommon' 'libinput' 'libunwind' 'pixman' 'libdrm' 'pam' 'systemd-libs' 'cairo' 'libpng'  'libjpeg-turbo' 'libwebp' 'mesa' 'glib2' 'lcms2' 'mtdev' 'dbus'
         'libegl' 'libgles' 'pango' 'libva' 'libxcursor' 'colord' 'libpipewire02' 'egl-wayland')
optdepends=('freerdp: support rdp backend'
	    'libx11: support Xwayland'
	    'libxcb: support Xwayland')	 
makedepends=('meson' 'wayland-protocols' 'ninja')
provides=('weston')
conflicts=('weston')
source=(#"https://wayland.freedesktop.org/releases/weston-$pkgver.tar.xz"{,.sig}
	"git://anongit.freedesktop.org/wayland/weston"
        '0001-gl-renderer-Add-EGLDevice-enumeration-support.patch'
        '0002-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch'
        '0003-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch'
        '0004-backend-drm-Gracefully-handle-vblank-and-flip-invali.patch'
        '0005-backend-drm-Add-support-for-EGLDevice-EGLOutput.patch'
        '0006-compositor-Process-stream-attach-requests-with-wl_eg.patch')
sha256sums=('SKIP'
	    'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
 _basever="$(cat "$_basename/meson.build" | \
 sed -n 's/.*version:\s*'\''\([0-9.]\+\)'\''.*/\1/p')"
 cd "$_basename"echo "$_basever.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    #cd weston-$pkgver
    cd weston

    patch -Np1 -i "${srcdir}/0001-gl-renderer-Add-EGLDevice-enumeration-support.patch"
    patch -Np1 -i "${srcdir}/0002-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch"
    patch -Np1 -i "${srcdir}/0003-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch"
    patch -Np1 -i "${srcdir}/0004-backend-drm-Gracefully-handle-vblank-and-flip-invali.patch"
    patch -Np1 -i "${srcdir}/0005-backend-drm-Add-support-for-EGLDevice-EGLOutput.patch"
    patch -Np1 -i "${srcdir}/0006-compositor-Process-stream-attach-requests-with-wl_eg.patch"
}

build() {
    #arch-meson weston-$pkgver build
    arch-meson "build" "weston"
        -Dbackend-drm-screencast-vaapi=false \
        -Dscreenshare=false -Dbackend-rdp=false -Dshell-ivi=false \
        -Dsimple-dmabuf-drm= -Dremoting=false -Db_lto=false
    ninja -C "build"
}

package() {
    DESTDIR="$pkgdir" ninja -C "build" install
    install -Dm644 "weston/COPYING" "$pkgdir/usr/share/licenses/weston-eglstream/COPYING"
}
