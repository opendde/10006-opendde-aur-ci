# This file is part of https://aur.archlinux.org/packages/mkinitcpio-systemd-tool/

pkgdesc='Provisioning tool for systemd in initramfs (systemd-tool)'
pkgname=mkinitcpio-systemd-tool
pkgver=2
pkgrel=1
depends=(
    'mkinitcpio' 
    'systemd'
)
optdepends=(
    'cryptsetup: required by initrd-cryptsetup.service' 
    'dropbear: required by initrd-dropbear.service' 
    'mc: required by initrd-debug-progs.service' 
)
makedepends=(
    'git'
)
backup=(
    'etc/mkinitcpio.d/crypttab'
    'etc/systemd/network/initrd-network.network'
    'etc/systemd/system/initrd-build.sh'
    'etc/systemd/system/initrd-cryptsetup.service'
    'etc/systemd/system/initrd-debug-progs.service'
    'etc/systemd/system/initrd-debug-shell.service'
    'etc/systemd/system/initrd-dropbear.service'
    'etc/systemd/system/initrd-emergency.service'
    'etc/systemd/system/initrd-network.service'
    'etc/systemd/system/initrd-shell.service'
    'etc/systemd/system/initrd-shell.sh'
)
conflicts=(
    'mkinitcpio-dropbear'
    'mkinitcpio-tinyssh'
)
arch=('any')
md5sums=('SKIP')
license=('Apache')

url="https://github.com/random-archer/${pkgname}"

# select version type depending on marker file presense
# absense of any marker files selects the curernt PKGBUILD value of pkgver
_marker_develop='.PKGDEV' # create this file to use latest development version (master branch)
_marker_release='.PKGREL' # create this file to use latest release version (named tag vNNN)

_fragment=$([[ -f ${_marker_develop} ]] && printf "" || printf "#tag=v$pkgver")
source=("git+${url}.git${_fragment}")

pkgver() {
    local base=$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd)
    local repo="$base/$pkgname" # bare repo location
    local head_count=$(git -C $repo rev-list --count HEAD)
    local short_hash=$(git -C $repo rev-parse --short HEAD)
    local release_info=$(git -C $repo describe --long --tags --match "v[0-9]*")
    local release_number=$(echo "$release_info" | sed -r 's/^v([0-9]+)-.*/\1/')
    local release_version="${release_number}" # example: 3
    local develop_version="${release_number}.${head_count}.${short_hash}" # example: 3.25.d069dad
    if [[ -f "$base/${_marker_develop}" ]] ; then printf "$develop_version" ;
    elif [[ -f "$base/${_marker_release}" ]] ; then printf "$release_version" ;
    else printf "$pkgver" ; fi
}

####

prepare() {
    true
}

build() {
    true
}

check() {
    true
}

package() {
    
    local hook="systemd-tool"
    
    local source="$srcdir/$pkgname"
    
    local target="$pkgdir/usr/share/$pkgname"
    install -D -m644 "$source/LICENSE.md"               "${target}/LICENSE.md"
    install -D -m644 "$source/README.md"                "${target}/README.md"

    local target="$pkgdir/usr/lib/initcpio"
    install -D -m644 "$source/mkinitcpio-hook.sh"       "$target/hooks/$hook"
    install -D -m644 "$source/mkinitcpio-install.sh"    "$target/install/$hook"
  
    local target="$pkgdir/etc/mkinitcpio.d/"
    install -D -m644 "$source/crypttab"                 "$target/crypttab"
        
    local target="$pkgdir/etc/systemd/network"
    install -D -m644 "$source/initrd-network.network"    "$target/initrd-network.network"

    local target="$pkgdir/etc/systemd/system"
    install -D -m644 "$source/initrd-build.sh"              "$target/initrd-build.sh"
    install -D -m644 "$source/initrd-cryptsetup.service"    "$target/initrd-cryptsetup.service"
    install -D -m644 "$source/initrd-debug-progs.service"   "$target/initrd-debug-progs.service"
    install -D -m644 "$source/initrd-debug-shell.service"   "$target/initrd-debug-shell.service"
    install -D -m644 "$source/initrd-network.service"       "$target/initrd-network.service"
    install -D -m644 "$source/initrd-dropbear.service"      "$target/initrd-dropbear.service"
    install -D -m644 "$source/initrd-emergency.service"     "$target/initrd-emergency.service"
    install -D -m644 "$source/initrd-shell.service"         "$target/initrd-shell.service"
    install -D -m644 "$source/initrd-shell.sh"              "$target/initrd-shell.sh"
                                                                                                                                
}
