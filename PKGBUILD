# Maintainer:  Mubashshir <ahmubashshir@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Robin Broda <robin@broda.me>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jonathan Wiersma <archaur at jonw dot org>
# from: github
# what: libvirt/libvirt
# match! -rc[0-9]+$

pkgname=libvirt
pkgver=8.8.0
pkgrel=1
pkgdesc="API for controlling virtualization engines (openvz,kvm,qemu,virtualbox,xen,etc)"
arch=('x86_64')
url="https://libvirt.org/"
license=('LGPL' 'GPL3') #libvirt_parthelper links to libparted which is GPL3 only
depends=('libpciaccess' 'yajl' 'fuse3' 'gnutls' 'parted' 'libssh' 'libxml2' 'numactl' 'polkit')
makedepends=('meson' 'libxslt' 'python-docutils' 'lvm2' 'open-iscsi' 'libiscsi' 'glusterfs'
             'bash-completion' 'rpcsvc-proto' 'dnsmasq' 'iproute2' 'qemu-base')
optdepends=('libvirt-storage-gluster: Gluster storage backend'
            'libvirt-storage-iscsi-direct: iSCSI-direct storage backend'
            'gettext: required for libvirt-guests.service'
            'openbsd-netcat: for remote management over ssh'
            'dmidecode: DMI system info support'
            'dnsmasq: required for default NAT/DHCP for guests'
            'radvd: IPv6 RAD support'
            'iptables-nft: required for default NAT networking'
            'qemu-desktop: QEMU/KVM support'
            'qemu-emulators-full: Support of additional QEMU architectures'
            'lvm2: Logical Volume Manager support'
            'open-iscsi: iSCSI support via iscsiadm'
            'swtpm: TPM emulator support')

backup=(
  'etc/libvirt/libvirt-admin.conf'
  'etc/libvirt/libvirt.conf'
  'etc/libvirt/libvirtd.conf'
  'etc/libvirt/lxc.conf'
  'etc/libvirt/nwfilter/allow-arp.xml'
  'etc/libvirt/nwfilter/allow-dhcp-server.xml'
  'etc/libvirt/nwfilter/allow-dhcpv6-server.xml'
  'etc/libvirt/nwfilter/allow-dhcp.xml'
  'etc/libvirt/nwfilter/allow-dhcpv6.xml'
  'etc/libvirt/nwfilter/allow-incoming-ipv4.xml'
  'etc/libvirt/nwfilter/allow-incoming-ipv6.xml'
  'etc/libvirt/nwfilter/allow-ipv6.xml'
  'etc/libvirt/nwfilter/allow-ipv4.xml'
  'etc/libvirt/nwfilter/clean-traffic-gateway.xml'
  'etc/libvirt/nwfilter/clean-traffic.xml'
  'etc/libvirt/nwfilter/no-arp-ip-spoofing.xml'
  'etc/libvirt/nwfilter/no-arp-mac-spoofing.xml'
  'etc/libvirt/nwfilter/no-arp-spoofing.xml'
  'etc/libvirt/nwfilter/no-ip-multicast.xml'
  'etc/libvirt/nwfilter/no-ipv6-multicast.xml'
  'etc/libvirt/nwfilter/no-ip-spoofing.xml'
  'etc/libvirt/nwfilter/no-ipv6-spoofing.xml'
  'etc/libvirt/nwfilter/no-mac-spoofing.xml'
  'etc/libvirt/nwfilter/no-mac-broadcast.xml'
  'etc/libvirt/nwfilter/no-other-l2-traffic.xml'
  'etc/libvirt/nwfilter/no-other-rarp-traffic.xml'
  'etc/libvirt/nwfilter/qemu-announce-self-rarp.xml'
  'etc/libvirt/nwfilter/qemu-announce-self.xml'
  'etc/libvirt/qemu.conf'
  'etc/libvirt/qemu-lockd.conf'
  'etc/libvirt/qemu/networks/default.xml'
  'etc/libvirt/virtchd.conf'
  'etc/libvirt/virtinterfaced.conf'
  'etc/libvirt/virtlockd.conf'
  'etc/libvirt/virtlogd.conf'
  'etc/libvirt/virt-login-shell.conf'
  'etc/libvirt/virtlxcd.conf'
  'etc/libvirt/virtnetworkd.conf'
  'etc/libvirt/virtnodedevd.conf'
  'etc/libvirt/virtnwfilterd.conf'
  'etc/libvirt/virtproxyd.conf'
  'etc/libvirt/virtqemud.conf'
  'etc/libvirt/virtsecretd.conf'
  'etc/libvirt/virtstoraged.conf'
  'etc/libvirt/virtvboxd.conf'
  'etc/logrotate.d/libvirtd'
  'etc/logrotate.d/libvirtd.lxc'
  'etc/logrotate.d/libvirtd.qemu'
  'etc/sasl2/libvirt.conf'
)
options=(debug)
source=(
  "https://libvirt.org/sources/$pkgname-$pkgver.tar.xz"{,.asc}
)
sha256sums=('eb0cbb6cd199e7a2f341e62f5410ca2daf65a0bf91bd522d951c1a18f0df0fa3'
            'SKIP')
