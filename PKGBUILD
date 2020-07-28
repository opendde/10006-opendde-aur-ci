# Maintainer: Jean-Marc Lenoir <archlinux "at" jihemel "dot" com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

# To enable macOS guests sup.port, uncomment the line below:
_enable_macOS_guests=y
# CAUTION: Running macOS on VMware Workstation on non Apple computer is forbidden by
# Apple and VMware EULAs.

# vmware-keymaps dependency is needed to avoid some conflicts when you install
# this package with vmware-horizon-client. If you don't plan to install
# vmware-horizon-client and don't want to add this dependency, you can
# uncomment the line below:
#_remove_vmware_keymaps_dependency=y

#PKGEXT=.pkg.tar
_basepkgname=vmware-workstation
pkgname=${_basepkgname}-tech-preview
pkgver=16540321
_pkgver=20h2
_pkgver=${_pkgver}_${pkgver}
pkgrel=1
pkgdesc='The industry standard for running multiple operating systems as virtual machines on a single Linux PC (Tech Preview).'
arch=(x86_64)
url='https://blogs.vmware.com/workstation'
license=(custom)
install="vmware-workstation.install"
conflicts=(
  ${_basepkgname}
  vmware-modules-dkms
  vmware-ovftool
  vmware-patch
  vmware-systemd-services
)
provides=(
  ${_basepkgname}
  vmware-ovftool
)
depends=(
  dkms
  fuse2
  gtkmm3
  libcanberra
  libaio
  pcsclite
  hicolor-icon-theme
  # needed to use Arch GTK3 library (for theme integration)
  gtk3
  gcr
)
optdepends=(
  'linux-headers: build modules against Arch kernel'
)
makedepends=(
  sqlite
)
backup=(
  'etc/vmware/config'
  'etc/conf.d/vmware'
)
#latest_url=https://bit.ly/get-workstation-tp-linux
_bundle_name="VMware-Workstation-Full-e.x.p-${pkgver}.${CARCH}.bundle"
source=(
  "https://download3.vmware.com/software/wkst/file/${_bundle_name}"
  'vmware-bootstrap'
  'vmware-vix-bootstrap'
  'config'
  'configure-initscript.sh'
  'vmware-environment.sh'
  'config.xml'
  'datastores.xml'
  'environments.xml'
  'proxy.xml'
  'vmAutoStart.xml'
  'vmware-authd.service'
  'vmware-networks-configuration.service'
  'vmware-networks.service'
  'vmware-usbarbitrator.service'
  'dkms.conf.in'
  'Makefile'
  'vmmon.patch'
  'vmnet.patch'
)
sha256sums=('ebf938cad942e1fe1b119eb84c52461cfb789c2809951addc8344218e4519349'
            '12e7b16abf8d7e858532edabb8868919c678063c566a6535855b194aac72d55e'
            'da1698bf4e73ae466c1c7fc93891eba4b9c4581856649635e6532275dbfea141'
            'ce3b1a82d9ed023b7591168bd49b218040ef70d1752a07792b0af6ac15a68453'
            '8e4d08668a66be79a900521792b39c16a026cc90659241edee80b64e701bfbcd'
            'b94959a11b28e51b541321be0588190eb10825e9ff55cbd16eb01483a839a69f'
            'ce1fd2916c7dde0ed0fa3158c0e3055bbc84f6c397464e3a10776aeb35d9828f'
            '434cd4aa440d36b75ee20e0b588aaad874bb0d796173990bc4046667c66f5099'
            'cceaec1837fce1e03fa76cf0bf39eb01b19f4ffa45eb986d62221282682deb82'
            '3c802523606184a5e8ebbe931d9c6c70d83ff8c6833b9f48aa264f0bd5a18a88'
            'ad522a8cbc6103134ce5e677a01b503cd21875cbceb37bd13fd870ebd9ad0e6d'
            'e4c2e97acf07c52de570dd4333d67acfb593db719937a563c6075ab773dcce33'
            '9b4fbe0ba83f761a2eb9ecd05d48428f8b0a5b3abd8404ccbd928408e682f02b'
            'c0a5aea785db06921fb350d36d5e0fd9a14f5eee0c835686ec6fea1af8c92245'
            'd7a9fbf39a0345ae2f14f7f389f30b1110f605d187e0c241e99bbb18993c250d'
            '05e26d8b21d190ebabb7f693998114d9d5991d9dfb71acb4d990293a65b6b487'
            '6ce902b1dab8fc69be253abd8e79017011985eca850ff7acc7282f9ab668e35d'
            'f23aa17b29cc95b9e78f27d862a95f5f3da6608096646d175f305f9ac1b8f54a'
            'c1302d45008865537583b99d53ed0ea4a1d672227f190177fc63fc0c2f980151')
