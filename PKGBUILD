# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: sparzz
pkgname=spirv-headers-sparzz-git
pkgver=1.5.3.2020.05.26
pkgrel=1
epoch=
pkgdesc="SPIR-V Headers build from source. My Vulkan packages from the AUR depends on this package. For install instruction and order of the of the install visit my GitHub page --> https://github.com/sparzz/vulkan-arch-aur  "
arch=(x86_64)
url="https://github.com/sparzz/vulkan-arch-aur"
license=('Apache')
groups=()
depends=("yay"
        "glslang-sparzz-git"
        "make"
        "cmake")
makedepends=("cmake"
            "git"
            "make"
            "glslang-sparzz-git")
checkdepends=()
optdepends=()
provides=(spirv-headers-sparzz-git)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("SPIRV-Headers::git+https://github.com/KhronosGroup/SPIRV-Headers.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()






package() {
	cmake SPIRV-Headers
	make DESTDIR="$pkgdir" install
}
