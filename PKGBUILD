# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

### Tweak kernel options prior to a build via nconfig
_makenconfig=

### Tweak kernel options prior to a build via menuconfig
_makemenuconfig=

### Tweak kernel options prior to a build via xconfig
_makexconfig=

### Tweak kernel options prior to a build via gconfig
_makegconfig=

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

### Running with a 1000 HZ tick rate
_1k_HZ_ticks=

### Do not edit below this line unless you know what you're doing

pkgbase=linux-aufs
# pkgname=('linux-aufs' 'linux-aufs-headers' 'linux-aufs-docs')
_major=5.4
_minor=13
pkgver=${_major}.${_minor}
_srcname=linux-${pkgver}
pkgrel=1
pkgdesc='Linux AUFS'
arch=('x86_64')
url="https://github.com/sfjro/aufs5-standalone"
license=('GPL2')
options=('!strip')
makedepends=('kmod' 'bc' 'libelf' 'python-sphinx' 'python-sphinx_rtd_theme'
             'graphviz' 'imagemagick')
#_lucjanpath="https://raw.githubusercontent.com/sirlucjan/kernel-patches/master/${_major}"
_lucjanpath="https://gitlab.com/sirlucjan/kernel-patches/raw/master/${_major}"
_aufs_path="aufs-patches"
_aufs_ver="20200113"
_aufs_patch="0001-aufs-${_aufs_ver}.patch"
_gcc_path="https://raw.githubusercontent.com/graysky2/kernel_gcc_patch/master"
_gcc_patch="enable_additional_cpu_optimizations_for_gcc_v9.1+_kernel_v4.13+.patch"

