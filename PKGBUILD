# Maintainer: RiverOnVenus <RiverOnVenus@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: graysky <graysky AT archlinux DOT us>

### BUILD OPTIONS
# Set the next two variables to ANYTHING that is not null to enable them

# Tweak kernel options prior to a build via nconfig
_makenconfig=

# Only compile select modules to reduce the number of modules built
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD reads the database kept if it exists
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
_localmodcfg=

# Optionally select a sub architecture by number or leave blank which will
# require user interaction during the build. Note that the generic (default)
# option is 36.
#
#  1. AMD Opteron/Athlon64/Hammer/K8 (MK8)
#  2. AMD Opteron/Athlon64/Hammer/K8 with SSE3 (MK8SSE3) (NEW)
#  3. AMD 61xx/7x50/PhenomX3/X4/II/K10 (MK10) (NEW)
#  4. AMD Barcelona (MBARCELONA) (NEW)
#  5. AMD Bobcat (MBOBCAT) (NEW)
#  6. AMD Jaguar (MJAGUAR) (NEW)
#  7. AMD Bulldozer (MBULLDOZER) (NEW)
#  8. AMD Piledriver (MPILEDRIVER) (NEW)
#  9. AMD Steamroller (MSTEAMROLLER) (NEW)
#  10. AMD Excavator (MEXCAVATOR) (NEW)
#  11. AMD Zen (MZEN) (NEW)
#  12. AMD Zen 2 (MZEN2) (NEW)
#  13. AMD Zen 3 (MZEN3) (NEW)
#  14. Intel P4 / older Netburst based Xeon (MPSC)
#  15. Intel Core 2 (MCORE2)
#  16. Intel Atom (MATOM)
#  17. Intel Nehalem (MNEHALEM) (NEW)
#  18. Intel Westmere (MWESTMERE) (NEW)
#  19. Intel Silvermont (MSILVERMONT) (NEW)
#  20. Intel Goldmont (MGOLDMONT) (NEW)
#  21. Intel Goldmont Plus (MGOLDMONTPLUS) (NEW)
#  22. Intel Sandy Bridge (MSANDYBRIDGE) (NEW)
#  23. Intel Ivy Bridge (MIVYBRIDGE) (NEW)
#  24. Intel Haswell (MHASWELL) (NEW)
#  25. Intel Broadwell (MBROADWELL) (NEW)
#  26. Intel Skylake (MSKYLAKE) (NEW)
#  27. Intel Skylake X (MSKYLAKEX) (NEW)
#  28. Intel Cannon Lake (MCANNONLAKE) (NEW)
#  29. Intel Ice Lake (MICELAKE) (NEW)
#  30. Intel Cascade Lake (MCASCADELAKE) (NEW)
#  31. Intel Cooper Lake (MCOOPERLAKE) (NEW)
#  32. Intel Tiger Lake (MTIGERLAKE) (NEW)
#  33. Intel Sapphire Rapids (MSAPPHIRERAPIDS) (NEW)
#  34. Intel Rocket Lake (MROCKETLAKE) (NEW)
#  35. Intel Alder Lake (MALDERLAKE) (NEW)
#  36. Generic-x86-64 (GENERIC_CPU)
#  37. Generic-x86-64-v2 (GENERIC_CPU2) (NEW)
#  38. Generic-x86-64-v3 (GENERIC_CPU3) (NEW)
#  39. Generic-x86-64-v4 (GENERIC_CPU4) (NEW)
#  40. Intel-Native optimizations autodetected by GCC (MNATIVE_INTEL) (NEW)
#  41. AMD-Native optimizations autodetected by GCC (MNATIVE_AMD) (NEW)
_subarch=

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgbase=linux-ck-uksm-cjktty
pkgver=5.12.15
pkgrel=1
_ckpatchversion=1
arch=(x86_64)
url="https://wiki.archlinux.org/index.php/Linux-ck"
license=(GPL2)
makedepends=(
  bc kmod libelf        cpio perl tar xz
)
options=('!strip')
_ckpatch="patch-5.12-ck${_ckpatchversion}"
_gcc_more_v=20210610
_patchsource="https://raw.githubusercontent.com/RiverOnVenus/linux-ck-uksm-cjktty/master/patches/5.12"
source=(
  "https://www.kernel.org/pub/linux/kernel/v5.x/linux-$pkgver.tar".{xz,sign}
  config         # the main kernel config file
  "more-uarches-$_gcc_more_v.tar.gz::https://github.com/graysky2/kernel_compiler_patch/archive/$_gcc_more_v.tar.gz"
  "http://ck.kolivas.org/patches/5.0/5.12/5.12-ck${_ckpatchversion}/$_ckpatch.xz"
  0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
  0002-x86-setup-Consolidate-early-memory-reservations.patch
  0003-x86-setup-Merge-several-reservations-of-start-of-mem.patch
  0004-x86-setup-Move-trim_snb_memory-later-in-setup_arch-t.patch
  0005-x86-setup-always-reserve-the-first-1M-of-RAM.patch
  0006-x86-setup-remove-CONFIG_X86_RESERVE_LOW-and-reservel.patch
  0007-x86-crash-remove-crash_reserve_low_1M.patch
  "${_patchsource}/uksm-patches/0001-UKSM-for-5.12.patch"
  "${_patchsource}/cjktty-patches/0001-cjktty-5.12-initial-import-from-https-github.com-zhm.patch"
  "${_patchsource}/bbr2-patches-v3/0001-bbr2-patches.patch"
  "${_patchsource}/bfq-patches-v15/0001-bfq-patches.patch"
  "${_patchsource}/block-patches-v6/0001-block-patches.patch"
  "${_patchsource}/btrfs-patches-v13/0001-btrfs-patches.patch"
  "${_patchsource}/fixes-miscellaneous/0001-fixes-miscellaneous.patch"
  "${_patchsource}/futex-patches-v2/0001-futex-resync-from-gitlab.collabora.com.patch"
  "${_patchsource}/futex2-stable-patches-v7/0001-futex2-resync-from-v7-gitlab.collabora.com.patch"
  "${_patchsource}/lru-patches-v4/0001-lru-patches.patch"
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
b2sums=('2d94859080bba686786b690733d6df4a17f6183c690854545b87d784d16fbc5050fc07be08b2360cc1d0a6fe11bd8f18add68c893d92bb52e10bb0f61ff4eb76'
        'SKIP'
        'e7b85b8015414c2405c35f811cc3d201e10fb717e94f4c54c921d4a51dafcd61a2ac61695cf4ad5f51a2dcf5fda0558d99a896ec6478f47e7577c7207a4f7a94'
        '30d1df754608bb423cbc99c2097ad521baa091b9a3b39df4bd5c2d50c57eec54d8fa0e4a4a04b847c3d1b87ba682cadc8db45fabeefdc9ad7caaf8e77b96e41a'
        'c9f729ba1efe6f04e7b2c57d3999bc9675b577596dccb2f227e5b6e444285e1fdd270bf67c0fcf9f5808a4c3a4b1c7a5c13a76f754ad9b9447243ccbaf2ce6a3'
        '2aa7bbea8e526ad080f4fbeef3364749b070e3d0b38f1b724a40796d455452f2c9865c96a25e52edcc8c827ce4dc3046db3cbbb858e899b9dd502673244b05c8'
        'c8a372bdb918ecc8faeb203df3945c664d59bd61864952ea5e354bf6cef6e546f3c548e26887a718d34e51753fad603a2bf10d579f8d5ba9303a7ddfe57ada4e'
        'b349cc801b7435a0772dafcefe4c350c925783a2fec96f56fb8b4298adbc494c295900e00498fd15894c6a778b67663743d2b2fe236765b2c65ec643d928b59d'
        '10efc6f5460b9397b9bb3369bd3e94883682806d77c0efb0e322034f8b4b422ab10d5e975fb2df8a3c12ed2ec5d0a36f795614e928224864178d7ef25e59638b'
        '14d6df3f80495d7c63f191a4cc2e42ab7fd27b1368f18c71e1d0f5230c9bfa0958c73c940bacf7f5073ed4288bbb846e1c2903b441e4171c8ea8171ce5d56e45'
        'abe1754b1c16e2e6a6c369f6497a6679f5e846ad9652d2d019425bfe5fa1186c1e75f46790ba15a227982abc61469e7423b3eee30e3dc56a631a5d36e3ecbffa'
        'ed1dc0f7e4f97969185de71b8f26c321359e06855d3c3b2ac3fccf2d1cdae121feb70fc5a6546c63d2ca0ce3ef21d510a40e4077262715d53165a1b236119788'
        '14f45171afc3b15488b40a05e58b352c5057da3a5782e13527392f7750d8e45a8db54f9b50b218fedb8bf679de3b4e5d78e230a44f7b1aa482f7b3aa831bd641'
        '9dfcc6b39c73945f2ba2071039a7ebf40bcfb23ab2f1cb8fe5050d86b73b34333882ea577f3b648ffeb3b76d7c0ff8d20e35b46e82726cd6970b441d266bdda1'
        'b6ab69f6b24293504f32a2fb10622c0e77ece7921c637456fba5e61e4d200063832be37a8119fae251d490cc4b80cfea3e45547e17de3cb363bcee164dffd581'
        '9aba508592818a4b4f000fc1bd471ec74687c8f0f972f330e851bd2364eaf30cff4d5012f843625ca025bc2478a2c76e0d082d43f33358ab18ce829fab4f0c2b'
        '67067d624711d663c1be1d35c5e59cb588faba1769b27443a3a13b44dbe9e627edd054a4fd122d04d587e21b25be5520fffb61cfc7538aee77c33a1a8cb1b97a'
        '705a8f2037eef3afdd0f2a7648cc8d00bfc03112385b44a8907182812b6aed075519a9236909c0e3ba09df887381dd76cb01c601e0df05119136f7318587a416'
        'f6d5e74b0b1b6c8a185312cb82d9908845bfddc0a5618ad55f059fb1d3d7950a78fb4879d1363f9fa9272da54a4374ef66cd5aef4ad006fb20e895bb8374e92b'
        '93cf09821abb234a04550c659aa5a4d5632297e326fc61caf8c65c74bb35bc37fdd0dd1d769e6512a8471177bd01f765400e5292ca2b93ad95f7a7e24ab8e996'
        '294f42c9e5099f923c0f2bfde2168e0e90cced379ae195cbe9505ab029900c60f17f58fa2200999a2dca91c9354f072d5171806bd9b4f8961d3d55281d7c6707'
        '195d90d613a64d7525b4fe228b6932fc1b821395559d6851b3cb5369431ac2b6e85119a0160040295697f69288e64335620bd94857c32b9302f39638a73833f9')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd linux-${pkgver}

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = 0*.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  echo "Setting config..."
  cp ../config .config

  # disable CONFIG_DEBUG_INFO=y at build time otherwise memory usage blows up
  # and can easily overwhelm a system with 32 GB of memory using a tmpfs build
  # partition ... this was introduced by FS#66260, see:
  # https://git.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/linux&id=663b08666b269eeeeaafbafaee07fd03389ac8d7
  scripts/config --disable CONFIG_DEBUG_INFO
  scripts/config --disable CONFIG_CGROUP_BPF
  scripts/config --disable CONFIG_BPF_LSM
  scripts/config --disable CONFIG_BPF_PRELOAD
  scripts/config --disable CONFIG_BPF_LIRC_MODE2
  scripts/config --disable CONFIG_BPF_KPROBE_OVERRIDE

  # https://bbs.archlinux.org/viewtopic.php?pid=1824594#p1824594
  scripts/config --enable CONFIG_PSI_DEFAULT_DISABLED

  # https://bbs.archlinux.org/viewtopic.php?pid=1863567#p1863567
  scripts/config --disable CONFIG_LATENCYTOP
  scripts/config --disable CONFIG_SCHED_DEBUG

  # FS#66613
  # https://bugzilla.kernel.org/show_bug.cgi?id=207173#c6
  scripts/config --disable CONFIG_KVM_WERROR

    echo "Enable Futex2 support"
    scripts/config --enable CONFIG_FUTEX2

    echo "Disabling TCP_CONG_CUBIC..."
    scripts/config --module CONFIG_TCP_CONG_CUBIC
    scripts/config --disable CONFIG_DEFAULT_CUBIC

    echo "Enabling TCP_CONG_BBR2..."
    scripts/config --enable CONFIG_TCP_CONG_BBR2
    scripts/config --enable CONFIG_DEFAULT_BBR2
    scripts/config --set-str CONFIG_DEFAULT_TCP_CONG bbr2

    echo "Disabling Deadline I/O scheduler and Kyber I/O scheduler"
    scripts/config --disable CONFIG_MQ_IOSCHED_DEADLINE
    scripts/config --disable CONFIG_MQ_IOSCHED_KYBER

    echo "Enable zram zstd"
    scripts/config --disable CONFIG_ZRAM_DEF_COMP_LZORLE
    scripts/config --enable CONFIG_ZRAM_DEF_COMP_ZSTD
    scripts/config --set-str CONFIG_ZRAM_DEF_COMP zstd

    echo "Enabling multigenerational LRU..."
    scripts/config --enable CONFIG_HAVE_ARCH_PARENT_PMD_YOUNG
    scripts/config --enable CONFIG_LRU_GEN
    scripts/config --set-val CONFIG_NR_LRU_GENS 7
    scripts/config --set-val CONFIG_TIERS_PER_GEN 4
    scripts/config --enable CONFIG_LRU_GEN_ENABLED
    scripts/config --disable CONFIG_LRU_GEN_STATS

  # fix naming schema in EXTRAVERSION of ck patch set
  sed -i -re "s/^(.EXTRAVERSION).*$/\1 = /" "../${_ckpatch}"

  # ck patchset itself
  echo "Patching with ck patchset..."
  patch -Np1 -i ../"${_ckpatch}"

  # non-interactively apply ck1 default options
  # this isn't redundant if we want a clean selection of subarch below
  make olddefconfig

  # https://github.com/graysky2/kernel_gcc_patch
  # make sure to apply after olddefconfig to allow the next section
  echo "Patching to enable GCC optimization for other uarchs..."
  patch -Np1 -i "$srcdir/kernel_compiler_patch-$_gcc_more_v/more-uarches-for-kernel-5.8+.patch"

  if [ -n "$_subarch" ]; then
    # user wants a subarch so apply choice defined above interactively via 'yes'
    yes "$_subarch" | make oldconfig
  else
    # no subarch defined so allow user to pick one
    make oldconfig
  fi

  ### Optionally load needed modules for the make localmodconfig
  # See https://aur.archlinux.org/packages/modprobed-db
    if [ -n "$_localmodcfg" ]; then
      if [ -f $HOME/.config/modprobed.db ]; then
        echo "Running Steven Rostedt's make localmodconfig now"
        make LSMOD=$HOME/.config/modprobed.db localmodconfig
      else
        echo "No modprobed.db data found"
        exit
      fi
    fi

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"

  [[ -z "$_makenconfig" ]] || make nconfig

  # save configuration for later reuse
  cat .config > "${startdir}/config.last"

  # uncomment if you want to build with distcc
  ### sed -i '/HAVE_GCC_PLUGINS/d' arch/x86/Kconfig
}

