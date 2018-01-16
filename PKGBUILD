# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: zxalexis <zxalexis@gmail.com>

set -u
pkgname='wipefreespace'
pkgver='2.2.2'
pkgrel='1'
pkgdesc='Securely wipe the free space on an ext2/3/4,NTFS, XFS,ReiserFSv3, ReiserFSv4, FAT12/16/32,Minix,JFS and HFS+ partition or drive'
arch=('i686' 'x86_64')
url='https://wipefreespace.sourceforge.net/'
license=('GPL')
_verwatch=('https://sourceforge.net/projects/wipefreespace/rss' ".*<title>.*/${pkgname}-\([0-9\.]\+\)\.tar\.gz\].*" 'f')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('31e372e0150adaec923713ab22eabdc27b10690b89443cfe4dba37d7dedf5d32')

prepare() {
  set -u
  cd "${pkgbase}-${pkgver}"
  CFLAGS="${CFLAGS} -Wno-unused-result" \
  ./configure --prefix='/usr'
  echo '#define HAVE_LINUX_LOOP_H 1' >> 'config.h'
  set +u
}

build() {
  set -u
  cd "${pkgbase}-${pkgver}"
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  nice make -s -j "${_nproc}"
  set +u
}

package () {
  set -u
  cd "${pkgbase}-${pkgver}"
  make -j1 DESTDIR="${pkgdir}" install
  set +u
}
set +u
# vim:set ts=2 sw=2 et:
