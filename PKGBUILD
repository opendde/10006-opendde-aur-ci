# Maintainer: Michael Duell < mail at akurei dot me >
# Contributor: Daniel J. Campos <dcampos2015 at my dot fit dot edu>
pkgname=btrbk-git
pkgver=v0.27.0.r0.gc59488f
pkgrel=2
pkgdesc="A backup tool for btrfs subvolumes, taking advantage of btrfs specific capabilities to create atomic snapshots and transfer them incrementally to your backup locations."
url="http://digint.ch/btrbk"
arch=('any')
license=('GPL3')
conflicts=('btrbk')
provides=('btrbk')
depends=('perl' 'btrfs-progs')
makedepends=('asciidoc' 'git')
optdepends=('openssh: remote backup support',
	    'pv: --progress support',
        'mbuffer: add buffering to send-stream')
source=("git+https://github.com/digint/btrbk.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/btrbk"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


package() {
  cd "${srcdir}/btrbk"
  make DESTDIR="${pkgdir}" BINDIR="/usr/bin" install
  #install -Dm644 COPYING "$pkgdir/usr/share/licenses/btrbk/COPYING"
}


