# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: xduugu
# Contributor: Elis Hughes <elishughes@googlemail.com>

pkgname=lib32-rtmpdump
_pkgname=rtmpdump
pkgver=2.4.r96.fa8646d
pkgrel=1
epoch=1
pkgdesc='Tool to download rtmp streams (lib32)'
arch=('x86_64')
url='http://rtmpdump.mplayerhq.hu/'
license=('GPL2' 'LGPL2.1')
depends=('lib32-glibc' 'lib32-openssl' 'lib32-zlib' "${_pkgname}")
makedepends=('git')
provides=('librtmp.so')
options=('!makeflags')
_commit='fa8646d'
source=("git://git.ffmpeg.org/rtmpdump#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
cd rtmpdump
_ver_name='2.4'
_ver_commit='c28f1bab7822de97353849e7787b59e50bbb1428'

echo "${_ver_name}.r$(git rev-list --count ${_ver_commit}..HEAD).${_commit}"
}

prepare() {
cd rtmpdump
sed -i -e 's:gcc:gcc -m32:' Makefile librtmp/Makefile
sed -i -e 's/host_cpu\=\"\${host\%\%-\*}\"/host_cpu\="i386"/' Makefile librtmp/Makefile
sed -i -e 's/march\=\"\${march\%\%-\*}\"/march\="i386"/' Makefile librtmp/Makefile
}

build() {
cd rtmpdump
make \
  OPT="$CFLAGS" \
  XLDFLAGS="$LDFLAGS"
}

package() {
cd rtmpdump
make \
  prefix='/usr' \
  sbindir='/usr/bin' \
  mandir='/usr/share/man' \
  DESTDIR="${pkgdir}" \
  libdir='/usr/lib32' \
  install

rm -rf "${pkgdir}/usr"/{bin,include,sbin,share}

}