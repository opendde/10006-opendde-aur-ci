# $Id: PKGBUILD 323214 2018-05-01 16:45:25Z anatolik $
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Sébastien "Seblu" Luttringer <seblu@seblu.net>

#pkgbase=qemu
#pkgname=(qemu qemu-headless qemu-arch-extra qemu-headless-arch-extra
#         qemu-block-{iscsi,rbd,gluster} qemu-guest-agent)
pkgname='qemu-minimal'
#pkgdesc="A generic and open source machine emulator and virtualizer"
pkgdesc="A generic and open source machine emulator and virtualizer. This is a stripped-down version of the official package and requires only the bare essentials for running on a headless server."
pkgver=2.12.0
pkgrel=1
arch=(x86_64)
license=(GPL2 LGPL2.1)
url="http://wiki.qemu.org/"
_headlessdeps=(seabios gnutls libpng libaio numactl jemalloc xfsprogs libnfs
               lzo snappy curl vde2 libcap-ng spice libcacard usbredir)
_minimaldeps=(seabios libaio jemalloc
              lzo curl libcap-ng)
#depends=(virglrenderer sdl2 vte3 libpulse "${_headlessdeps[@]}")
#makedepends=(spice-protocol python2 ceph libiscsi glusterfs)
depends=(pixman "${_minimaldeps[@]}")
makedepends=(python2)
conflicts=('qemu' 'qemu-headless')
provides=('qemu' 'qemu-headless')
source=(https://download.qemu.org/qemu-$pkgver.tar.xz{,.sig}
        qemu-ga.service
        65-kvm.rules
        remove-problematic-evdev-86-key-from-en-us-keymap.patch
        allow_elf64.patch)
sha256sums=('e69301f361ff65bf5dabd8a19196aeaa5613c1b5ae1678f0823bdf50e7d5c6fc'
            'SKIP'
            'c39bcde4a09165e64419fd2033b3532378bba84d509d39e2d51694d44c1f8d88'
            'a66f0e791b16b03b91049aac61a25950d93e962e1b2ba64a38c6ad7f609b532c'
            '3cefabbab32ab21cd3b5a8cc1165c96db0c6c93e7ee8dc9d2ca09be5fb5eccda'
            '59751f1ed26ea61b2a37ebee4be6979e584a450b611282138a0893aa9173e2e4')
validpgpkeys=('CEACC9E15534EBABB82D3FA03353C9CEF108B584')

case $CARCH in
  i?86) _corearch=i386 ;;
  x86_64) _corearch=x86_64 ;;
esac

prepare() {
#  mkdir build-{full,headless}
#  mkdir -p extra-arch-{full,headless}/usr/{bin,share/qemu}
  mkdir build-minimal

  cd ${pkgname:0:-8}-${pkgver}
  sed -i 's/vte-2\.90/vte-2.91/g' configure

  patch -p1 < ../remove-problematic-evdev-86-key-from-en-us-keymap.patch
  patch -p1 < ../allow_elf64.patch
}

build() {
#  _build full \
#    --audio-drv-list="pa alsa sdl"
#
#  _build headless \
#    --audio-drv-list= \
#    --disable-bluez \
#    --disable-sdl \
#    --disable-gtk \
#    --disable-vte \
#    --disable-opengl \
#    --disable-virglrenderer
  _build minimal \
    --audio-drv-list= \
    --disable-bluez \
    --disable-sdl \
    --disable-gtk \
    --disable-vte \
    --disable-opengl \
    --disable-virglrenderer \
    --enable-seccomp \
    --enable-tpm \
    --disable-docs \
    --disable-libiscsi \
    --disable-spice \
    --target-list=x86_64-softmmu
}

_build() (
  cd build-$1

  # qemu vs. make 4 == bad
  export ARFLAGS=rv

  # http://permalink.gmane.org/gmane.comp.emulators.qemu/238740
  export CFLAGS+=" -fPIC"

#  ../${pkgname}-${pkgver}/configure \
  ../${pkgname:0:-8}-${pkgver}/configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/qemu \
    --python=/usr/bin/python2 \
    --smbd=/usr/bin/smbd \
    --with-gtkabi=3.0 \
    --with-sdlabi=2.0 \
    --enable-modules \
    --enable-jemalloc \
    "${@:2}"

  make
)

package_qemu() {
  optdepends=('qemu-arch-extra: extra architectures support')
  provides=(qemu-headless)
  conflicts=(qemu-headless)
  replaces=(qemu-kvm)

  _package full
}

