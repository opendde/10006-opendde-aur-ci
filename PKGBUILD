# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=opensm
pkgver=3.3.21
pkgrel=3
pkgdesc='OpenFabrics Alliance InfiniBand Subnet Manager and Administrator'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2' 'custom:"OpenIB.org BSD"')
depends=('rdma-core' 'bash')
source=("https://github.com/linux-rdma/${pkgname}/archive/${pkgver}.tar.gz"
        'opensm.service'
        'opensm.launch')
sha256sums=('50d024090dc083274bc840792a3b539ecee5ad37a42948f43e84068e42b89b48'
            'a40c8a556cb170d84ffb49791fb82aabb21dc4afd22865e8f264a93c1f304788'
            '6fe01543d11d9fe0b4d3eeb9a6c6abf42c60da2e90c2dea829452a3bcfa6b3ce')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --libexecdir=/usr/lib \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # Convert from init.d to systemd
  rm -rf "${pkgdir}/etc/init.d"
  # ${pkgdir}/etc should now be empty
  rmdir "${pkgdir}/etc/" > /dev/null

  install -Dm644 "${srcdir}/opensm.service" "${pkgdir}/usr/lib/systemd/system/opensm.service"
  install -Dm755 "${srcdir}/opensm.launch" "${pkgdir}/usr/bin/opensm.launch"

  mkdir --parents "${pkgdir}/usr/share/docs/${pkgname}"
  cp doc/* "${pkgdir}/usr/share/docs/${pkgname}"
}