options=(!strip emptydirs)

if [ -z "$_remove_vmware_keymaps_dependency" ]; then
depends+=(
  vmware-keymaps
)
fi


_isoimages=(linux linuxPreGlibc25 netware solaris windows winPre2k winPreVista)
_isovirtualprinterimages=(Linux Windows)

if [ -n "$_enable_macOS_guests" ]; then

_vmware_fusion_ver=11.5.5_16269456
# List of VMware Fusion versions: https://softwareupdate.vmware.com/cds/vmw-desktop/fusion/

_unlocker_ver=3.0.3
_efi_unlocker_ver=1.0.0

makedepends+=(
  python
  unzip
  uefitool-git
)

source+=(
  "VMware-Fusion-${_vmware_fusion_ver/_/-}.zip.tar::https://softwareupdate.vmware.com/cds/vmw-desktop/fusion/${_vmware_fusion_ver/_//}/core/com.vmware.fusion.zip.tar"
  "unlocker-${_unlocker_ver}.py::https://raw.githubusercontent.com/paolo-projects/unlocker/${_unlocker_ver}/unlocker.py"
  "efi-unlocker-patch-${_efi_unlocker_ver}.txt"
)
sha256sums+=(
  'fedd67ec2a50ffcc71376dbeeea1f5c0577dfcfcd2bcc7bf91239f3c18d7dcf9'
  '1c27547dcf6fb2f436c96ee62ae8c7f5cfd14b40d8bbd35dc385e247c4fb7e0f'
  '392c1effcdec516000e9f8ffc97f2586524d8953d3e7d6f2c5f93f2acd809d91'
)

_fusion_isoimages=(darwin darwinPre15)
fi


_create_database_file() {
  # Create a database which contains the list of guest tools (necessary to avoid that vmware try to download them)
  local database_filename="$pkgdir/etc/vmware-installer/database"
  echo -n "" > "$database_filename"

  sqlite3 "$database_filename" "CREATE TABLE settings(key VARCHAR PRIMARY KEY, value VARCHAR NOT NULL, component_name VARCHAR NOT NULL);"
  sqlite3 "$database_filename" "INSERT INTO settings(key,value,component_name) VALUES('db.schemaVersion','2','vmware-installer');"
  sqlite3 "$database_filename" "CREATE TABLE components(id INTEGER PRIMARY KEY, name VARCHAR NOT NULL, version VARCHAR NOT NULL, buildNumber INTEGER NOT NULL, component_core_id INTEGER NOT NULL, longName VARCHAR NOT NULL, description VARCHAR, type INTEGER NOT NULL);"

  for isoimage in ${_isoimages[@]}
  do
	local version=$(cat "$srcdir/extracted/vmware-tools-$isoimage/manifest.xml" | grep -oPm1 "(?<=<version>)[^<]+")
	sqlite3 "$database_filename" "INSERT INTO components(name,version,buildNumber,component_core_id,longName,description,type) VALUES(\"vmware-tools-$isoimage\",\"$version\",\"${pkgver#*_}\",1,\"$isoimage\",\"$isoimage\",1);"
  done

if [ -n "$_enable_macOS_guests" ]; then
  for isoimage in ${_fusion_isoimages[@]}
  do
	sqlite3 "$database_filename" "INSERT INTO components(name,version,buildNumber,component_core_id,longName,description,type) VALUES(\"vmware-tools-$isoimage\",\"1\",\"${_vmware_fusion_ver#*_}\",1,\"$isoimage\",\"$isoimage\",1);"
  done
fi
}

