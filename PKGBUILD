# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Sebastian Lau <lauseb644@gmail.com>

_pkgname=libx264
pkgname=lib32-$_pkgname
_pkgbase=x264
pkgver=152.20171224
pkgrel=1
pkgdesc='Free library for encoding H264/AVC video streams (32 bit)'
arch=('x86_64')
url='http://www.videolan.org/developers/x264.html'
license=('GPL')
makedepends=('git' 'gcc-multilib' 'nasm' 'l-smash')
depends=("${_pkgname}" 'lib32-glibc')
provides=('libx264.so')
#conflicts=('lib32-libx264-stable-git')
_commit='e9a5903edf8ca59ef20e6f4894c196f135af735e'
source=("git://git.videolan.org/x264.git#commit=${_commit}")
md5sums=('SKIP')

build() {
cd ${srcdir}/${_pkgbase}
./configure --libdir=/usr/lib32 --host=i686-linux-gnu \
	--prefix=/usr \
	--enable-shared \
	--enable-pic
make
}

package() {
cd ${srcdir}/${_pkgbase}
make DESTDIR="$pkgdir/" install-lib-shared
rm -rf $pkgdir/usr/include/
}
