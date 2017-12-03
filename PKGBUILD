# Maintainer: Remi Gacogne <rgacogne at archlinux dot org>
pkgname=dnsdist-git
pkgver=r13393.4461bb7c3
pkgrel=1
pkgdesc='Highly DNS-, DoS- and abuse-aware loadbalancer'
arch=('x86_64')
url='https://dnsdist.org/'
license=('GPL2')
source=("${pkgname}::git+https://github.com/PowerDNS/pdns"
        sysusers.conf)
sha512sums=('SKIP'
            'd55ccd612cbe08b353815027d30a3b0f0ec7bf6b0d74a0a634939be53ce6e6b41d23e54c2328946f00738c03e9f306ce4f2dabe5e4b11d9fb28d0abf49917893')
makedepends=('boost' 'git' 'pandoc' 'python-virtualenv' 'ragel' 'systemd')
depends=('libedit' 'libsodium' 'libsystemd' 'lua' 'net-snmp' 'protobuf' 're2')
provides=('dnsdist')
conflicts=('dnsdist')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}/pdns/dnsdistdist"
  autoreconf -i
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-libsodium \
    --enable-dnscrypt \
    --enable-re2
  make
  sed -i 's,ExecStart=/usr/bin/dnsdist --supervised --disable-syslog,ExecStart=/usr/bin/dnsdist --supervised --disable-syslog -u dnsdist,' dnsdist.service
}

package() {
  cd "${pkgname}/pdns/dnsdistdist/"
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}"
  install -D -m644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/dnsdist.conf"
}
