# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Andrew DeMaria <lostonamountain@gmail.com>

set -u
pkgname='lsm'
pkgver='1.0.4'
pkgrel='1'
pkgdesc='a Link Status Monitor which can be used to monitor for example a Linux router/firewall connectivity'
arch=('i686' 'x86_64')
url='http://lsm.foobar.fi/'
license=('GPL2')
_verwatch=("${url}/download/" "${pkgname}-\([0-9\.]\+\)\.tar\.gz" 'l')
source=("${url}/download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('186ac78423496525a617dbcb253a12836304cba28dc1a2bb4ffe9acfdefdfbd7')

build() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dpm0644 'lsm.conf' -t "${pkgdir}/etc/lsm"
  install -Dpm0755 'lsm' -t "${pkgdir}/usr/bin"
  install -Dpm0644 'README' 'lsm.conf.sample' 'default_script.sample' 'rsyslog-lsm.conf.sample' -t "${pkgdir}/usr/share/lsm"
  install -Dpm0755 'default_script' 'shorewall_script' -t "${pkgdir}/usr/share/lsm"
  install -d "${pkgdir}/var/lib/lsm"
  set +u
}
set +u
