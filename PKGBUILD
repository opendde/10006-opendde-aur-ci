# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
# Build order: armv7l-binutils -> armv7l-linux-api-headers -> armv7l-gcc-bootstrap -> armv7l-glibc -> armv7l-gcc -> armv7l-glibc (again)

_arch=armv7l
_kernel_arch=arm
_target=$_arch-unknown-linux-gnueabihf
pkgname=$_arch-linux-api-headers
pkgver=5.15.68
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace ($_target)"
arch=(any)
url='https://www.kernel.org'
license=(GPL2)
makedepends=(rsync)
options=(!strip)
source=(https://www.kernel.org/pub/linux/kernel/v5.x/linux-$pkgver.tar.{xz,sign})
sha256sums=('17bbb3cb5c9ba18583b6679cc28f828aec49c72abbfc6fbde310b0cb17218b7e'
            'SKIP')
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)


build() {
  cd linux-$pkgver

  make ARCH=$_kernel_arch mrproper
}

package() {
  cd linux-$pkgver
  make INSTALL_HDR_PATH="$pkgdir/usr/$_target/sys-root/usr" ARCH=$_kernel_arch V=0 headers_install

  # clean-up unnecessary files generated during install
  find "$pkgdir" \( -name .install -or -name ..install.cmd \) -delete
}
