# Maintainer: Anatol Pomozov

pkgname=coreboot-utils-git
pkgver=4.4.r1222.g589ef9d
pkgrel=1
pkgdesc='Tools and utilities to work with Coreboot firmware'
url='http://www.coreboot.org/'
license=(GPL)
arch=(i686 x86_64)
depends=(glibc)
makedepends=(git)
source=(git+https://review.coreboot.org/coreboot
        git+https://review.coreboot.org/chrome-ec
        git+https://review.coreboot.org/vboot
        git+https://review.coreboot.org/blobs
        git+https://review.coreboot.org/nvidia-cbootimage
        git+https://review.coreboot.org/arm-trusted-firmware)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd coreboot
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd coreboot

  git submodule init
  git config -f .gitmodules 'submodule.3rdparty/blobs.url' "$srcdir/blobs"
  git config -f .gitmodules 'submodule.3rdparty/chromeec.url' "$srcdir/chrome-ec"
  git config -f .gitmodules 'submodule.util/nvidia-cbootimage.url' "$srcdir/nvidia-cbootimage"
  git config -f .gitmodules 'submodule.vboot.url' "$srcdir/vboot"
  git config -f .gitmodules 'submodule.arm-trusted-firmware.url' "$srcdir/arm-trusted-firmware"
  git submodule sync
  git submodule update
}

build() {
  cd coreboot/util

  make -C cbfstool
  make -C ifdtool
  make -C nvramtool
  make -C inteltool
  make -C superiotool
  make -C cbmem
  make -C romcc romcc # tests fail
  make -C ectool
}

package() {
  cd coreboot/util
  install -m755 -d "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man8"
  install -m755 -t "$pkgdir/usr/bin" cbfstool/{cbfstool,rmodtool} ifdtool/ifdtool nvramtool/nvramtool inteltool/inteltool superiotool/superiotool cbmem/cbmem romcc/romcc ectool/ectool
  install -m644 -t "$pkgdir"/usr/share/man/man8 inteltool/inteltool.8

  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
