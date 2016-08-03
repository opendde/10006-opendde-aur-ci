# Maintainer: Vincent <ippytraxx@installgentoo.com>

pkgname=gnome-twitch-git
pkgver=r511.7ea58ce
pkgrel=3
pkgdesc="Enjoy Twitch on your GNU/Linux desktop"
arch=('i686' 'x86_64')
url="https://github.com/vinszent/gnome-twitch"
license=('GPL3')
makedepends=('git' 'meson')
depends=('gtk3' 'libsoup' 'json-glib' 'gstreamer' 'gst-libav' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'clutter-gst' 'clutter-gtk' 'webkit2gtk')
install=gnome-twitch-git.install
conflicts=('gnome-twitch')
source=("$pkgname::git+https://github.com/vinszent/gnome-twitch.git")
md5sums=('SKIP')

pkgver()
{
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
    cd "$pkgname"
    rm -rf build
    mkdir build
    cd build
    meson.py --prefix /usr --buildtype release -Ddo-post-install=false ..
    ninja
}

package()
{
    cd "$pkgname"/build
    DESTDIR="$pkgdir" ninja install
}
