# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-source-copy
pkgver=0.2.1
pkgrel=1
pkgdesc="Copy and paste scenes, sources and filters on clipboard"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/source-copy.1261/"
license=("GPL2")
depends=("obs-studio>=28")
makedepends=("cmake" "git")
source=("$pkgname::git+https://github.com/exeldro/$pkgname#commit=c88b3c997439247749a5bffc70a69eee8929742a")
sha256sums=("SKIP")

build() {
  cd "$pkgname"
  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6

  make -C build
}

package() {
  cd "$pkgname"
  make -C build DESTDIR="$pkgdir/" install
}
