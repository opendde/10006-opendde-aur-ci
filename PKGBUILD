# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=x3dna-dssr
pkgver=1.5.5_2016may25
pkgrel=2
pkgdesc="DSSR, an integrated software tool for Dissecting the Spatial Structure of RNA. Please see: http://forum.x3dna.org/site-announcements/download-instructions/"
arch=('i686' 'x86_64')
url="http://x3dna.org/"
license=('custom')
depends=('glibc')
source_i686=("http://x3dna.bio.columbia.edu/downloads/dssr/linux-32bit/x3dna-dssr")
md5sums_i686=('43dedd5910507967740fc32fb0076506')
source_x86_64=("http://x3dna.bio.columbia.edu/downloads/dssr/linux-64bit/x3dna-dssr")
md5sums_x86_64=('3a601bbbc50ba6804d65ce89c9f7c6e0')

package() {
    install -D ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
