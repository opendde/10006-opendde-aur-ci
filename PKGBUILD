# GnuPG2 GIT version
# Maintainer: alphazo@gmail.com
# Based on official package maintained by Tobias Powalowski <tpowa@archlinux.org>
# Cleanup from @holos

_gitname=gnupg
pkgname=gnupg-clavator
pkgver=2.1.16+clavator
pkgrel=1
pkgdesc="GNU Privacy Guard 2 - a PGP replacement tool. Development version. Do not use in production environments. Test new ECC algorithms by using \"gpg --full-gen-key --expert\""
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
depends=('libldap' 'curl' 'bzip2' 'zlib' 'libksba>=1.2' 'libgpg-error' 'libgcrypt'
         'pth' 'libusb-compat' 'libassuan' 'npth' 'texinfo' 'readline' 'pinentry')
license=('GPL')
url="http://www.gnupg.org/"
makedepends=('git' 'ghostscript' 'transfig' 'automake')
provides=("gnupg=${pkgver}" 'dirmngr')
conflicts=('gnupg2' 'gnupg' 'dirmngr')
install=${pkgname}.install
source=("git://github.com/mabels/gnupg.git#branch=quick-keytocard")
sha1sums=('SKIP')

pkgver() {
  cd "$_gitname"

  git rev-parse --verify --short HEAD
}

build() {
  cd "$_gitname"

  ./autogen.sh --force

  ./configure \
    --enable-maintainer-mode \
    --prefix=/usr \
    --libexecdir=/usr/lib/gnupg

  make
}

package() {
  cd "$_gitname"

  make DESTDIR=${pkgdir} install
  ln -s gpg2 "$pkgdir/usr/bin/gpg"
}

# vim: ft=sh syn=sh et sw=2
