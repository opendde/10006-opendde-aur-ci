# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>

### BUILD OPTIONS
# Set the next two variables to ANYTHING that is not null to enable them

# NUMA is optimized for multi-socket motherboards.
# A single multi-core CPU actually runs slower with NUMA enabled.
# See, https://bugs.archlinux.org/task/31187
_NUMAdisable=y

# Enable fsync
_fsync=y

#enable futex2
_futex2=y

#enable winesync
_winesync=y

### Set performance governor as default
_per_gov=y

### Running with a 2000 HZ, 1000HZ, 750Hz or  500HZ tick rate
_2k_HZ_ticks=
_1k_HZ_ticks=
_750_HZ_ticks=y
_500_HZ_ticks=

### Disable MQ-Deadline I/O scheduler
_mq_deadline_disable=y

### Disable Kyber I/O scheduler
_kyber_disable=y
### Enable protect file mappings under memory pressure
_mm_protect=y
_lru_enable=y

### Enable Linux Random Number Generator
_lrng_enable=y

# Tweak kernel options prior to a build via nconfig
_makenconfig=

## Setting some security options
use_selinux=n
use_tomoyo=n
use_yama=n
use_apparmor=

## Apply Kernel automatic Optimization
_use_auto_optimization=y

## Apply Kernel Optimization selecting
_use_optimization_select=


# Only compile active modules to VASTLY reduce the number of modules built and
# the build time.
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD reads the database kept if it exists
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
_localmodcfg=

# Use the current kernel's .config file
# Enabling this option will use the .config of the RUNNING kernel rather than
# the ARCH defaults. Useful when the package gets updated and you already went
# through the trouble of customizing your config options.  NOT recommended when
# a new kernel is released, but again, convenient for package bumps.
_use_current=

