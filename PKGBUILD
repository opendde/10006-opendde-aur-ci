# Maintainer: MoetaYuko <loli at yuko.moe>

pkgname=systemd-oomd-defaults
pkgver=249.7
pkgrel=1
pkgdesc="Configuration files for systemd-oomd"
url="https://src.fedoraproject.org/rpms/systemd"
arch=('any')
license=('LGPL2.1')
depends=('systemd')
makedepends=('git')
source=(git+https://src.fedoraproject.org/rpms/systemd.git#branch=f35)
md5sums=('SKIP')

package() {
  cd systemd
  install -Dm0644 -t "$pkgdir"/usr/lib/systemd/oomd.conf.d/ 10-oomd-defaults.conf
  install -Dm0644 -t "$pkgdir"/usr/lib/systemd/system/-.slice.d/ 10-oomd-root-slice-defaults.conf
  install -Dm0644 -t "$pkgdir"/usr/lib/systemd/system/user@.service.d/ 10-oomd-user-service-defaults.conf
}
