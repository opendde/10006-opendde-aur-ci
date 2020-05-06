# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>

pkgname=yabridge-git
_pkgname=yabridge
pkgver=1.0.0.r37.g006fb64
pkgrel=1
pkgdesc="Yet Another VST bridge, run Windows VST2 plugins under Linux"
arch=('x86_64')
url="https://github.com/robbert-vdh/yabridge"
license=('GPL3')
depends=('wine' 'libxcb' 'lib32-libxcb')
makedepends=('meson' 'ninja' 'boost' 'lib32-boost-libs>=1.72.0')
provides=('yabridge')
conflicts=('yabridge')
install='yabridge.install'
source=('git+https://github.com/robbert-vdh/yabridge')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"

  # If you don't want to build lib32-boost-libs and you don't need the 32-bit
  # bitbridge, then you can leave out the dependency for it and set the
  # `use-bitbridge` option to false.
  meson setup --buildtype=release --cross-file cross-wine.conf -Duse-bitbridge=true build
  ninja -C build
}

package() {
  cd "$_pkgname/build"

  install -dm755 "${pkgdir}"/usr/bin
  install yabridge-host.exe{,.so} "${pkgdir}"/usr/bin
  install yabridge-host-32.exe{,.so} "${pkgdir}"/usr/bin

  install -dm755 "${pkgdir}"/usr/lib
  install libyabridge.so "${pkgdir}"/usr/lib
}

# vim:set ts=2 sw=2 et:
