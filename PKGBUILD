# Maintainer: Christoph Haag <christoph.haag@collabora.com>
pkgname='vulkan-memory-allocator-git'
pkgdesc='Easy to integrate Vulkan memory allocation library.'
pkgver=r841.5d92e20
pkgrel=1
url='https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator'
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=()
makedepends=('git' 'vulkan-headers' 'cmake' 'ninja')
source=('git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git')
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}"/VulkanMemoryAllocator
  printf "r%d.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"/VulkanMemoryAllocator
}

build() {
  cd "${srcdir}"/VulkanMemoryAllocator

  cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -Bbuild
  ninja -C build
}

package() {
  cd "${srcdir}"/VulkanMemoryAllocator
  DESTDIR="$pkgdir" ninja -C build install
}

