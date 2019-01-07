# Maintainer: steamport <steamport@protonmail.com>
# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>

_pkgname=libvirt
pkgname=libvirt-apparmor
pkgver=4.10.0
pkgrel=0
pkgdesc="API for controlling virtualization engines (openvz,kvm,qemu,virtualbox,xen,etc)"
arch=('x86_64')
url="http://libvirt.org/"
license=('LGPL')
provides=('libvirt')
conflicts=('libvirt')
makedepends=('lvm2' 'linux-api-headers' 'dnsmasq' 'lxc' 'libiscsi' 'open-iscsi'
             'perl-xml-xpath' 'libxslt' 'qemu' 'parted' 'python')
depends=('e2fsprogs' 'gnutls' 'iptables' 'libxml2' 'parted' 'polkit' 'avahi'
         'yajl' 'libpciaccess' 'udev' 'dbus' 'libxau' 'libxdmcp' 'libpcap'
         'libcap-ng' 'curl' 'libsasl' 'libgcrypt' 'libgpg-error' 'openssl'
         'libxcb' 'gcc-libs' 'iproute2' 'libnl' 'libx11' 'numactl' 'gettext'
         'libssh2' 'netcf' 'fuse2' 'glusterfs' 'ceph-libs' 'libiscsi')
optdepends=('ebtables: required for default NAT networking'
            'dnsmasq: required for default NAT/DHCP for guests'
            'bridge-utils: for bridged networking'
            'netcat: for remote management over ssh'
            'qemu'
            'radvd'
            'dmidecode'
            'parted'
            'ceph: for ceph support'
            'qemu-block-gluster: for qemu glusterfs support')
backup=('etc/conf.d/libvirt-guests'
  'etc/conf.d/libvirtd'
  'etc/libvirt/libvirt.conf'
  'etc/libvirt/virtlogd.conf'
  'etc/libvirt/libvirtd.conf'
  'etc/libvirt/lxc.conf'
  'etc/libvirt/nwfilter/allow-arp.xml'
  'etc/libvirt/nwfilter/allow-dhcp-server.xml'
  'etc/libvirt/nwfilter/allow-dhcp.xml'
  'etc/libvirt/nwfilter/allow-incoming-ipv4.xml'
  'etc/libvirt/nwfilter/allow-ipv4.xml'
  'etc/libvirt/nwfilter/clean-traffic.xml'
  'etc/libvirt/nwfilter/no-arp-ip-spoofing.xml'
  'etc/libvirt/nwfilter/no-arp-mac-spoofing.xml'
  'etc/libvirt/nwfilter/no-arp-spoofing.xml'
  'etc/libvirt/nwfilter/no-ip-multicast.xml'
  'etc/libvirt/nwfilter/no-ip-spoofing.xml'
  'etc/libvirt/nwfilter/no-mac-broadcast.xml'
  'etc/libvirt/nwfilter/no-mac-spoofing.xml'
  'etc/libvirt/nwfilter/no-other-l2-traffic.xml'
  'etc/libvirt/nwfilter/no-other-rarp-traffic.xml'
  'etc/libvirt/nwfilter/qemu-announce-self-rarp.xml'
  'etc/libvirt/nwfilter/qemu-announce-self.xml'
  'etc/libvirt/qemu-lockd.conf'
  'etc/libvirt/qemu.conf'
  'etc/libvirt/qemu/networks/default.xml'
  'etc/libvirt/virt-login-shell.conf'
  'etc/libvirt/virtlockd.conf'
  'etc/logrotate.d/libvirtd'
  'etc/logrotate.d/libvirtd.lxc'
  'etc/logrotate.d/libvirtd.qemu'
  'etc/logrotate.d/libvirtd.uml'
  'etc/sasl2/libvirt.conf')
install="libvirt.install"

options=('emptydirs')
validpgpkeys=('C74415BA7C9C7F78F02E1DC34606B8A5DE95BC1F')
source=("https://libvirt.org/sources/${_pkgname}-${pkgver}.tar.xz"{,.asc}
        'libvirtd.conf.d'
        'libvirtd-guests.conf.d'
        'libvirt.sysusers.d')
sha512sums=('a4f97aed6299c7954518ab88738ab781cee0755bfd64094a44468f77f99cac5eb2bc74ecd6aec90177317606ebd073292f5b5d0056054d1d94973fa938589fbd'
            'SKIP'
            'fc0e16e045a2c84d168d42c97d9e14ca32ba0d86025135967f4367cf3fa663882eefb6923ebf04676ae763f4f459e5156d7221b36b47c835f9e531c6b6e0cd9d'
            'ef221bae994ad0a15ab5186b7469132896156d82bfdc3ef3456447d5cf1af347401ef33e8665d5b2f76451f5457aee7ea01064d7b9223d6691c90c4456763258'
            '519a9f245bed077137a1b01dec07a178885ac2527b47a1bd883bbb908bf9b4fa0c039525600e09f7db636f8849870fe2ce8ffe5b75532ff9d3fa1a91115875f8')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  #local src
  #for src in "${source[@]}"; do
  #  src="${src%%::*}"
  #  src="${src##*/}"
  #  [[ $src = *.patch ]] || continue
  #  msg2 "Applying patch $src..."
  #  patch -Np1 < "../$src"
  #done

  autoreconf -vi

  sed -i 's|/sysconfig/|/conf.d/|g' \
    src/remote/libvirtd.service.in \
    tools/{libvirt-guests.service,libvirt-guests.sh,virt-pki-validate}.in \
    src/locking/virtlockd.service.in
  sed -i 's|@sbindir@|/usr/bin|g' src/locking/virtlockd.service.in
  sed -i 's|/usr/libexec/qemu-bridge-helper|/usr/lib/qemu/qemu-bridge-helper|g' \
    src/qemu/qemu{.conf,_conf.c} \
    src/qemu/test_libvirtd_qemu.aug.in

  sed -i 's|libsystemd-daemon|libsystemd|g' configure
  sed -i 's/notify/simple/' src/remote/libvirtd.service.in
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export PYTHON=$(command -v python)
  export LDFLAGS=-lX11
  export RADVD=/usr/bin/radvd
  [ -f Makefile ] || ZFS=/usr/bin/zfs ZPOOL=/usr/bin/zpool ./configure \
    --prefix=/usr \
    --libexec=/usr/lib/"${_pkgname}" \
    --sbindir=/usr/bin \
    --disable-static \
    --with-init-script=systemd \
    --with-qemu \
    --with-qemu-user=nobody \
    --with-qemu-group=kvm \
    --without-hal \
    --with-interface \
    --with-lxc \
    --with-netcf \
    --with-udev \
    --with-storage-disk \
    --with-storage-gluster \
    --with-storage-iscsi \
    --with-storage-lvm \
    --with-storage-zfs \
    --with-audit \
    --with-secdriver-apparmor
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -D -m644 "${srcdir}"/libvirtd.conf.d "${pkgdir}"/etc/conf.d/libvirtd
  install -D -m644 "${srcdir}"/libvirtd-guests.conf.d "${pkgdir}"/etc/conf.d/libvirt-guests
  install -D -m644 "${srcdir}"/libvirt.sysusers.d "${pkgdir}"/usr/lib/sysusers.d/libvirt.conf

  chown 0:102 "${pkgdir}"/usr/share/polkit-1/rules.d
  chmod 0750 "${pkgdir}"/usr/share/polkit-1/rules.d

  rm -rf \
    "${pkgdir}"/var/run \
    "${pkgdir}"/var/lib/libvirt/qemu \
    "${pkgdir}"/var/cache/libvirt/qemu \
    "${pkgdir}"/etc/sysconfig

  rm -f "${pkgdir}"/etc/libvirt/qemu/networks/autostart/default.xml
}
