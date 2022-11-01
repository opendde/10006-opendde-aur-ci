# Maintainer: Francesco Carmelo Capria <francesco at capria dot eu>

pkgname=waybar-exp-no-systemd-git
pkgver=r2001.d10d9b8
pkgrel=2
pkgdesc='Highly customizable Wayland bar for Sway and Wlroots based compositors, with experimental features enabled and without systemd dependencies (GIT)'
arch=('x86_64')
url='https://github.com/Alexays/Waybar/'
license=('MIT')
provides=('waybar')
conflicts=('waybar')
depends=(
    'gtkmm3'
    'libjsoncpp.so'
    'libsigc++'
    'fmt'
    'wayland'
    'libdate-tz.so'
    'libspdlog.so'
    'gtk-layer-shell'
    'libupower-glib.so'
    'upower'
    'libevdev'
    'libpulse'
    'libnl'
    'libappindicator-gtk3'
    'libdbusmenu-gtk3'
    'libmpdclient'
    'libsndio.so'
    'libxkbcommon'
)
makedepends=(
    'cmake'
    'catch2'
    'meson'
    'scdoc'
    'wayland-protocols'
)
backup=(
    etc/xdg/waybar/config
    etc/xdg/waybar/style.css
)
optdepends=(
    'otf-font-awesome: Icons in the default configuration'
)
source=("${pkgname}::git+https://github.com/Alexays/Waybar"
	meson-build.patch
	meson_options.patch)
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    patch -p1 < ../meson-build.patch
    patch -p1 < ../meson_options.patch
}

build() {
    cd "${srcdir}/${pkgname}"
    rm -rf "${srcdir}/build"
    meson --prefix=/usr \
          --buildtype=plain \
          --auto-features=enabled \
          --wrap-mode=nodownload \
          "${srcdir}/build"
    meson configure -Dexperimental=true "${srcdir}/build"
    ninja -C "${srcdir}/build"
}

package() {
    DESTDIR="$pkgdir" ninja -C "${srcdir}/build" install
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
