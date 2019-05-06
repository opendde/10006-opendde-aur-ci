# Maintainer: TH Campbell (dysphoria) <thcampbell (at) protonmail (dot) com>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jamie Nguyen <jamie AT tomoyolinux.co.uk>

pkgname=tomoyo-tools
_file=53357
_basever=2.5.0
_timestamp=20170102
pkgver=${_basever}.${_timestamp}
pkgrel=3
pkgdesc='TOMOYO Linux userspace tools for Linux kernels >=3.2 and <5.1'
arch=('x86_64')
url='https://tomoyo.osdn.jp'
license=('GPL')
depends=('ncurses>=6.0')
conflicts=('linux>=5.1' 'linux-zen>=5.1' 'linux-hardened>=5.1')
install=tomoyo-tools.install
source=("https://jaist.dl.osdn.jp/tomoyo/${_file}/${pkgname}-${_basever}-${_timestamp}.tar.gz"{,.asc}
        'tomoyo-tools.install'
        'tomoyo-auditd.service')
sha256sums=('00fedfac5e514321250bbe69eaccc732c8a8158596f77a785c2e3ae9f9968283'
            'SKIP'
            '0df2401456f5377df529c1c8774670636b3ba365534d7ecbaf96b2e7ef6bf093'
            '7c3c01a8ba34af9dc3601d470afdd0d3a2b01a1ca1951e3479cfd1fb4dfdafa3')
validpgpkeys=('43C83369623D7AD3A96C2FC7425F128D0C64F52A')

prepare() {
  cd "${srcdir}/${pkgname}"
  sed -i \
    -e 's|usr/sbin|usr/bin|g' \
    -e 's|sbin|usr/bin|g' \
    usr_lib_tomoyo/init_policy.c
}

build() {
  cd "${srcdir}/${pkgname}"
  make USRSBINDIR=/usr/bin SBINDIR=/usr/bin
}

package() {
  cd "${srcdir}/${pkgname}"

  _unitdir="$(pkg-config --variable=systemdsystemunitdir systemd)"

  make USRSBINDIR=/usr/bin SBINDIR=/usr/bin INSTALLDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/tomoyo-auditd.service" \
      "${pkgdir}/${_unitdir}/tomoyo-auditd.service"
}