source=("https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.sign"
        "${_lucjanpath}/${_aufs_path}/${_aufs_patch}"
        "${_gcc_path}/${_gcc_patch}"
        "${_lucjanpath}/arch-patches-v20-sep/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch"
        "${_lucjanpath}/arch-patches-v20-sep/0002-lib-devres-add-a-helper-function-for-ioremap_uc.patch"
        "${_lucjanpath}/arch-patches-v20-sep/0003-mfd-intel-lpss-Use-devm_ioremap_uc-for-MMIO.patch"
        "${_lucjanpath}/arch-patches-v20-sep/0004-PCI-pciehp-Prevent-deadlock-on-disconnect.patch"
        "${_lucjanpath}/arch-patches-v20-sep/0005-ACPI-PM-s2idle-Rework-ACPI-events-synchronization.patch"
        "${_lucjanpath}/arch-patches-v20-sep/0006-iwlwifi-pcie-restore-support-for-Killer-Qu-C0-NICs.patch"
        "${_lucjanpath}/arch-patches-v20-sep/0007-drm-i915-save-AUD_FREQ_CNTRL-state-at-audio-domain-s.patch"
        "${_lucjanpath}/arch-patches-v20-sep/0008-drm-i915-Fix-audio-power-up-sequence-for-gen10-displ.patch"
        "${_lucjanpath}/arch-patches-v20-sep/0009-drm-i915-extend-audio-CDCLK-2-BCLK-constraint-to-mor.patch"
        "${_lucjanpath}/arch-patches-v20-sep/0010-drm-i915-Limit-audio-CDCLK-2-BCLK-constraint-back-to.patch"
        "${_lucjanpath}/arch-patches-v20-sep/0011-pinctrl-sunrisepoint-Add-missing-Interrupt-Status-re.patch"
        "${_lucjanpath}/arch-patches-v20-sep/0012-Revert-iwlwifi-mvm-fix-scan-config-command-size.patch"
        "${_lucjanpath}/arch-patches-v20-sep/0013-e1000e-Revert-e1000e-Make-watchdog-use-delayed-work.patch"
         # the main kernel config files
        'config')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
    cd $_srcname

    ### Setting version
        msg2 "Setting version..."
        sed -e "/^EXTRAVERSION =/s/=.*/=/" -i Makefile
        scripts/setlocalversion --save-scmversion
        echo "-$pkgrel" > localversion.10-pkgrel
        echo "${pkgbase#linux}" > localversion.20-pkgname

    ### Patching sources
        local src
        for src in "${source[@]}"; do
            src="${src%%::*}"
            src="${src##*/}"
            [[ $src = *.patch ]] || continue
        msg2 "Applying patch $src..."
        patch -Np1 < "../$src"
        done

    ### Setting config
        msg2 "Setting config..."
        cp ../config .config
        make olddefconfig

    ### Prepared version
        make -s kernelrelease > version
        msg2 "Prepared %s version %s" "$pkgbase" "$(<version)"

    ### Optionally use running kernel's config
	# code originally by nous; http://aur.archlinux.org/packages.php?ID=40191
	if [ -n "$_use_current" ]; then
		if [[ -s /proc/config.gz ]]; then
			msg2 "Extracting config from /proc/config.gz..."
			# modprobe configs
			zcat /proc/config.gz > ./.config
		else
			warning "Your kernel was not compiled with IKCONFIG_PROC!"
			warning "You cannot read the current config!"
			warning "Aborting!"
			exit
		fi
	fi

    ### Optionally set tickrate to 1000
	if [ -n "$_1k_HZ_ticks" ]; then
		msg2 "Setting tick rate to 1k..."
		sed -i -e 's/^CONFIG_HZ_300=y/# CONFIG_HZ_300 is not set/' \
                    -i -e 's/^# CONFIG_HZ_1000 is not set/CONFIG_HZ_1000=y/' \
                    -i -e 's/^CONFIG_HZ=300/CONFIG_HZ=1000/' ./.config
	fi
	
    ### Optionally disable NUMA for 64-bit kernels only
        # (x86 kernels do not support NUMA)
        if [ -n "$_NUMAdisable" ]; then
            msg2 "Disabling NUMA from kernel config..."
            sed -i -e 's/CONFIG_NUMA=y/# CONFIG_NUMA is not set/' \
                -i -e '/CONFIG_AMD_NUMA=y/d' \
                -i -e '/CONFIG_X86_64_ACPI_NUMA=y/d' \
                -i -e '/CONFIG_NODES_SPAN_OTHER_NODES=y/d' \
                -i -e '/# CONFIG_NUMA_EMU is not set/d' \
                -i -e '/CONFIG_NODES_SHIFT=6/d' \
                -i -e '/CONFIG_NEED_MULTIPLE_NODES=y/d' \
                -i -e '/# CONFIG_MOVABLE_NODE is not set/d' \
                -i -e '/CONFIG_USE_PERCPU_NUMA_NODE_ID=y/d' \
                -i -e '/CONFIG_ACPI_NUMA=y/d' ./.config
        fi

    ### Optionally load needed modules for the make localmodconfig
        # See https://aur.archlinux.org/packages/modprobed-db
        if [ -n "$_localmodcfg" ]; then
            if [ -f $HOME/.config/modprobed.db ]; then
            msg2 "Running Steven Rostedt's make localmodconfig now"
            make LSMOD=$HOME/.config/modprobed.db localmodconfig
        else
            msg2 "No modprobed.db data found"
            exit
            fi
        fi

    ### Running make nconfig
	
	[[ -z "$_makenconfig" ]] ||  make nconfig
	
    ### Running make menuconfig
	
	[[ -z "$_makemenuconfig" ]] || make menuconfig
	
    ### Running make xconfig
	
	[[ -z "$_makexconfig" ]] || make xconfig
	
    ### Running make gconfig
	
	[[ -z "$_makegconfig" ]] || make gconfig

    ### Save configuration for later reuse
	cat .config > "${startdir}/config.last"
}

build() {
  cd $_srcname

  make bzImage modules htmldocs
}

