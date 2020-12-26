# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc

pkgname=linux-api-headers-git
pkgver=5.10
pkgrel=1
pkgdesc='Kernel headers sanitized for use in userspace'
arch=(any)
url='https://www.gnu.org/software/libc'
license=(GPL2)
makedepends=(rsync)
provides=(linux-api-headers)
conflicts=(linux-api-headers)
source=(git+https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux)
md5sums=('SKIP')
#validpgpkeys=('ABAF11C65A2970B130ABE3C479BE3E4300411886'   # Linus Torvalds
#              '647F28654894E3BD457199BE38DBBDC86092693E')  # Greg Kroah-Hartman

pkgver() {
   cd linux
   git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g;s/\.rc/rc/'
}

build() {
  cd linux

  make mrproper
  make headers_check
}

package() {
  cd linux
  make INSTALL_HDR_PATH="$pkgdir/usr" headers_install

  # use headers from libdrm
  rm -r "$pkgdir/usr/include/drm"
}
