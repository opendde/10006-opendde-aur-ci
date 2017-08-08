# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Schnouki <thomas.jost@gmail.com>
# Contributor: Vithon <ratm@archlinux.us>
# Contributor: Aaron <aaron@aaronlindsay.com>
# Contributor: TheGuy <lowelink26381@gmail.com>

pkgname=devkitarm-bin
pkgver=r47
pkgrel=1
pkgdesc="ARM toolchain for GP32, Nintendo (3)DS and GBA homebrew development (precompiled)"
arch=('x86_64')
url="http://devkitpro.org"
license=('GPL')
options=(!strip libtool staticlibs emptydirs)
provides=("devkitarm")
conflicts=("devkitarm")
depends=('gcc-libs' 'sh' 'zlib' 'libusb')
optdepends=('ncurses5-compat-libs: for arm-none-eabi-gdb'
            'expat: for arm-none-eabi-gdb'
            'libsystemd: for dfu-util')
install=devkitarm.install
source=("devkitarm.sh"
        "devkitarm.fish"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/devkitARM_$pkgver-x86_64-linux.tar.bz2")
sha256sums=('9448465b2de6b6aefc5e0a8404f780f737cb86b4b1280d653712271b892908f9'
            'c4cc42b085be7c48f06f75c934e846a61749d9ba5e31ee463a03ba27a01c8afd'
            '8c09db8fcddf7b2edd0358853d74a642481cb8ab9be2ed5f7b3527d3a50fbed3')

package() {
  install -d "$pkgdir"/opt/devkitpro
  cp -r devkitARM "$pkgdir"/opt/devkitpro
  # gzip manually, as makepkg only cares for standard directories
  gzip "$pkgdir"/opt/devkitpro/devkitARM/share/man/man*/*
  gzip "$pkgdir"/opt/devkitpro/devkitARM/share/info/*
  # export environment variables
  install -Dm755 devkitarm.sh "$pkgdir"/etc/profile.d/devkitarm.sh
  install -Dm644 devkitarm.fish "$pkgdir"/etc/fish/conf.d/devkitarm.fish
}
