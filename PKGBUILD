# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Contributor: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

### Selecting the CPU scheduler
# ATTENTION - one of seven predefined values should be selected!
# 'bmq' - select 'BitMap Queue CPU scheduler'
# 'pds' - select 'Priority and Deadline based Skip list multiple queue CPU scheduler'
# 'cacule' - select 'CacULE scheduler'
# 'cacule-rdb' - select 'CacULE-RDB scheduler'
# 'bore' - select 'Burst-Oriented Response Enhancer'
# 'tt' - select 'Task Type Scheduler by Hamad Marri'
# 'cfs' - select 'Completely Fair Scheduler'
_cpusched='pds'

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

### Tweak kernel options prior to a build via nconfig
_makenconfig=

# NUMA is optimized for multi-socket motherboards.
# A single multi-core CPU actually runs slower with NUMA enabled.
# See, https://bugs.archlinux.org/task/31187
_NUMAdisable=y

# Compile ONLY used modules to VASTLYreduce the number of modules built
# and the build time.
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db script a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD read the database kept if it exists
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
_localmodcfg=

# Use the current kernel's .config file
# Enabling this option will use the .config of the RUNNING kernel rather than
# the ARCH defaults. Useful when the package gets updated and you already went
# through the trouble of customizing your config options.  NOT recommended when
# a new kernel is released, but again, convenient for package bumps.
_use_current=

### Enable KBUILD_CFLAGS -O3
_cc_harder=y

### Set performance governor as default
_per_gov=y

### Enable TCP_CONG_BBR2
_tcp_bbr2=y

### Running with a 1000HZ, 750Hz or  500HZ tick rate
_1k_HZ_ticks=
_750_HZ_ticks=y
_600_HZ_ticks=
_500_HZ_ticks=

### Disable MQ-Deadline I/O scheduler
_mq_deadline_disable=y

### Disable Kyber I/O scheduler
_kyber_disable=y

### Enable multigenerational LRU
_lru_enable=y

### Enable DAMON
_damon=y

_spf_enable=y

### Enable Linux Random Number Generator
_lrng_enable=y

## Apply Kernel automatic Optimization
_use_auto_optimization=y

## Apply Kernel Optimization selecting
_use_optimization_select=

### Selecting the ZSTD compression level
# ATTENTION - one of two predefined values should be selected!
# 'ultra' - highest compression ratio
# 'normal' - standard compression ratio
_zstd_level='ultra'

### Selecting the ZSTD module compression level
# If you want to use ZSTD compression,
# first install mkinitcpio-zstd:
# https://gitlab.com/sirlucjan/lucjan-kernels/tree/master/depends
# or
# https://github.com/sirlucjan/lucjan-kernels/tree/master/depends
# ATTENTION - one of two predefined values should be selected!
# 'ultra' - highest compression ratio
# 'normal' - standard compression ratio
# WARNING: the ultra settings can sometimes
# be counterproductive in both size and speed.
_zstd_level_value='normal'

# Enable zram/zswap ZSTD compression
_zstd_compression=y

_nf_cone=y

## Enable it for compiling with LLVM and THINLTO
_use_llvm_lto=

# Enable it for using the LLVM CFI PATCH for a better security
_use_cfi=

if [ -n "$_use_llvm_lto" ]; then
  pkgbase=linux-cachyos-pds-lto
else
  pkgbase=linux-cachyos-pds
fi
_major=5.17
_minor=3
#_minorc=$((_minor+1))
#_rcver=rc8
pkgver=${_major}.${_minor}
_stable=${_major}.${_minor}
#_stable=${_major}
#_stablerc=${_major}-${_rcver}
_srcname=linux-${_stable}
#_srcname=linux-${_major}
arch=(x86_64 x86_64_v3)
pkgdesc='Linux PDS scheduler Kernel by CachyOS with other patches and improvements'
pkgrel=2
arch=('x86_64' 'x86_64_v3')
url="https://github.com/CachyOS/linux-cachyos"
license=('GPL2')
options=('!strip')
makedepends=('bc' 'texlive-latexextra' 'libelf' 'pahole' 'cpio' 'perl' 'tar' 'xz' 'zstd' 'xmlto' 'git' 'gcc' 'gcc-libs' 'glibc' 'binutils' 'make' 'patch')
if [ -n "$_use_llvm_lto" ]; then
  depends=(clang llvm lld python)
fi
_patchsource="https://raw.githubusercontent.com/ptr1337/kernel-patches/master/5.17"
source=(
  "https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/${_srcname}.tar.xz"
  "config"
  "${_patchsource}/sched/0001-prjc.patch"
  #  "${_patchsource}/sched/0001-cacULE.patch"
  #  "${_patchsource}/sched/0001-bore-sched.patch"
  #  "${_patchsource}/sched/0001-tt.patch"
  "${_patchsource}/0001-arch-patches.patch"
  "${_patchsource}/0001-anbox.patch"
  "${_patchsource}/0001-bbr2.patch"
  "${_patchsource}/0001-block-patches.patch"
  "${_patchsource}/0001-btrfs-patches.patch"
  "${_patchsource}/0001-cachy.patch"
  "${_patchsource}/0001-cfi.patch"
  "${_patchsource}/0001-clearlinux.patch"
  "${_patchsource}/0001-cpu.patch"
  "${_patchsource}/0001-cpupower-patches.patch"
  "${_patchsource}/0001-fixes-miscellaneous.patch"
  "${_patchsource}/0001-lrng.patch"
  "${_patchsource}/0001-pf-patches.patch"
  "${_patchsource}/0001-hwmon.patch"
  "${_patchsource}/0001-MG-LRU.patch"
  "${_patchsource}/0001-spf-lru-patches.patch"
  "${_patchsource}/0001-uksm.patch"
  "${_patchsource}/0001-rcu.patch"
  "${_patchsource}/0001-v4l2loopback.patch"
  "${_patchsource}/0001-xanmod.patch"
  #  "${_patchsource}/0001-zen-patches.patch"
  #  "${_patchsource}/0001-FG-KASLR.patch"
  "auto-cpu-optimization.sh"
)

if [ -n "$_use_llvm_lto" ]; then
  BUILD_FLAGS=(
    LLVM=1
    LLVM_IAS=1
  )
fi

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {

  cd $_srcname

  ### Setting version
  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  ### Patching sources
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  ### Setting config
  echo "Setting config..."
  cp ../config .config

  ### Microarchitecture Optimization (GCC/CLANG)
  if [ -n "$_use_auto_optimization" ]; then
    "${srcdir}"/auto-cpu-optimization.sh
  fi

  if [ -n "$_use_optimization_select" ]; then
    source "${startdir}"/configure
    cpu_arch
  fi

  ### Selecting the CPU scheduler
  if [ "$_cpusched" = "bmq" ]; then
    echo "Selecting BMQ CPU scheduler..."
    scripts/config --enable CONFIG_SCHED_BMQ
    scripts/config --disable CONFIG_SCHED_PDS
  elif [ "$_cpusched" = "pds" ]; then
    echo "Selecting PDS CPU scheduler..."
    scripts/config --disable CONFIG_SCHED_BMQ
    scripts/config --enable CONFIG_SCHED_PDS
  elif [ "$_cpusched" = "cacule" ]; then
    echo "Selecting CacULE scheduler..."
    scripts/config --disable CONFIG_SCHED_ALT
    scripts/config --enable CONFIG_CACULE_SCHED
  elif [ "$_cpusched" = "cacule-rdb" ]; then
    echo "Selecting CacULE-RDB scheduler..."
    scripts/config --disable CONFIG_SCHED_ALT
    scripts/config --enable CONFIG_CACULE_SCHED
    scripts/config --enable CONFIG_CACULE_RDB
    scripts/config --set-val CONFIG_RDB_INTERVAL 19
  elif [ "$_cpusched" = "tt" ]; then
    echo "Enable TT CPU scheduler..."
    scripts/config --enable CONFIG_TT_SCHED
    scripts/config --enable CONFIG_TT_ACCOUNTING_STATS
  elif [ "$_cpusched" = "bore" ]; then
    echo "Selecting BORE Scheduler..."
    scripts/config --disable CONFIG_SCHED_ALT
  elif [ "$_cpusched" = "cfs" ]; then
    echo "Selecting Completely Fair Scheduler..."
    scripts/config --disable CONFIG_SCHED_ALT
  else
    if [ -n "$_cpusched" ]; then
      error "The value $_cpusched is invalid. Choose the correct one again."
    else
      error "The value is empty. Choose the correct one again."
    fi
    error "Selecting the CPU scheduler failed!"
    exit
  fi

  if [ -n "$_use_cfi" ] && [ -n "$_use_llvm_lto" ]; then
    echo "Enabling CFI"
    scripts/config --enable CONFIG_ARCH_SUPPORTS_CFI_CLANG
    scripts/config --enable CONFIG_CFI_CLANG
  fi

  if [ -n "$_use_llvm_lto" ]; then
    scripts/config --disable LTO_NONE \
      --enable LTO \
      --enable LTO_CLANG \
      --enable ARCH_SUPPORTS_LTO_CLANG \
      --enable ARCH_SUPPORTS_LTO_CLANG_THIN \
      --enable HAS_LTO_CLANG \
      --enable LTO_CLANG_THIN \
      --enable HAVE_GCC_PLUGINS
  fi

  ### Optionally set tickrate to 1000
  if [ -n "$_1k_HZ_ticks" ]; then
    echo "Setting tick rate to 1k..."
    scripts/config --disable CONFIG_HZ_300
    scripts/config --enable CONFIG_HZ_1000
    scripts/config --set-val CONFIG_HZ 1000
  fi

  ### Optionally set tickrate to 750HZ
  if [ -n "$_750_HZ_ticks" ]; then
    echo "Setting tick rate to 750HZ..."
    scripts/config --disable CONFIG_HZ_300
    scripts/config --enable CONFIG_HZ_750
    scripts/config --set-val CONFIG_HZ 750
  fi

  ### Optionally set tickrate to 600HZ
  if [ -n "$_600_HZ_ticks" ]; then
    echo "Setting tick rate to 600HZ..."
    scripts/config --disable CONFIG_HZ_300
    scripts/config --enable CONFIG_HZ_600
    scripts/config --set-val CONFIG_HZ 600
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

  if [ -n "$_winesync" ]; then
    echo "Enable winesync support"
    scripts/config --module CONFIG_WINESYNC
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

  ### Set performance governor
  if [ -n "$_per_gov" ]; then
    echo "Setting performance governor..."
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
    scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
    echo "Disabling uneeded governors..."
    scripts/config --disable CONFIG_CPU_FREQ_GOV_ONDEMAND
    scripts/config --disable CONFIG_CPU_FREQ_GOV_CONSERVATIVE
    scripts/config --disable CONFIG_CPU_FREQ_GOV_USERSPACE
    scripts/config --disable CONFIG_CPU_FREQ_GOV_SCHEDUTIL
  fi

  ### Enable KBUILD_CFLAGS -O3
  if [ -n "$_cc_harder" ]; then
    echo "Enabling KBUILD_CFLAGS -O3..."
    scripts/config --disable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
    scripts/config --enable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3
  fi

  ### Enable TCP_CONG_BBR2
  if [ -n "$_tcp_bbr2" ]; then
    echo "Disabling TCP_CONG_CUBIC..."
    scripts/config --module CONFIG_TCP_CONG_CUBIC
    scripts/config --disable CONFIG_DEFAULT_CUBIC
    echo "Enabling TCP_CONG_BBR2..."
    scripts/config --enable CONFIG_TCP_CONG_BBR2
    scripts/config --enable CONFIG_DEFAULT_BBR2
    scripts/config --set-str CONFIG_DEFAULT_TCP_CONG bbr2
  fi


  ### Enable FULLCONENAT
  if [ -n "$_nf_cone" ]; then
    echo "Enabling FULLCONENAT..."
    scripts/config --module CONFIG_IP_NF_TARGET_FULLCONENAT
    scripts/config --module CONFIG_NETFILTER_XT_TARGET_FULLCONENAT
  fi

  ### Enable SPF
  if [ -n "$_spf_enable" ]; then
    echo "Enabling multigenerational LRU..."
    scripts/config --enable CONFIG_SPECULATIVE_PAGE_FAULT
  fi

  ### Enable multigenerational LRU
  if [ -n "$_lru_enable" ]; then
    echo "Enabling multigenerational LRU..."
    scripts/config --enable CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG
    scripts/config --enable CONFIG_LRU_GEN
    scripts/config --enable CONFIG_LRU_GEN_ENABLED
    scripts/config --disable CONFIG_LRU_GEN_STATS
  fi

  ### Enable DAMON
  if [ -n "$_damon" ]; then
    echo "Enabling DAMON..."
    scripts/config --enable CONFIG_DAMON
    scripts/config --disable CONFIG_DAMON_VADDR
    scripts/config --disable CONFIG_DAMON_DBGFS
    scripts/config --enable CONFIG_DAMON_PADDR
    scripts/config --enable CONFIG_DAMON_RECLAIM
  fi

  ### Enable Linux Random Number Generator
  if [ -n "$_lrng_enable" ]; then
    echo "Enabling Linux Random Number Generator ..."
		scripts/config --disable CONFIG_RANDOM_DEFAULT_IMPL
		scripts/config --enable CONFIG_LRNG
		scripts/config --enable CONFIG_LRNG_OVERSAMPLE_ENTROPY_SOURCES
		scripts/config --set-val CONFIG_CONFIG_LRNG_OVERSAMPLE_ES_BITS 64
		scripts/config --set-val CONFIG_LRNG_SEED_BUFFER_INIT_ADD_BITS 128
		scripts/config --enable CONFIG_LRNG_IRQ
		scripts/config --enable CONFIG_LRNG_CONTINUOUS_COMPRESSION_ENABLED
		scripts/config --disable CONFIG_LRNG_CONTINUOUS_COMPRESSION_DISABLED
		scripts/config --enable CONFIG_LRNG_ENABLE_CONTINUOUS_COMPRESSION
		scripts/config --enable CONFIG_LRNG_SWITCHABLE_CONTINUOUS_COMPRESSION
		scripts/config --disable CONFIG_LRNG_COLLECTION_SIZE_512
		scripts/config --enable CONFIG_LRNG_COLLECTION_SIZE_1024
		scripts/config --disable CONFIG_LRNG_COLLECTION_SIZE_2048
		scripts/config --disable CONFIG_LRNG_COLLECTION_SIZE_4096
		scripts/config --disable CONFIG_LRNG_COLLECTION_SIZE_8192
		scripts/config --set-val CONFIG_LRNG_COLLECTION_SIZE 1024
		scripts/config --enable CONFIG_LRNG_HEALTH_TESTS
		scripts/config --set-val CONFIG_LRNG_RCT_CUTOFF 31
		scripts/config --set-val CONFIG_LRNG_APT_CUTOFF 325
		scripts/config --set-val CONFIG_LRNG_IRQ_ENTROPY_RATE 256
		scripts/config --enable CONFIG_LRNG_JENT
		scripts/config --set-val CONFIG_LRNG_JENT_ENTROPY_RATE 16
		scripts/config --enable CONFIG_LRNG_CPU
		scripts/config --set-val CONFIG_LRNG_CPU_ENTROPY_RATE 8
		scripts/config --enable CONFIG_LRNG_DRNG_SWITCH
		scripts/config --enable CONFIG_LRNG_KCAPI_HASH
		scripts/config --module CONFIG_LRNG_DRBG
		scripts/config --module CONFIG_LRNG_KCAPI
		scripts/config --enable CONFIG_LRNG_TESTING_MENU
		scripts/config --disable CONFIG_LRNG_RAW_HIRES_ENTROPY
		scripts/config --disable CONFIG_LRNG_RAW_JIFFIES_ENTROPY
		scripts/config --disable CONFIG_LRNG_RAW_IRQ_ENTROPY
		scripts/config --disable CONFIG_LRNG_RAW_IRQFLAGS_ENTROPY
		scripts/config --disable CONFIG_LRNG_RAW_RETIP_ENTROPY
		scripts/config --disable CONFIG_LRNG_RAW_REGS_ENTROPY
		scripts/config --disable CONFIG_LRNG_RAW_ARRAY
		scripts/config --disable CONFIG_LRNG_IRQ_PERF
		scripts/config --disable CONFIG_LRNG_ACVT_HASH
		scripts/config --enable CONFIG_LRNG_RUNTIME_ES_CONFIG
		scripts/config --disable CONFIG_LRNG_RUNTIME_MAX_WO_RESEED_CONFIG
		scripts/config --disable CONFIG_LRNG_TEST_CPU_ES_COMPRESSION
		scripts/config --enable CONFIG_LRNG_SELFTEST
		scripts/config --disable CONFIG_LRNG_SELFTEST_PANIC
  fi


  ### Selecting the ZSTD compression level
  if [ "$_zstd_level" = "ultra" ]; then
    echo "Enabling highest ZSTD compression ratio..."
    scripts/config --set-val CONFIG_KERNEL_ZSTD_LEVEL 19
    scripts/config --enable CONFIG_KERNEL_ZSTD_LEVEL_ULTRA
  elif [ "$_zstd_level" = "normal" ]; then
    echo "Enabling standard ZSTD compression ratio..."
    scripts/config --set-val CONFIG_KERNEL_ZSTD_LEVEL 19
    scripts/config --disable CONFIG_KERNEL_ZSTD_LEVEL_ULTRA
  else
    if [ -n "$_zstd_level" ]; then
      error "The value $_zstd_level is invalid. Choose the correct one again."
    else
      error "The value is empty. Choose the correct one again."
    fi
    error "Selecting the ZSTD compression level failed!"
    exit
  fi

    ### Selecting the ZSTD modules and kernel compression level
	if [ "$_zstd_level_value" = "ultra" ]; then
		echo "Enabling highest ZSTD modules compression ratio..."
		scripts/config --set-val CONFIG_MODULE_COMPRESS_ZSTD_LEVEL 19
		scripts/config --enable CONFIG_MODULE_COMPRESS_ZSTD_ULTRA
		scripts/config --set-val CONFIG_MODULE_COMPRESS_ZSTD_LEVEL_ULTRA 22
		echo "Enabling highest ZSTD kernel compression ratio..."
		scripts/config --set-val CONFIG_ZSTD_COMP_VAL 22
	elif [ "$_zstd_level_value" = "normal" ]; then
		echo "Enabling standard ZSTD modules compression ratio..."
		scripts/config --set-val CONFIG_MODULE_COMPRESS_ZSTD_LEVEL 19
		scripts/config --disable CONFIG_MODULE_COMPRESS_ZSTD_ULTRA
		echo "Enabling standard ZSTD kernel compression ratio..."
		scripts/config --set-val CONFIG_ZSTD_COMP_VAL 19
	else
		if [ -n "$_zstd_level_value" ]; then
			error "The value $_zstd_level_value is invalid. Choose the correct one again."
		else
			error "The value is empty. Choose the correct one again."
		fi
		error "Selecting the ZSTD modules and kernel compression level failed!"
		exit
	fi

    ### Enable zram/zswap ZSTD compression
	if [ -n "$_zstd_swap_compression" ]; then
		echo "Enabling zram ZSTD compression..."
		scripts/config --disable CONFIG_ZRAM_DEF_COMP_LZORLE
		scripts/config --enable CONFIG_ZRAM_DEF_COMP_ZSTD
		scripts/config --set-str CONFIG_ZRAM_DEF_COMP zstd
		echo "Enabling zswap ZSTD compression..."
		scripts/config --disable CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4
		scripts/config --enable CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD
		scripts/config --set-str CONFIG_ZSWAP_COMPRESSOR_DEFAULT zstd
  fi

  echo "Enable Anbox"
  scripts/config --enable CONFIG_ASHMEM
  scripts/config --enable CONFIG_ANDROID
  scripts/config --enable CONFIG_ANDROID_BINDER_IPC
  scripts/config --enable CONFIG_ANDROID_BINDERFS
  scripts/config --enable CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"

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
    if [ -e $HOME/.config/modprobed.db ]; then
      echo "Running Steven Rostedt's make localmodconfig now"
      make ${BUILD_FLAGS[*]} LSMOD=$HOME/.config/modprobed.db localmodconfig
    else
      echo "No modprobed.db data found"
      exit
    fi
  fi



  echo "Applying default config..."

  make ${BUILD_FLAGS[*]}  olddefconfig
  make ${BUILD_FLAGS[*]} -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"

  ### Running make nconfig
  [[ -z "$_makenconfig" ]] || make ${BUILD_FLAGS[*]} nconfig

  ### Save configuration for later reuse
  cp -Tf ./.config "${startdir}/config-${pkgver}-${pkgrel}${pkgbase#linux}"

}