_package() {
    pkgdesc="The $pkgdesc kernel and modules"
    depends=('coreutils' 'kmod' 'initramfs')
    optdepends=('crda: to set the correct wireless channels of your country'
                'linux-firmware: firmware images needed for some devices'
                'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')

  cd $_srcname
  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  msg2 "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  msg2 "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-headers() {
   pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
   depends=('linux-aufs')

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  msg2 "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

  msg2 "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/x86" -a arch/x86/include
  install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # http://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # http://bugs.archlinux.org/task/20402
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  msg2 "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  msg2 "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  msg2 "Removing documentation..."
  rm -r "$builddir/Documentation"

  msg2 "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  msg2 "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  msg2 "Stripping build tools..."
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

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-docs() {
    pkgdesc="Documentation for the $pkgdesc kernel"
    depends=('linux-aufs')

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  msg2 "Installing documentation..."
  local src dst
  while read -rd '' src; do
    dst="${src#Documentation/}"
    dst="$builddir/Documentation/${dst#output/}"
    install -Dm644 "$src" "$dst"
  done < <(find Documentation -name '.*' -prune -o ! -type d -print0)

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/share/doc"
  ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-docs")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

sha512sums=('e7aaa541ccf66ca8373fe53794786c8b819da824b17acc497d5080f4fff5bef90bab1da531fa8f62a013f40472f5c1dfafb4bd4f42ecc1bf851042d22e72c4a7'
            'SKIP'
            '03dacede01c8e5059a72921ec1568b9b6cc38a1656bfb1bfa450d6df3b3190f2dc6484e2f166d902756741372fa546b76c7bdc9ea6a27e7d393d6bd36e657642'
            '2eb574fbfac6e334d3b06e52e466dbf8e88034515729b6571990b10f75a0fe2a52f188615405c5a695b5820669e595deead44d7961a97c5872359be3435fdf63'
            '39959e8cb2972dee610b2a54301735d49b7c8806ffb3f76ecf2487537171066e27dd19343b81581602e77d25809a1fdca10a4b48ffc5c95c8ce0251b62ebe531'
            '6c032fa60452b0a2c6faced28fe85cba5dcde64bba67e32f5edd94cdefcb032815503621faa6c524b0dfa4ee2b221b0961b04a16bb7f49d1f95377ed1daecd44'
            'cf0a578e738ecb226ba43f477863d25a115266ab809dcb92ea93dd498179b64f9b8f164501295f6ca662447fa5bdbb0e61a0fb52581aefa3ef12e5babb79d1f4'
            'fcd8299a57ac7747de8d95ce8629589f84f7256e2085d5f24868e13456d11eca25d3abdb9e989af47f65c3f991cd333527a254241c004a5da1201b672a16cacd'
            '07b7a6ed3ec7feb71e95e0c02fba8a2b1a44ec9e57b3aebe8c355e042f925377a8a2c5f914b1f54ab073c1050cd23cccf5b071bd26ab80de482b54d42355f6e3'
            '3906055c47b2db6bc2075217496e5d9737379e3a28947e24657a1f17c8163612182dffb6a834934d62b7e355bfe6f6bd534c66e0b194200ab80653eff9d3a5d0'
            '513b2f0d5d8f61bfefaf3cdb5618807c10e337375e2cfdf0f7e16760a5c630bf311d8862323841ffaf381c498771ea9b5f832a52c69c6cbd4eee7f481f949345'
            'f716858686950a30905b88b52d388b7978816c598ac65945eac2459dc03845dfed2f655346b3d3736971094846b48cb1e4cd7e9f021d7af1a5d6941c646bf898'
            'e0efc894b3b6f7eaa9117a3014d7af04cb8679b46541788683b20dc27adbc5a728fc96e868687753bb0b89283ac254b4614f6940bfb97d98649568a540b6f7f5'
            '3f95ab1dae04eb12a1e467e7ca127c1b95d5758cb2df1b5028d4ae6542d649c91cdaf7921bad95aca7978f5b4c7c692de64007023e43eab4a33eadcfe5806af2'
            'ced7e3786e77fb5f76603450579dd99f873a98cd37d38bee8e5fdff0305cc377696a7d4c946a2143452c3facf3d2f91f8b173ac7efaecfe2229d1ee67dc8cefc'
            '08dd9192eecc405b13f78be4431ff3f93e68effd819745fdbbf879be9e3db1340b0585a1d3ab47b5d5ae7a337520acc4f1c4ddf75c5693cd02ab0bcba6e4a4c1'
            'ccd1a2418c57ba2fa531f0fe8f79cf40daf875631a6c16b30c9b0c49fa167db76204d8196b19116cba50981af1b19678d21553ad6e1f2c0ddda2b87d034eb60c'
            '3f1df7004daa23a531981173cbea708744a87f542db188a23ffe1a931715c300ea76ac365a31660993e7295e195c7819f965d962ce2526b48e72bcc2e582edda')

validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
             )
