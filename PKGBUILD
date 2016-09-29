# Contributor: sen <sen@archlinux.us>
# Contributor: TheNiceGuy <gabriel14_wii@hotmail.com>

pkgname=spek-git
pkgver=0.8.3.r98.g5b24d78
pkgrel=1
pkgdesc='Spek helps to analyse your audio files by showing their spectrogram.'
arch=('i686' 'x86_64')
license=('GPL')
depends=('ffmpeg' 'desktop-file-utils' 'wxgtk')
makedepends=('git' 'pkgconfig' 'automake' 'intltool')
url='http://www.spek-project.org/'
conflicts=('spek')
provides=('spek-git')
source=('spek-git::git+https://github.com/alexkay/spek')
md5sums=('SKIP')
options=()

pkgver() {
    cd $pkgname
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$pkgname"

    ./autogen.sh --prefix=/usr
    make DESTDIR=$pkgdir install
}
