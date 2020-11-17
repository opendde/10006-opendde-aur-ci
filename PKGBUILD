# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname=growlight
pkgver=1.2.19
pkgrel=1
pkgdesc="Disk manipulation and system preparation tool"
url="https://nick-black.com/dankwiki/index.php/Growlight"
license=('GPL3')
arch=('x86_64')
# ncurses and readline are found without our help. Don't explicitly list them.
# The same goes for device-mapper.
depends=('cryptsetup' 'libatasmart' 'libpciaccess' 'pciutils' 'notcurses>=2.0.1')
makedepends=('cunit' 'cmake' 'pandoc')
optdepends=('jfsutils: JFS manipulation' 'xfsprogs: XFS manipulation'
            'mdadm: Linux MDRAID manipulation'
            'btrfs-progs: Btrfs manipulation'
            'hfsprogs: HFS (MacOS) manipulation'
            'ntfs-3g: NTFS (Windows) manipulation'
            'f2fs-tools: F2FS manipulation'
            'hdparm: Deep ATA hardware details'
            'nvme-cli: Deep NVMe hardware details',
            'zfs-utils: ZFS-on-Linux manipulation')
source=("https://github.com/dankamongmen/growlight/archive/v${pkgver}.tar.gz")

prepare() {
  mkdir -p "${pkgname}-${pkgver}/build"
  cd "${pkgname}-${pkgver}/build"
  if pkg-config --modversion libzfs > /dev/null 2>&1 ; then
    cmake .. -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=RelWithDebInfo
  else
    echo "Building without ZFS support..."
    cmake .. -DUSE_LIBZFS=off -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=RelWithDebInfo
  fi
}

build() {
  cd "${pkgname}-${pkgver}/build"
  make
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make install DESTDIR="$pkgdir"
}

sha256sums=('c2484852242fd32826a952920af192450c4ca1e5d3cd69c528eecce93cbaa254d062f0c1a6a2293db12a631cfed64dd3e1f332efdb68d50d980427d581400a8f')