package_qemu-headless() {
  pkgdesc="QEMU without GUI"
  depends=("${_headlessdeps[@]}")
  optdepends=('qemu-headless-arch-extra: extra architectures support')

  _package headless
}

package() {
  _package minimal
}

_package() {
#  optdepends+=('samba: SMB/CIFS server support'
#               'qemu-block-iscsi: iSCSI block support'
#               'qemu-block-rbd: RBD block support'
#               'qemu-block-gluster: glusterfs block support')
  optdepends+=('samba: SMB/CIFS server support')
  install=qemu.install
  options=(!strip)

  make -C build-$1 DESTDIR="$pkgdir" install "${@:2}"

  # systemd stuff
  install -Dm644 65-kvm.rules "$pkgdir/usr/lib/udev/rules.d/65-kvm.rules"

  # remove conflicting /var/run directory
  cd "$pkgdir"
  rm -r var

  cd usr/lib
  tidy_strip

  # bridge_helper needs suid
  # https://bugs.archlinux.org/task/32565
  chmod u+s qemu/qemu-bridge-helper

#  # remove split block modules
#  rm qemu/block-{iscsi,rbd,gluster}.so

  cd ../bin
  tidy_strip

  # remove extra arch
  for _bin in qemu-*; do
    [[ -f $_bin ]] || continue

    case ${_bin#qemu-} in
      # guest agent
      ga) rm "$_bin"; continue ;;

      # tools
      img|io|nbd) continue ;;

      # core emu
      system-${_corearch}) continue ;;
    esac

#    mv "$_bin" "$srcdir/extra-arch-$1/usr/bin"
    rm "$_bin"
  done

  cd ../share/qemu
  for _blob in *; do
    [[ -f $_blob ]] || continue

    case $_blob in
      # provided by seabios package
      bios.bin|acpi-dsdt.aml|bios-256k.bin|vgabios-cirrus.bin|vgabios-qxl.bin|\
      vgabios-stdvga.bin|vgabios-vmware.bin) rm "$_blob"; continue ;;

      # iPXE ROMs
      efi-*|pxe-*) continue ;;

      # core blobs
      kvmvapic.bin|linuxboot*|multiboot.bin|sgabios.bin|vgabios*) continue ;;

      # Trace events definitions
      trace-events*) continue ;;

      # Logos
      *.bmp|*.svg) continue ;;
    esac

#    mv "$_blob" "$srcdir/extra-arch-$1/usr/share/qemu"
    rm "$_blob"
  done
}

package_qemu-arch-extra() {
  pkgdesc="QEMU for foreign architectures"
  depends=(qemu)
  provides=(qemu-headless-arch-extra)
  conflicts=(qemu-headless-arch-extra)
  options=(!strip)

  mv extra-arch-full/usr "$pkgdir"
}

package_qemu-headless-arch-extra() {
  pkgdesc="QEMU without GUI, for foreign architectures"
  depends=(qemu-headless)
  options=(!strip)

  mv extra-arch-headless/usr "$pkgdir"
}

package_qemu-block-iscsi() {
  pkgdesc="QEMU iSCSI block module"
  depends=(glib2 libiscsi jemalloc)

  install -D build-full/block-iscsi.so "$pkgdir/usr/lib/qemu/block-iscsi.so"
}

package_qemu-block-rbd() {
  pkgdesc="QEMU RBD block module"
  depends=(glib2 ceph)

  install -D build-full/block-rbd.so "$pkgdir/usr/lib/qemu/block-rbd.so"
}

package_qemu-block-gluster() {
  pkgdesc="QEMU GlusterFS block module"
  depends=(glib2 glusterfs)

  install -D build-full/block-gluster.so "$pkgdir/usr/lib/qemu/block-gluster.so"
}

package_qemu-guest-agent() {
  pkgdesc="QEMU Guest Agent"
  depends=(gcc-libs glib2)

  install -D build-full/qemu-ga "$pkgdir/usr/bin/qemu-ga"
  install -Dm644 qemu-ga.service "$pkgdir/usr/lib/systemd/system/qemu-ga.service"
  install -Dm755 "$srcdir/qemu-$pkgver/scripts/qemu-guest-agent/fsfreeze-hook" "$pkgdir/etc/qemu/fsfreeze-hook"
}

# vim:set ts=2 sw=2 et:
