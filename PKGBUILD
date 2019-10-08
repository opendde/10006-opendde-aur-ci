# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Past maintainer: Fina Miñano <cicely@algofacil.info>
# Contributor: Fina Miñano <cicely@algofacil.info>
pkgname=mindi
pkgver=3.0.2
pkgrel=3
pkgdesc="Create bootable disks or CD image with your system files, to allow system maintenance"
arch=('i686' 'x86_64')
url="http://www.mondorescue.org/"
license=('GPL2')
backup=('etc/mindi/mindi.conf' 'etc/mindi/deplist.txt' 'etc/mindi/deplist.d/addon.conf')
depends=('bzip2>=0.9' 'udev>=173' 'cdrkit' 'ncurses' 'binutils' 'gawk' 'dosfstools' 'mindi-busybox>=1.7.3' 'parted' 'perl' 'mtools' 'which' 'grep>=2.5' 'cpio' 'inetutils')

# Not on all systems
#conflicts=(bonnie++)

source=("ftp://ftp.mondorescue.org/src/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('fc290be7613d75b51e9ea622e56a074ba6f75bed805b9a726b2b8bb931ebf2ddc63f89b9db4efdce38687ecb9e42ed2d22c3d005d3465988f5b3a82f7f6c9580'
            'SKIP')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export DONT_RELINK=1
  export HEAD=${pkgdir}
  export PREFIX=/usr
  export CONFDIR=/etc
  export DOCDIR=/usr/share/doc
  export LIBDIR=/usr/lib
  export CACHEDIR=/var/cache/${pkgname}
  export PKGBUILDMINDI="true"  

  sed -i -e 's@/sbin@/bin@g' install.sh
  mkdir -p ${pkgdir}/usr/lib/mindi/rootfs/usr/bin
  ./install.sh 
  DOCDIR_INST=${pkgdir}${DOCDIR}/${pkgname}
  install -d ${DOCDIR_INST}
  install -m 644 ChangeLog AUTHORS COPYING README README.* TODO INSTALL NEWS ${DOCDIR_INST}
}

