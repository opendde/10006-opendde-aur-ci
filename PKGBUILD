# Contributor: Tom < reztho at archlinux dot us >
#
# Thanks to Alan Heckert from NIST for his support

pkgname=dataplot
pkgver=20200619
pkgrel=1
pkgdesc="Software for scientific visualization, statistical analysis, and non-linear modeling."
arch=('x86_64')
url="https://www.itl.nist.gov/div898/software/${pkgname}"
license=('custom')
depends=('cairo' 'gd' 'gcc-libs' 'fontconfig' 'expat' 'libpng' 'zlib' 'libjpeg' 'libx11' 'freetype2' 'tcsh' 'readline' 'termcap' 'tk')
makedepends=('imagemagick' 'gcc-fortran' 'gendesk')
# backup=('usr/share/dataplot/frscript/xdpConfig')
source=("${url}/ftp/unix/dataplot-${pkgver}.tar.gz"
  "dataplot.sh")
sha512sums=('f9947d7da49f99f9fe3b69390ef3e3f143b01889049fc86b3bf2969271df1f84d64cb300481971220548b011e4824b471f2e9b7a55db406876f891b1dd01add9'
  '62d40b182ec2212a0cf27ac548a3a4b46598291c7407dbb8d51633bf088841b3bdf1917c0b223c3d234e8eb149aba3a0ec5d35ac66a4ac4f1521a485ca87a411')

prepare() {
  sed -i 's/\/local//g' ${pkgname}/src/Makefile
  sed -i 's/\/local//g' ${pkgname}/lib/frscript/xdpConfig.in
}

build() {
  gendesk -n -f \
    --pkgname="x${pkgname}" \
    --pkgdesc="${pkgdesc}" \
    --name="${pkgname}" \
    --categories="Education;Science;Math;" \
    --exec="/usr/bin/xdataplot" \
    --startupnotify=true

  cd ${pkgname}/src
  make
}

package() {
  cd ${pkgname}/src
  make install DESTDIR="${pkgdir}"

  # Preparing the dataplot auxiliary files
  install -dm755 ${pkgdir}/usr/share/${pkgname}

  # Icon and .desktop files
  install -dm755 ${pkgdir}/usr/share/pixmaps
  /usr/bin/convert ${pkgdir}/usr/lib/dataplot/frscript/xdpIcon.xbm \
    ${pkgdir}/usr/share/pixmaps/xdataplot.png
  install -dm755 ${pkgdir}/usr/share/applications
  install -m644 ${srcdir}/xdataplot.desktop ${pkgdir}/usr/share/applications

  # Copying dataplot.sh to ${pkgdir}/etc/profile.d so dataplot will know
  # where its files are
  install -dm755 ${pkgdir}/etc/profile.d
  cp ${srcdir}/dataplot.sh ${pkgdir}/etc/profile.d

  # License/Disclaimer
  install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
  cat >${pkgdir}/usr/share/licenses/${pkgname}/${pkgname}.txt <<EOF
http://www.itl.nist.gov/div898/software/dataplot/disclaim.htm

DATAPLOT Disclaimer

This software was developed at the National Institute of Standards and Technology by 
employees of the Federal Government in the course of their official duties. Persuant 
to title 17 section 105 of the United States Code this software is not subject to
copyright protection and is in the public domain. Dataplot is an experimental system.
NIST assumes no responsibility whatsoever for its use by other parties, and makes no
guarantees, expressed or implied, about its quality, reliability, or any other
characteristic. 
EOF
}
