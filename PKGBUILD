# Maintainer  : Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname='gvmd'
pkgver=20.8.1
pkgrel=1
pkgdesc='Vulnerability manager Daemon'
arch=('x86_64')
url="https://github.com/greenbone/gvmd"
license=('GPL')
depends=('gvm-libs' 'libical' 'python3' 'gnutls' 'postgresql' 'libxslt' 'sudo')
makedepends=('cmake' 'doxygen' 'xmltoman' 'libxslt')
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/gvmd/archive/v${pkgver}.tar.gz"
        "archlinux_postgres_headers.patch"
        "greenbone-certdata-sync.timer"
        "greenbone-feed-sync.timer"
        "greenbone-scapdata-sync.timer"
        "greenbone-certdata-sync.service"
        "greenbone-feed-sync.service"
        "greenbone-scapdata-sync.service"
        "gvmd.install"
        "gvmd.service"
        "gvmd")
sha512sums=('e946be6c67970fdb0e4e6fbb2ac9445576c280c3ac7503ff42aac2c079e817ee587a37477956917b576bafab3e7caa281da5befa6502b044562051ae976889b2'
            'ec2cbedf87bfd8cc1abfc6be9c566b6d2e6f7b1f902f5596d496b01faf208c9921b502d77ec9281ef3c0d03462f2d49bb973f4f9216a106116cd824e938951c2'
            '4d259ff625d29b10040ab1ff7cb472b3dee2355c8ef01275754c5c08779e0de3d5ae1cbb157239fd17d663644b43a642fe15c2d8e13cde037e52ad6a4e2e0afd'
            'e1be40755530f9793c91c47db3bc1fb65266dcea2d1ba5e3ba1de97a93572bc52a18dc182f9c4d11fc4586f714663447917d70321e32c20bbe35765f999141d2'
            '224bb41d298083755a77151038403b678bc66b9184b9b960ce4a380f8774ec7794e2f967eb48efd158a9ac7006b4a46a1f84267b50eef3e85ced5193a278a451'
            '0e61d540bbe7d4a88d080e0b213f6c472d9b1b5bf122780dec9e2644fe15bae9a9938432fdcfde73ed9d280dd319dd4796acb83ea8135aab3fe981a00b612504'
            'de1cc454f5bdf402368ca06680b542b3c10edd6e0e126be955fd3af140c0bb722b1664a9b3ac72bf10fae54c85142bf58f5becde767a27e102c19abe78216b0a'
            'd90a42e8f2f77b05432f61ead247e8d4144569ae622159a45f0541469daa4447fa667ef6af42fa0117c957ab2a9afee425fef7bdc3532c8f89021e074c590052'
            'b57434d05d3191e460a15ae0e54c3a56f229ffabc3d1b13f395805eb8259ea225379cedaf1554938dd3e442801cd39149707a49ea589c7ca249ff6ffd2340c43'
            'b2f914995939c573f057789c76631896c6545913299e4071526d269efa40f935eb6408e74db9b014c9ff2f3d42770c9196e7fcadb0f7eb02fdf0f2530cbb09de'
            'fee7f0cbc0795d8269aba7df64adb0dfa8765faacba152f4f4b43cb3140b97c3d18fbcfb0abb0ec7b773fba45d725e00aa9b16ddc272cc4423aa99793c1aa931')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch --forward --strip=1 --input="${srcdir}/archlinux_postgres_headers.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DSBINDIR=/usr/bin \
    -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONFDIR=/etc -DLOCALSTATEDIR=/var \
    -DGVM_FEED_LOCK_PATH=/run/gvm/feed-update.lock -DGVM_RUN_DIR=/run/gvm/ .
  make
}

package() {
  install=gvmd.install
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -d $pkgdir/etc/default
  install -m 644 $srcdir/gvmd $pkgdir/etc/default
  install -d $pkgdir/usr/lib/systemd/system
  install -m 644 $srcdir/greenbone-certdata-sync.timer $pkgdir/usr/lib/systemd/system
  install -m 644 $srcdir/greenbone-scapdata-sync.timer $pkgdir/usr/lib/systemd/system
  install -m 644 $srcdir/greenbone-feed-sync.timer $pkgdir/usr/lib/systemd/system
  install -m 644 $srcdir/greenbone-certdata-sync.service $pkgdir/usr/lib/systemd/system
  install -m 644 $srcdir/greenbone-scapdata-sync.service $pkgdir/usr/lib/systemd/system
  install -m 644 $srcdir/greenbone-feed-sync.service $pkgdir/usr/lib/systemd/system
  install -m 644 $srcdir/gvmd.service $pkgdir/usr/lib/systemd/system
  install -d $pkgdir/var/lib/gvm/gvmd
}
