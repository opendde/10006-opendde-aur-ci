# Maintainer: L.G. Sarmiento (Pico) <Luis.Sarmientop-ala-nuclear.lu.se>
pkgname=geant4-abladata
_varname='G4ABLADATA'
_dataname="G4ABLA"
_foldername="G4ABLA"
pkgver=3.1
pkgrel=2
pkgdesc="Data files for nuclear shell effects in INCL/ABLA hadronic mode"
url="http://geant4.cern.ch/"
arch=('any')
license=('GPL')
optdepends=('geant4>=10.4')
install="${pkgname}.install"
source=("https://cern.ch/geant4-data/datasets/${_dataname}.${pkgver}.tar.gz"
  "${pkgname}.install")
sha256sums=('7698b052b58bf1b9886beacdbd6af607adc1e099fc730ab6b21cf7f090c027ed'
            'd4fbb80f577e0d5c8b2e0b71b9be0089a78a43852b93284694f99ec58e003512')

## Remove this if you want to keep an even smaller package
## No need to wait for compression when just installing it.
PKGEXT='.pkg.tar'

package() {
  install -d ${pkgdir}/usr/share/${pkgname}
  mv ${srcdir}/${_foldername}${pkgver} ${pkgdir}/usr/share/${pkgname}

  echo "export ${_varname}=/usr/share/${pkgname}/${_foldername}${pkgver}" > ${srcdir}/${pkgname}.sh
  echo "setenv ${_varname} /usr/share/${pkgname}/${_foldername}${pkgver}" > ${srcdir}/${pkgname}.csh

  install -d ${pkgdir}/etc/profile.d
  install -m755 ${srcdir}/${pkgname}.sh  ${pkgdir}/etc/profile.d/${pkgname}.sh
  install -m755 ${srcdir}/${pkgname}.csh ${pkgdir}/etc/profile.d/${pkgname}.csh
}