prepare() {
  extracted_dir="$srcdir/extracted"
  [[ -d "$extracted_dir" ]] && rm -r "$extracted_dir"

  bash \
    "$(readlink -f $srcdir/${_bundle_name})" \
    --extract "$extracted_dir"

if [ -n "$_enable_macOS_guests" ]; then
  unzip -q com.vmware.fusion.zip
  for isoimage in ${_fusion_isoimages[@]}
  do
    install -Dm 644 "$srcdir/payload/VMware Fusion.app/Contents/Library/isoimages/$isoimage.iso" "$srcdir/fusion-isoimages/$isoimage.iso"
  done
  rm -rf __MACOSX payload manifest.plist preflight postflight

  sed -i -e "s|/usr/lib/vmware/|${pkgdir}/usr/lib/vmware/|" "$srcdir/unlocker-${_unlocker_ver}.py"
fi
}

package() {
  local vmware_installer_version=$(cat "$srcdir/extracted/vmware-installer/manifest.xml" | grep -oPm1 "(?<=<version>)[^<]+")

  # Make directories and copy files.

  mkdir -p \
    "$pkgdir/etc"/{cups,modprobe.d,profile.d,thnuclnt,vmware} \
    "$pkgdir/usr"/{share,bin} \
    "$pkgdir/usr/include/vmware-vix" \
    "$pkgdir/usr/lib"/{vmware/{setup,lib/libvmware-vim-cmd.so},vmware-vix,vmware-ovftool,vmware-installer/"$vmware_installer_version",cups/filter,modules-load.d} \
    "$pkgdir/usr/share"/{doc/vmware-vix,licenses/"$pkgname"} \
    "$pkgdir/var/lib/vmware/Shared VMs"

  cd "$srcdir/extracted"

  cp -r \
    vmware-workstation/share/* \
    vmware-workstation/man \
    vmware-network-editor-ui/share/* \
    vmware-player-app/share/* \
    "$pkgdir/usr/share"

  cp -r \
    vmware-workstation/bin/* \
    vmware-vmx/{,s}bin/* \
    vmware-vix-core/bin/* \
    vmware-vprobe/bin/* \
    vmware-player-app/bin/* \
    "$pkgdir/usr/bin"

  cp -r \
    vmware-workstation/lib/* \
    vmware-player-app/lib/* \
    vmware-vmx/{lib/*,roms} \
    vmware-vprobe/lib/* \
    vmware-usbarbitrator/bin \
    vmware-network-editor/lib \
    "$pkgdir/usr/lib/vmware"

  cp -r \
    vmware-player-setup/vmware-config \
    "$pkgdir/usr/lib/vmware/setup"

  cp -r \
    vmware-vix-lib-Workstation1500/lib/Workstation-15.0.0 \
    vmware-vix-core/{lib/*,vixwrapper-config.txt} \
    "$pkgdir/usr/lib/vmware-vix"

  cp -r \
    vmware-vix-core/doc/* \
    "$pkgdir/usr/share/doc/vmware-vix"

  cp -r \
    vmware-ovftool/* \
    "$pkgdir/usr/lib/vmware-ovftool"

  cp -r \
    vmware-installer/{python,sopython,vmis,vmis-launcher,vmware-installer,vmware-installer.py} \
    "$pkgdir/usr/lib/vmware-installer/$vmware_installer_version"

  cp -r \
    vmware-player-app/etc/cups/* \
    "$pkgdir/etc/cups"
  cp -r \
    vmware-player-app/extras/.thnumod \
    "$pkgdir/etc/thnuclnt"
  cp -r \
    vmware-player-app/extras/thnucups \
    "$pkgdir/usr/lib/cups/filter"

  cp -r \
    vmware-vix-core/include/* \
    "$pkgdir/usr/include/vmware-vix"

  for isoimage in ${_isoimages[@]}
  do
    install -Dm 644 "vmware-tools-$isoimage/$isoimage.iso" "$pkgdir/usr/lib/vmware/isoimages/$isoimage.iso"
  done

  for isoimage in ${_isovirtualprinterimages[@]}
  do
    install -Dm 644 "vmware-virtual-printer/VirtualPrinter-$isoimage.iso" "$pkgdir/usr/lib/vmware/isoimages/VirtualPrinter-$isoimage.iso"
  done

  install -Dm 644 "vmware-workstation/doc/EULA" "$pkgdir/usr/share/doc/vmware-workstation/EULA"
  ln -s "/usr/share/doc/vmware-workstation/EULA" "$pkgdir/usr/share/licenses/$pkgname/VMware Workstation - EULA.txt"
  ln -s "/usr/lib/vmware-ovftool/vmware.eula" "$pkgdir/usr/share/licenses/$pkgname/VMware OVF Tool - EULA.txt"
  install -Dm 644 "vmware-workstation/doc"/open_source_licenses.txt "$pkgdir/usr/share/licenses/$pkgname/VMware Workstation open source license.txt"
  install -Dm 644 "vmware-workstation/doc"/ovftool_open_source_licenses.txt "$pkgdir/usr/share/licenses/$pkgname/VMware OVF Tool open source license.txt"
  install -Dm 644 "vmware-vix-core"/open_source_licenses.txt "$pkgdir/usr/share/licenses/$pkgname/VMware VIX open source license.txt"
  rm "$pkgdir/usr/lib/vmware-ovftool"/{vmware-eula.rtf,open_source_licenses.txt,manifest.xml}

  install -d -m 755 "$pkgdir/usr/lib/vmware-installer/$vmware_installer_version"/{lib/lib,artwork}
  install -Dm 755 "$srcdir/configure-initscript.sh" "$pkgdir/usr/lib/vmware-installer/$vmware_installer_version/bin/configure-initscript.sh"

  install -Dm 644 "vmware-vmx/etc/modprobe.d/modprobe-vmware-fuse.conf" "$pkgdir/etc/modprobe.d/vmware-fuse.conf"

  install -Dm 644 vmware-vmx/extra/modules.xml "$pkgdir"/usr/lib/vmware/modules/modules.xml
  install -Dm 644 vmware-installer/bootstrap "$pkgdir"/etc/vmware-installer/bootstrap
  install -Dm 644 "$srcdir"/vmware-vix-bootstrap "$pkgdir"/etc/vmware-vix/bootstrap
  install -Dm 644 "$srcdir"/vmware-bootstrap "$pkgdir"/etc/vmware/bootstrap
  install -Dm 644 "$srcdir"/config "$pkgdir"/etc/vmware/config

if [ -z "$_remove_vmware_keymaps_dependency" ]; then
  rm -r "$pkgdir/usr/lib/vmware/xkeymap" # these files are provided by vmware-keymaps package
fi

  echo -e "vmw_vmci\nvmmon" > "$pkgdir/usr/lib/modules-load.d/vmware.conf"

  for service_file in \
    vmware-authd.service \
    vmware-networks-configuration.service \
    vmware-networks.service \
    vmware-usbarbitrator.service
  do
    install -Dm 644 \
      "$srcdir/$service_file" \
      "$pkgdir/usr/lib/systemd/system/$service_file"
  done


  # Apply permissions where necessary.

  chmod +x \
    "$pkgdir/usr/bin"/* \
    "$pkgdir/usr/lib/vmware/bin"/* \
    "$pkgdir/usr/lib/vmware/setup"/* \
    "$pkgdir/usr/lib/vmware/lib"/libvmware-gksu.so/gksu-run-helper \
    "$pkgdir/usr/lib/vmware-ovftool"/{ovftool,ovftool.bin} \
    "$pkgdir/usr/lib/vmware-installer/$vmware_installer_version"/{vmware-installer,vmis-launcher} \
    "$pkgdir/usr/lib/cups/filter"/* \
    "$pkgdir/usr/lib/vmware-vix/setup"/* \
    "$pkgdir/etc/thnuclnt/.thnumod"

  chmod +s \
    "$pkgdir/usr/bin"/vmware-authd \
    "$pkgdir/usr/lib/vmware/bin"/{vmware-vmx,vmware-vmx-debug,vmware-vmx-stats}


  # Add symlinks the installer would create.

  for link in \
    licenseTool \
    vmplayer \
    vmware \
    vmware-app-control \
    vmware-enter-serial \
    vmware-fuseUI \
    vmware-gksu \
    vmware-modconfig \
    vmware-modconfig-console \
    vmware-mount \
    vmware-netcfg \
    vmware-setup-helper \
    vmware-tray \
    vmware-vim-cmd \
    vmware-vmblock-fuse \
    vmware-vprobe \
    vmware-wssc-adminTool \
    vmware-zenity
  do
    ln -s /usr/lib/vmware/bin/appLoader "$pkgdir/usr/lib/vmware/bin/$link"
  done

  for link in \
    vmrest
  do
    ln -s /usr/lib/vmware/bin/appLoader "$pkgdir/usr/bin/$link"
  done

  for link in \
    vmware-fuseUI \
    vmware-mount \
    vmware-netcfg \
    vmware-usbarbitrator
  do
    ln -s /usr/lib/vmware/bin/$link "$pkgdir/usr/bin/$link"
  done

  ln -s /usr/lib/vmware/icu "$pkgdir/etc/vmware/icu"
  ln -s /usr/lib/vmware-ovftool/ovftool "$pkgdir/usr/bin/ovftool"
  ln -s /usr/lib/vmware-vix/libvixAllProducts.so "$pkgdir/usr/lib/libvixAllProducts.so"

  # Replace placeholder "variables" with real paths.

  for file in \
    gtk-3.0/gdk-pixbuf.loaders
  do
    sed -i 's,@@LIBCONF_DIR@@,/usr/lib/vmware/libconf,g' "$pkgdir/usr/lib/vmware/libconf/etc/$file"
  done

  sed -i 's,@@BINARY@@,/usr/bin/vmware,' "$pkgdir/usr/share/applications/vmware-workstation.desktop"
  sed -i 's,@@BINARY@@,/usr/bin/vmplayer,' "$pkgdir/usr/share/applications/vmware-player.desktop"
  sed -i 's,@@BINARY@@,/usr/bin/vmware-netcfg,' "$pkgdir/usr/share/applications/vmware-netcfg.desktop"

  sed \
    -e "s/@@VERSION@@/$vmware_installer_version/" \
    -e "s,@@VMWARE_INSTALLER@@,/usr/lib/vmware-installer/$vmware_installer_version," \
    -i "$pkgdir/etc/vmware-installer/bootstrap"


  # Patch up the VMware kernel sources and configure DKMS.

  dkms_dir="$pkgdir/usr/src/$pkgname-$pkgver"

  install -Dm 644 "$srcdir/Makefile" "$dkms_dir/Makefile"
  install -Dm 644 "$srcdir/dkms.conf.in" "$dkms_dir/dkms.conf"

  sed \
    -e "s/@PKGNAME@/$pkgname/g" \
    -e "s/@PKGVER@/$pkgver/g" \
    -i "$dkms_dir/dkms.conf"

  for module in vmmon vmnet; do # vmblock vmci vsock
    tar -xf "vmware-vmx/lib/modules/source/$module.tar" -C "$dkms_dir"
    msg "Patching $module module for DKMS"
    patch -p2 --read-only=ignore --directory="$dkms_dir/$module-only" < "$srcdir/$module.patch"
  done

  rm -r "$pkgdir/usr/lib/vmware/modules/source"

if [ -n "$_enable_macOS_guests" ]; then
  msg "Patching VMware to enable macOS guest support"
  python "$srcdir/unlocker-${_unlocker_ver}.py" > /dev/null

  for isoimage in ${_fusion_isoimages[@]}
  do
    install -Dm 644 "$srcdir/fusion-isoimages/$isoimage.iso" "$pkgdir/usr/lib/vmware/isoimages/$isoimage.iso"
  done

  msg "Patching EFI firmwares to disable macOS server checking"
  _efi_arch=(32 64)
  for arch in ${_efi_arch[@]}
  do
    uefipatch "$pkgdir/usr/lib/vmware/roms/EFI${arch}.ROM" "$srcdir/efi-unlocker-patch-${_efi_unlocker_ver}.txt" -o "$pkgdir/usr/lib/vmware/roms/EFI${arch}.ROM" > /dev/null
  done
fi

  _create_database_file

  # Define some environment variables for VMware and remove the tests about kernel modules
  install -Dm 644 "$srcdir/vmware-environment.sh" "$pkgdir/etc/conf.d/vmware"
  for program in vmware vmplayer vmware-tray; do
    sed -e '/export PRODUCT_NAME/asource /etc/conf.d/vmware' \
        -e 's/if "$BINDIR"\/vmware-modconfig --appname=.*/if true ||/' \
        -i "$pkgdir/usr/bin/$program"
  done

  # Add StartupWMClass attribute to desktop files
  sed -i '/^StartupNotify=.*/a StartupWMClass=vmware' "$pkgdir/usr/share/applications/vmware-workstation.desktop"
  sed -i '/^StartupNotify=.*/a StartupWMClass=vmplayer' "$pkgdir/usr/share/applications/vmware-player.desktop"
  sed -i '/^StartupNotify=.*/a StartupWMClass=vmware-netcfg' "$pkgdir/usr/share/applications/vmware-netcfg.desktop"
}