pkgbase=linux-cacule
pkgname=('linux-cacule' 'linux-cacule-headers')
pkgname=("${pkgbase}" "${pkgbase}-headers")
pkgver=5.14.1
pkgrel=2
arch=(x86_64 x86_64_v3)
pkgdesc='Linux-CacULE Kernel by Hamad Marri and with some other patchsets'
_gittag=v${pkgver%.*}-${pkgver##*.}
arch=('x86_64' 'x86_64_v3')
url="https://github.com/hamadmarri/cacule-cpu-scheduler"
license=('GPL2')
options=('!strip')
makedepends=('kmod' 'bc' 'libelf' 'python-sphinx' 'python-sphinx_rtd_theme'
             'graphviz' 'imagemagick' 'pahole' 'cpio' 'perl' 'tar' 'xz')
_caculepatches="https://raw.githubusercontent.com/ptr1337/linux-cacule-aur/master/patches/CacULE"
_patchsource="https://raw.githubusercontent.com/ptr1337/linux-cacule-aur/master/patches/5.14"
source=("https://cdn.kernel.org/pub/linux/kernel/v${pkgver:0:1}.x/linux-${pkgver}.tar.xz"
        "config"
        "${_patchsource}/arch-patches/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch"
        "${_caculepatches}/v5.14/cacule-5.14-full.patch"
        "${_patchsource}/misc/0004-folio-mm.patch"
        "${_patchsource}/misc/0009-compiler-remove-stale-cc-option-checks.patch"
        "${_patchsource}/misc/0007-string.patch"
        "${_patchsource}/misc/allpollingrate.patch"
        "${_patchsource}/misc/0001-LL-kconfig-add-750Hz-timer-interrupt-kernel-config-o.patch"
        "${_patchsource}/bfq-patches/0001-bfq-patches.patch"
        "${_patchsource}/android-patches/0001-android-export-symbold-and-enable-building-ashmem-an.patch"
        "${_patchsource}/bbr2-patches/0001-bbr2-5.14-introduce-BBRv2.patch"
        "${_patchsource}/block-patches/0001-block-patches.patch"
    #   "${_patchsource}/fixes-miscellaneous/0001-fixes-miscellaneous.patch"
        "${_patchsource}/0007-v5.14-fsync.patch"
        "${_patchsource}/0007-v5.14-futex2_interface.patch"
        "${_patchsource}/lqx-patches/0001-lqx-patches.patch"
        "${_patchsource}/lrng-patches/0001-lrng-patches.patch"
        "${_patchsource}/mm-patches/0001-mm-5.14-protect-mappings-under-memory-pressure.patch"
        "${_patchsource}/pf-patches-v3/0001-pf-patches.patch"
        "${_patchsource}/xanmod-patches/0001-xanmod-patches.patch"
        "${_patchsource}/zen-patches/0001-zen-patches.patch"
        "${_patchsource}/zstd-patches-v2/0001-zstd-patches.patch"
        "${_patchsource}/zstd-upstream-patches/0001-zstd-upstream-patches.patch"
        "${_patchsource}/ntfs3-patches-v4/0001-ntfs3-patches.patch"
        "${_patchsource}/0001-cpu-patches.patch"
        "${_patchsource}/0001-winesync.patch"
        "${_patchsource}/0001-v4l2loopback.patch"
        "${_patchsource}/0001-ksm.patch"
	      "auto-cpu-optimization.sh"
        )
BUILD_FLAGS=(
            )

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd "${srcdir:?}/linux-${pkgver}" || (
    echo -e "\E[1;31mCan't cd to ${srcdir:?}/linux-${pkgver} directory! Prepare failed! \E[0m"
    exit 1
  )

  ### Setting version
  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname


    local src
        for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        echo "Applying patch $src..."
        patch -Np1 < "../$src"
    done

          echo "Setting config..."
          cp ../config .config

      ### Microarchitecture Optimization (GCC/CLANG)
            if [ -n "$_use_auto_optimization" ]; then
              sh "${srcdir}"/auto-cpu-optimization.sh
            fi
            if [ -n "$_use_optimization_select" ]; then
              source "${startdir}"/configure
              cpu_arch
            fi
      ### Optionally set tickrate to 2000HZ
            if [ -n "$_2k_HZ_ticks" ]; then
              echo "Setting tick rate to 2k..."
              scripts/config --disable CONFIG_HZ_300
              scripts/config --enable CONFIG_HZ_2000
              scripts/config --set-val CONFIG_HZ 2000
            fi

      ### Optionally set tickrate to 1000
            if [ -n "$_1k_HZ_ticks" ]; then
              echo "Setting tick rate to 1k..."
              scripts/config --disable CONFIG_HZ_300
              scripts/config --enable CONFIG_HZ_1000
              scripts/config --set-val CONFIG_HZ 1000
            fi

            ### Optionally set tickrate to 500HZ
          if [ -n "$_750_HZ_ticks" ]; then
            echo "Setting tick rate to 500HZ..."
            scripts/config --disable CONFIG_HZ_300
            scripts/config --enable CONFIG_HZ_750
            scripts/config --set-val CONFIG_HZ 750
          fi

        ### Optionally set tickrate to 500HZ
            if [ -n "$_500_HZ_ticks" ]; then
              echo "Setting tick rate to 500HZ..."
              scripts/config --disable CONFIG_HZ_300
              scripts/config --enable CONFIG_HZ_500
              scripts/config --set-val CONFIG_HZ 500
            fi

        ### Optionally disable NUMA for 64-bit kernels only
          # (x86 kernels do not support NUMA)
            if [ -n "$_NUMAdisable" ]; then
              echo "Disabling NUMA from kernel config..."
              scripts/config --disable CONFIG_NUMA
            fi

            if [ -n "$_fsync" ]; then
              echo "Enable Fsync support"
              scripts/config --enable CONFIG_FUTEX
              scripts/config --enable CONFIG_FUTEX_PI
            fi

            if [ -n "$_futex2" ]; then
              echo "Enable Futex2 support"
              scripts/config --enable CONFIG_FUTEX2
            fi

            if [ -n "$_winesync" ]; then
              echo "Enable winesync support"
              scripts/config --module CONFIG_WINESYNC
            fi
        ### Set performance governor
            if [ -n "$_per_gov" ]; then
              echo "Setting performance governor..."
              scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
              scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
              echo "Disabling uneeded governors..."
              scripts/config --enable CONFIG_CPU_FREQ_GOV_ONDEMAND
              scripts/config --disable CONFIG_CPU_FREQ_GOV_CONSERVATIVE
              scripts/config --disable CONFIG_CPU_FREQ_GOV_USERSPACE
              scripts/config --disable CONFIG_CPU_FREQ_GOV_SCHEDUTIL
            fi

            ### Disable MQ-Deadline I/O scheduler
        	   if [ -n "$_mq_deadline_disable" ]; then
        		   echo "Disabling MQ-Deadline I/O scheduler..."
        		   scripts/config --disable CONFIG_MQ_IOSCHED_DEADLINE
        	   fi

            ### Disable Kyber I/O scheduler
        	   if [ -n "$_kyber_disable" ]; then
        		   echo "Disabling Kyber I/O scheduler..."
        		   scripts/config --disable CONFIG_MQ_IOSCHED_KYBER
        	   fi

            ### Enable protect file mappings under memory pressure
            if [ -n "$_mm_protect" ]; then
              echo "Enabling protect file mappings under memory pressure..."
              scripts/config --enable CONFIG_UNEVICTABLE_FILE
              scripts/config --set-val CONFIG_UNEVICTABLE_FILE_KBYTES_LOW 262144
              scripts/config --set-val CONFIG_UNEVICTABLE_FILE_KBYTES_MIN 131072
              scripts/config --enable CONFIG_UNEVICTABLE_ANON
              scripts/config --set-val CONFIG_UNEVICTABLE_ANON_KBYTES_LOW 65536
              scripts/config --set-val CONFIG_UNEVICTABLE_ANON_KBYTES_MIN 32768
            fi

            ### Enable multigenerational LRU
            if [ -n "$_lru_enable" ]; then
              echo "Enabling multigenerational LRU..."
              scripts/config --enable CONFIG_HAVE_ARCH_PARENT_PMD_YOUNG
              scripts/config --enable CONFIG_LRU_GEN
              scripts/config --set-val CONFIG_NR_LRU_GENS 7
              scripts/config --set-val CONFIG_TIERS_PER_GEN 4
              scripts/config --enable CONFIG_LRU_GEN_ENABLED
              scripts/config --disable CONFIG_LRU_GEN_STATS
            fi


            if [ "$use_selinux" = "n" ]; then
              echo "Disabling SELinux..."
              scripts/config --disable CONFIG_SECURITY_SELINUX
            fi

            if [ "$use_tomoyo" = "n" ]; then
              echo "Disabling TOMOYO..."
              scripts/config --disable CONFIG_SECURITY_TOMOYO
            fi

            if [ "$use_apparmor" = "n" ]; then
              echo "Disabling AppArmor..."
              scripts/config --disable CONFIG_SECURITY_APPARMOR
              scripts/config --set-str CONFIG_LSM lockdown,yama,integrity
            fi

            if [ "$use_yama" = "n" ]; then
              echo "Disabling YAMA..."
              scripts/config --disable CONFIG_SECURITY_YAMA
              scripts/config --set-str CONFIG_LSM lockdown,integrity,apparmor
            fi

              ### Enable Linux Random Number Generator
          	if [ -n "$_lrng_enable" ]; then
          		echo "Enabling Linux Random Number Generator ..."
          		scripts/config --enable CONFIG_LRNG
          		scripts/config --disable CONFIG_LRNG_OVERSAMPLE_ENTROPY_SOURCES
          		scripts/config --set-val CONFIG_CONFIG_LRNG_OVERSAMPLE_ES_BITS 0
          		scripts/config --set-val CONFIG_LRNG_SEED_BUFFER_INIT_ADD_BITS 0
          		scripts/config --enable CONFIG_LRNG_CONTINUOUS_COMPRESSION_ENABLED
          		scripts/config --disable CONFIG_LRNG_CONTINUOUS_COMPRESSION_DISABLED
          		scripts/config --disable CONFIG_LRNG_SWITCHABLE_CONTINUOUS_COMPRESSION
          		scripts/config --disable CONFIG_LRNG_COLLECTION_SIZE_32
          		scripts/config --disable CONFIG_LRNG_COLLECTION_SIZE_256
          		scripts/config --disable CONFIG_LRNG_COLLECTION_SIZE_512
          		scripts/config --enable CONFIG_LRNG_COLLECTION_SIZE_1024
          		scripts/config --disable CONFIG_LRNG_COLLECTION_SIZE_2048
          		scripts/config --disable CONFIG_LRNG_COLLECTION_SIZE_4096
          		scripts/config --disable CONFIG_LRNG_COLLECTION_SIZE_8192
          		scripts/config --set-val CONFIG_LRNG_COLLECTION_SIZE 1024
          		scripts/config --disable CONFIG_LRNG_HEALTH_TESTS
          		scripts/config --set-val CONFIG_LRNG_RCT_CUTOFF 31
          		scripts/config --set-val CONFIG_LRNG_APT_CUTOFF 325
          		scripts/config --set-val CONFIG_LRNG_IRQ_ENTROPY_RATE 256
          		scripts/config --enable CONFIG_LRNG_JENT
          		scripts/config --set-val CONFIG_LRNG_JENT_ENTROPY_RATE 16
          		scripts/config --set-val CONFIG_LRNG_CPU_ENTROPY_RATE 8
          		scripts/config --disable CONFIG_LRNG_DRNG_SWITCH
          		scripts/config --disable CONFIG_LRNG_DRBG
          		scripts/config --disable CONFIG_LRNG_TESTING_MENU
          		scripts/config --disable CONFIG_LRNG_SELFTEST
          	fi

              echo "Enable Anbox"
              scripts/config --module  CONFIG_ASHMEM
              scripts/config --enable  CONFIG_ANDROID_BINDER_IPC_SELFTEST
              scripts/config --enable  CONFIG_ANDROID
              scripts/config --enable  CONFIG_ANDROID_BINDER_IPC
              scripts/config --enable  CONFIG_ANDROID_BINDERFS
              scripts/config --set-str CONFIG_ANDROID_BINDER_DEVICES binder,hwbinder,vndbinder
              echo "Disabling TCP_CONG_CUBIC..."
              scripts/config --module CONFIG_TCP_CONG_CUBIC
              scripts/config --disable CONFIG_DEFAULT_CUBIC
              echo "Enabling TCP_CONG_BBR2..."
              scripts/config --enable CONFIG_TCP_CONG_BBR2
              scripts/config --enable CONFIG_DEFAULT_BBR2
              scripts/config --set-str CONFIG_DEFAULT_TCP_CONG bbr2
              echo "Enable VHBA-Module"
              scripts/config --module CONFIG_VHBA
              ### Enabling ZSTD COMPRESSION ##
              echo "Set module compression to ZSTD"
              scripts/config --enable CONFIG_MODULE_COMPRESS
              scripts/config --disable CONFIG_MODULE_COMPRESS_XZ
              scripts/config --enable CONFIG_MODULE_COMPRESS_ZSTD
              scripts/config --set-val CONFIG_MODULE_COMPRESS_ZSTD_LEVEL 19
              scripts/config --disable CONFIG_KERNEL_ZSTD_LEVEL_ULTRA
              echo "Enabling KBUILD_CFLAGS -O3..."
              scripts/config --disable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
              scripts/config --enable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3
              echo "Enable PREEMPT"
              scripts/config --disable CONFIG_PREEMPT_NONE
              scripts/config --disable CONFIG_PREEMPT_VOLUNTARY
              scripts/config --enable CONFIG_PREEMPT
              scripts/config --enable CONFIG_PREEMPT_COUNT
              scripts/config --enable CONFIG_PREEMPTION
              scripts/config --enable CONFIG_PREEMPT_DYNAMIC
              echo "Enable NTFS3"
              scripts/config --module CONFIG_NTFS_FS
              scripts/config --enable CONFIG_NTFS_RW
              scripts/config --enable CONFIG_NTFS_DEBUG
              scripts/config --module CONFIG_NTFS3_FS
              scripts/config --enable CONFIG_NTFS3_64BIT_CLUSTER
              scripts/config --enable CONFIG_NTFS3_LZX_XPRESS
              scripts/config --enable CONFIG_NTFS3_FS_POSIX_ACL

    ### Optionally use running kernel's config
    # code originally by nous; http://aur.archlinux.org/packages.php?ID=40191
    if [ -n "$_use_current" ]; then
        if [[ -s /proc/config.gz ]]; then
            echo "Extracting config from /proc/config.gz..."
            # modprobe configs
            zcat /proc/config.gz > ./.config
        else
            warning "Your kernel was not compiled with IKCONFIG_PROC!"
            warning "You cannot read the current config!"
            warning "Aborting!"
            exit
        fi
    fi

    ### Optionally load needed modules for the make localmodconfig
    # See https://aur.archlinux.org/packages/modprobed-db
    if [ -n "$_localmodcfg" ]; then
        if [ -e "$HOME"/.config/modprobed.db ]; then
            echo "Running Steven Rostedt's make localmodconfig now"
            make ${BUILD_FLAGS[*]} LSMOD="$HOME"/.config/modprobed.db localmodconfig
        else
            echo "No modprobed.db data found"
            exit
        fi
    fi

    echo "Applying default config..."
    make ${BUILD_FLAGS[*]} olddefconfig
    make ${BUILD_FLAGS[*]} -s kernelrelease > version
    echo "Prepared $pkgbase version $(<version)"

    [[ -z "$_makenconfig" ]] || make ${BUILD_FLAGS[*]} nconfig

    ### Save configuration for later reuse
    cp -Tf ./.config "${startdir}/config-${pkgver}-${pkgrel}${pkgbase#linux}"
}