build() {
  cd ${_srcname}
  make ${BUILD_FLAGS[*]} -j$(nproc) all
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=('coreutils' 'kmod' 'initramfs')
  optdepends=('crda: to set the correct wireless channels of your country'
    'linux-firmware: firmware images needed for some devices'
  'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE KSMBD-MODULE)

  cd $_srcname
  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=/doesnt/exist modules_install  # Suppress depmod
  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  depends=(pahole)

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # required when STACK_VALIDATION is enabled
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # required when DEBUG_INFO_BTF_MODULES is enabled
  install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids

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

  echo "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$builddir/vmlinux"

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

sha256sums=('32d0a8e366b87e1cbde951b9f7a01287546670ba60fac35cccfc8a7c005a162c'
            '2326154da7383bd6a3b84e27a2dbc36d7bf8c533cda438fac7e08abefb71e9b0'
            'ba65acd3f1168a7479e3665b5b13f7d1066e713eadb5a0e5110423ba97d7ccd3'
            'df466f91e9560e258da5816f037760e511172e789dee01c267ac7213706919b9'
            'b81d81435984662cc5948e5e26389402d6803ceb4cd3fe346f632fdf4c81f9ed'
            'ec150c2d74c58de56ab230679fe4c27b63a8bb4180f57e1985ff7fe7dced0401'
            '863d3627ef5eb474840a5847ee0b479a80e2521261b8ca3e0f71fcfb78a392b4'
            '8d3594fdbef77a86b85df751de48d64418efd34813dbf1a2f0c2841928275f37'
            '2ccacea819390dfa67251b0c211804bcc03a079a9970fd6e147bb09248e75b6f'
            'fbc98ae990ef1f75ac5a11eb822e01503b5cc09b412f3b3d2e03adde04123068'
            '2dd17bce8a02bba63e1fb437bbfc6efb2c8e657e3d3049c57d975dac8dadadbb'
            'd8be9d58186b09cd6d8ac0633889e9483f88c59702579b26d45d0a42a906de8f'
            'c92373359de38b4ac831ab69f57c6bb962a14d214beba55593616c9077003aff'
            '308ce8da7022fae3a5efcc7d87603ed238b044525b42d7203273aaad702a9cd0'
            'ccdc989e3600ec098060696fc87168b655ebbaaaac00d2b424f56c1697c50abb'
            '27b29c0de9ac4e327f76d060c747196c59536754cb2288c7d121e700d9a976c8'
            'c6e3fe5b1736c343f25632a23318c91ccc8b84e896ce7a0a1f7eb2a05e7a596f'
            '0682d64dd5be9699ccfbd8a2c4f39ab899f6d13e18e5e0f1ca30b282606ac958'
            '0c71a8f1cf99f01d2f6fdafde8b5b96e1f56b686b505aa2e18396855966c11f9'
            'eccb27352c4e87998900a9b8b0e0ec6322c33f542643085a20db45a09c78fdba'
            '91b8eebde0f0704808b16e0c7a64be791d9c93319ecb05cb4cdb35dcce7387f3'
            '65d7b7fe507302e77affbfdd2e92991ae37c413c17d6b96559b5794487421d58'
            'aa87843e5e44e0f5ad20e3acacccc54e9931ae5dce6bb9a357731deb19d182b0'
            '65ec9ac5b8b28d5b61df1c72498059be2e7cb1f9b965bac0e4ffed3c05520b2b')