build() {
  cd linux-${pkgver}
  make all
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules with the ck1 patchset and uksm patch and cjktty patch etc.. featuring MuQSS CPU scheduler and default bbr2"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE)
  #groups=('ck-generic')

  cd linux-${pkgver}

  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  #install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"
  #
  # hard-coded path in case user defined CC=xxx for build which causes errors
  # see this FS https://bugs.archlinux.org/task/64315
  install -Dm644 arch/x86/boot/bzImage "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  #make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install
  # not needed since not building with CONFIG_DEBUG_INFO=y

  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for ${pkgbase/linux/Linux} kernel"
  depends=("$pkgbase") # added to keep kernel and headers packages matched
  #groups=('ck-generic')

  cd linux-${pkgver}
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

  echo "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/x86" -a arch/x86/include
  install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # https://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # https://bugs.archlinux.org/task/20402
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # https://bugs.archlinux.org/task/71392
  install -Dt "$builddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

  echo "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  echo "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  echo "Removing documentation..."
  rm -r "$builddir/Documentation"

  echo "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  echo "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  echo "Stripping build tools..."
  local file
  while read -rd '' file; do
    case "$(file -bi "$file")" in
      application/x-sharedlib\;*)      # Libraries (.so)
        strip -v $STRIP_SHARED "$file" ;;
      application/x-archive\;*)        # Libraries (.a)
        strip -v $STRIP_STATIC "$file" ;;
      application/x-executable\;*)     # Binaries
        strip -v $STRIP_BINARIES "$file" ;;
      application/x-pie-executable\;*) # Relocatable binaries
        strip -v $STRIP_SHARED "$file" ;;
    esac
  done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)

  #echo "Stripping vmlinux..."
  #strip -v $STRIP_STATIC "$builddir/vmlinux"
  # not needed since not building with CONFIG_DEBUG_INFO=y

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"

}

pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
