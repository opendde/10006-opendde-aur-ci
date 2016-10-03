# Maintainer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: boyska <piuttosto@logorroici.org>

_pkgname=ddcutil
pkgname=ddcutil-git
pkgver=v0.6.0.r0.g917e7a8
pkgrel=1
pkgdesc='Query and change Linux monitor settings using DDC/CI and USB (development version).'
url='http://ddcutil.com/'
license=('GPL')
source=('git+https://github.com/rockowitz/ddcutil')
sha256sums=('SKIP')
arch=('i686' 'x86_64')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  # Generate the build configuration.
  ./autogen.sh
  # Configure the build.
 ./configure

  # Build it!
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install the program.
  make DESTDIR="${pkgdir}" install

  # Keep man files in the standard location.
  mkdir -p "${pkgdir}/usr/share"
  mv "${pkgdir}/usr/local/share/man" "${pkgdir}/usr/share/man"
}

# vim: ft=sh ts=2 sw=2 et