build() {
  cd "${srcdir:?}/linux-${pkgver}" || (
    echo -e "\E[1;31mCan't cd to ${srcdir:?}/linux-${pkgver} directory! Build failed! \E[0m"
    exit 1
  )
    make ${BUILD_FLAGS[*]} all
}

package_linux-cacule() {
  pkgdesc="The ${pkgdesc} and modules"
  depends=(coreutils kmod initramfs )
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE)
  replaces=()

  cd "${srcdir:?}/linux-${pkgver}" || (
    echo -e "\E[1;31mCan't cd to ${srcdir:?}/linux-${pkgver} directory! Package linux kernel failed! \E[0m"
    exit 1
  )

  local kernver="$(<version)"
  local modulesdir="${pkgdir:?}/usr/lib/modules/$kernver"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "${modulesdir}/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "${pkgbase}" | install -Dm644 /dev/stdin "${modulesdir}/pkgbase"

  echo "Installing modules..."
  make ${BUILD_FLAGS[*]} INSTALL_MOD_PATH="${pkgdir:?}/usr" INSTALL_MOD_STRIP=1 modules_install

  # remove build and source links
  rm "${modulesdir}/"{source,build}

}

package_linux-cacule-headers() {

  pkgdesc="Headers and scripts for building modules for the ${pkgdesc}"
  depends=("linux-cacule=${pkgver}" "pahole")

  cd "${srcdir:?}/linux-${pkgver}" || (
    echo -e "\E[1;31mCan't cd to ${srcdir:?}/linux-${pkgver} directory! Package linux headers failed! \E[0m"
    exit 1
  )

  local builddir="${pkgdir:?}/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "${builddir}" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "${builddir}/kernel" -m644 kernel/Makefile
  install -Dt "${builddir}/arch/x86" -m644 arch/x86/Makefile
  cp -t "${builddir}" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "${builddir}/tools/objtool" tools/objtool/objtool

  # add xfs and shmem for aufs building
  mkdir -p "${builddir}"/{fs/xfs,mm}

  echo "Installing headers..."
  cp -t "${builddir}" -a include
  cp -t "${builddir}/arch/x86" -a arch/x86/include
  install -Dt "${builddir}/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  install -Dt "${builddir}/drivers/md" -m644 drivers/md/*.h
  install -Dt "${builddir}/net/mac80211" -m644 net/mac80211/*.h

  # https://bugs.archlinux.org/task/13146
  install -Dt "${builddir}/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # https://bugs.archlinux.org/task/20402
  install -Dt "${builddir}/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "${builddir}/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "${builddir}/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # https://bugs.archlinux.org/task/71392
  install -Dt "${builddir}/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

  echo "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "${builddir}/{}" \;

  echo "Removing unneeded architectures..."
  local arch
  for arch in "${builddir}"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  echo "Removing documentation..."
  rm -r "${builddir}/Documentation"

  echo "Removing broken symlinks..."
  find -L "${builddir}" -type l -printf 'Removing %P\n' -delete

  echo "Removing loose objects..."
  find "${builddir}" -type f -name '*.o' -printf 'Removing %P\n' -delete

  echo "Stripping build tools..."
  local file
  while read -rd '' file; do
    case "$(file -bi "$file")" in
    application/x-sharedlib\;*) # Libraries (.so)
      strip -v "${STRIP_SHARED}" "$file" ;;
    application/x-archive\;*) # Libraries (.a)
      strip -v "${STRIP_STATIC}" "$file" ;;
    application/x-executable\;*) # Binaries
      strip -v "${STRIP_BINARIES}" "$file" ;;
    application/x-pie-executable\;*) # Relocatable binaries
      strip -v "${STRIP_SHARED}" "$file" ;;
    esac
  done < <(find "${builddir}" -type f -perm -u+x ! -name vmlinux -print0)

  echo "Stripping vmlinux..."
  strip -v "${STRIP_STATIC}" "${builddir}/vmlinux"

  echo "Adding symlink..."
  mkdir -p "${pkgdir:?}/usr/src"
  ln -sr "${builddir}" "${pkgdir:?}/usr/src/${pkgbase}"

}

md5sums=('be936a500fab39069e50b0bcfcc0c369'
         'e83ba8542661e0f4d70d96f3e91ee911'
         'cf26387aadf2a90428350ac246b070c9'
         '024a0126cfcd18e000a2241f35c4d69e'
         'a804260e2f301ffe2a17d6e3625a9711'
         '50868332310ae198428861fb7e743d5e'
         'd6e5581b4fade267a28deb8e73d236f5'
         'f154315498da9bf593c11d88041bde48'
         'f8e172e9ea554bbb1053eb122c3ace35'
         'a0285c065b902ca625119e4ad43cbab4'
         'e45c7962a78d6e82a0d3808868cd6ac0'
         '196d6ac961497aa880264b83160eb140'
         'a3f2cbf318dd2a63af9673f9e34e7125'
         '77148eba8e77fc41a44f5f6d3b440573'
         'c1dfe3a0b5c31e9a97d1827642f0bc5b'
         '6787c78ba3e7b0a34fbba9c50da7e3b4'
         '3cf036429a7c962005a344e10a568d7b'
         '8edec54f500ecb2ff705c2a9f32e0560'
         '30a7be161ab863c46e5ad55796d06a29'
         '28864f14bf33bad92e57bc48bc5c2c78'
         '381bc4f0ff885e9b67e5899476a30416'
         '808981a36c81165953017e5e432c1fa1'
         '0553f660f2399549ed17b6d2ca4e930e'
         'bb5234c6cd12276dbc4d231cc038f8f7'
         'bb22330e270bf36ccf53cb04d6b496d2'
         '4c493a3e0f3486be8ad1b6c67c9c6917'
         '95eb4457f95f3f8dd153983612ee65c0'
         '566435a0444ee45816599f2e0e362c7a'
         '6bfbbe0bbb79379203889ed7df5e5288')