validpgpkeys=('453B65310595562855471199CA68BE8010084C9C') # Jiří Denemark <jdenemar@redhat.com>

# libvirt-xen
pkgname=libvirt-xen
depends+=('xen')
backup+=(
  'etc/libvirt/libxl.conf'
  'etc/libvirt/libxl-lockd.conf'
  'etc/libvirt/virtxend.conf'
  'etc/logrotate.d/libvirtd.libxl'
)

prepare() {
  cd "${pkgname%*-xen}-${pkgver}"

  sed -i 's|/sysconfig/|/conf.d/|g' \
    src/remote/libvirtd.service.in \
    tools/{libvirt-guests.service,libvirt-guests.sh,virt-pki-validate}.in \
    docs/manpages/libvirt-guests.rst \
    src/locking/virtlockd.service.in \
    src/logging/virtlogd.service.in
  sed -i 's|/usr/libexec/qemu-bridge-helper|/usr/lib/qemu/qemu-bridge-helper|g' \
    src/qemu/qemu.conf.in \
    src/qemu/test_libvirtd_qemu.aug.in

}

build() {
  arch-meson build "${pkgname%*-xen}-$pkgver" \
    --libexecdir=lib/libvirt \
    -Drunstatedir=/run \
    -Dqemu_user=libvirt-qemu \
    -Dqemu_group=libvirt-qemu \
    -Dnetcf=disabled \
    -Dopenwsman=disabled \
    -Dapparmor=disabled \
    -Dapparmor_profiles=disabled \
    -Dselinux=disabled \
    -Dwireshark_dissector=disabled \
    -Ddriver_bhyve=disabled \
    -Ddriver_hyperv=disabled \
    -Ddriver_libxl=enabled \
    -Ddriver_vz=disabled \
    -Dsanlock=disabled \
    -Dsecdriver_apparmor=disabled \
    -Dsecdriver_selinux=disabled \
    -Dstorage_vstorage=disabled \
    -Ddtrace=disabled \
    -Dnumad=disabled \
    -Dstorage_zfs=enabled\
    -Dstorage_rbd=disabled

  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  conflicts=('libvirt')
  provides=("libvirt=$pkgver" 'libvirt.so' 'libvirt-admin.so' 'libvirt-lxc.so' 'libvirt-qemu.so')
  provides+=('libvirt-libxl.so')

  DESTDIR="$pkgdir" ninja -C build install
  mkdir "$pkgdir"/usr/lib/{sysusers,tmpfiles}.d
  echo 'g libvirt - -' > "$pkgdir/usr/lib/sysusers.d/libvirt.conf"
  echo 'u libvirt-qemu /var/lib/libvirt "Libvirt QEMU user"' >> "$pkgdir/usr/lib/sysusers.d/libvirt.conf"
  echo 'm libvirt-qemu kvm' >> "$pkgdir/usr/lib/sysusers.d/libvirt.conf"
  echo 'z /var/lib/libvirt/qemu 0751' > "$pkgdir/usr/lib/tmpfiles.d/libvirt.conf"

  chown 0:102 "$pkgdir/usr/share/polkit-1/rules.d"
  chmod 0750 "$pkgdir/usr/share/polkit-1/rules.d"
  chmod 600 "$pkgdir"/etc/libvirt/nwfilter/*.xml \
    "$pkgdir/etc/libvirt/qemu/networks/default.xml"
  chmod 700 "$pkgdir"/etc/libvirt/secrets

  rm -rf \
    "$pkgdir/run" \
    "$pkgdir/var/lib/libvirt/qemu" \
    "$pkgdir/var/cache/libvirt/qemu"

  rm -f "$pkgdir/etc/libvirt/qemu/networks/autostart/default.xml"

  # remove split modules
  rm "$pkgdir"/usr/lib/libvirt/storage-backend/libvirt_storage_backend_gluster.so
  rm "$pkgdir/usr/lib/libvirt/storage-backend/libvirt_storage_backend_iscsi-direct.so"
  rm "$pkgdir/usr/lib/libvirt/storage-file/libvirt_storage_file_gluster.so"
}
