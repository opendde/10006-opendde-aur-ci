# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Gerardo Exequiel Pozzi <djgera@archlinux.org>
_pkgname=archiso
pkgname=$_pkgname-encryption-git
pkgver=64
pkgrel=1
pkgdesc='Tools for creating Arch Linux live and install iso images with luks'
arch=('any')
license=('GPL3')
url="https://gitlab.archlinux.org/archlinux/archiso/-/issues/156"
depends=('arch-install-scripts' 'bash' 'dosfstools' 'e2fsprogs' 'erofs-utils'
'libarchive' 'libisoburn' 'mtools' 'squashfs-tools' 'cryptsetup-nested-cryptkey')
makedepends=('git')
checkdepends=('shellcheck')
replaces=('archiso' 'archiso-encryption')
conflicts=('archiso' 'archiso-encryption')
optdepends=(
  'archiso-profiles: extra profiles for archiso'
  'edk2-ovmf: for emulating UEFI with run_archiso'
  'openssl: for codesigning support when building netboot artifacts'
  'qemu: for run_archiso'
)
_commit="85e42d076ab14c2b2f947ea847565a3f787ab336"
source=("git+https://gitlab.archlinux.org/tallero/${_pkgname}#commit=85e42d076ab14c2b2f947ea847565a3f787ab336")
sha256sums=('SKIP')

check() {
  cd "${_pkgname}"
  make -k check
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" PREFIX='/usr' install
}
