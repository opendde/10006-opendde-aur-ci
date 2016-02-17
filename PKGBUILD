# Maintainer: SebRmv
pkgname=ia32_aout
pkgver=4.0
pkgrel=2
pkgdesc='ia32_aout kernel module, for running an a.out binary format'
arch=('x86_64')
makedepends=('linux-headers' 'linux-api-headers' 'gzip')
url="https://www.kernel.org"
license=("GPLv3")
options=('!strip')
source=("https://raw.githubusercontent.com/torvalds/linux/v{$pkgver}/arch/x86/ia32/ia32_aout.c"
        "Makefile")
sha1sums=('c635114660009c57014eb2a38e50e3abbb5f2e5f'
          '06df66a73b9f8a572b4b8d6b42e20fbb7b227911')
install=ia32_aout.install

_kernel_version_x64=4.4

build(){ 
  cd "$srcdir" 
  make   
}

package() {
  cd "$srcdir"
  mkdir -p "${pkgdir}"/usr/lib/modules/extramodules-"${_kernel_version_x64}"-ARCH
  install "${pkgname}".ko "${pkgdir}"/usr/lib/modules/extramodules-"${_kernel_version_x64}"-ARCH
  gzip "${pkgdir}"/usr/lib/modules/extramodules-"${_kernel_version_x64}"-ARCH/"${pkgname}".ko
}
