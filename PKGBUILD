# Maintainer: Hector <hsearaDOTatDOTgmailDOTcom>

pkgname=gromacs-charmm36
pkgver=201811
pkgrel=1
pkgdesc='CHARMM36 force field in GROMACS format.'
url='http://mackerell.umaryland.edu/charmm_ff.shtml#gromacs'
license=("GPL")
arch=('any')
depends=("gromacs")
source=(http://mackerell.umaryland.edu/download.php?filename=CHARMM_ff_params_files/charmm36-nov2018.ff.tgz)
sha1sums=('b953246b458cc6f4ed5bf5ebb761adf5807f6356')


package() {
  msg2 "Installing charmm36 forcefield files in Gromacs"
  mkdir -p ${pkgdir}/usr/share/gromacs/top/charmm36.ff
  cp  ${srcdir}/charmm36-*/* ${pkgdir}/usr/share/gromacs/top/charmm36.ff/
  chmod 644 ${pkgdir}/usr/share/gromacs/top/charmm36.ff/*
}
