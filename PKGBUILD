# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Maintainer: Tavian Barnes <tavianator@tavianator.com>

_target_arch=arm
_target=${_target_arch}-linux-gnueabihf
pkgname=${_target}-linux-api-headers
pkgver=4.10.1
_basever=4.10
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace (${_target})"
arch=('any')
url="http://www.gnu.org/software/libc"
license=('GPL2')
source=(https://www.kernel.org/pub/linux/kernel/v4.x/linux-${_basever}.tar.xz
        https://www.kernel.org/pub/linux/kernel/v4.x/linux-${_basever}.tar.sign
        https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.xz
        https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.sign)
md5sums=('b5e7f6b9b2fe1b6cc7bc56a3a0bfc090'
         'SKIP'
         'd4ab54e17b686d1dbb1d28238fd0b081'
         'SKIP')
validpgpkeys=('ABAF11C65A2970B130ABE3C479BE3E4300411886'   # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E')  # Greg Kroah-Hartman

prepare() {
  cd ${srcdir}/linux-${_basever}
  [[ $pkgver != $_basever ]] && patch -p1 -i ${srcdir}/patch-${pkgver} || true
}

build() {
  cd ${srcdir}/linux-${_basever}

  make ARCH=${_target_arch} mrproper
  make ARCH=${_target_arch} headers_check
}

package() {
  cd ${srcdir}/linux-${_basever}
  make INSTALL_HDR_PATH=${pkgdir}/usr/${_target} ARCH=${_target_arch} headers_install

  # use headers from libdrm
  rm -rf ${pkgdir}/usr/${_target}/include/drm

  # clean-up unnecessary files generated during install
  find ${pkgdir} \( -name .install -o -name ..install.cmd \) -delete
}
