# Maintainer: Anton Hvornum <anton.feeds+AUR@gmail.com>
# makepkg --printsrcinfo > .SRCINFO
_owner=Torxed
_name=archiso-offline-releng
pkgname=$_name
pkgver=0.0.1.r1
pkgrel=1
pkgdesc="A simple, offline-installable modification on archiso/releng"
arch=('x86_64')
url="https://github.com/Torxed"
license=('custom:BSD' 'cc-by-nc-sa-3.0')
depends=('archiso' 'pacman' 'wget' 'tar')
provides=('archiso-offline-releng')
source=("https://aur.archlinux.org/cgit/aur.git/snapshot/archiso-offline-releng.tar.gz")
sha256sums=('SKIP')

# Target function is the function we'll be looking for to prepend our offline functions
# (function won't get replaced, just moved down a little bit to make space for our own)
#
# target function chain is where in the build process to inject our own chain right before.
TARGET_FUNCTION="make_iso()"
TARGET_FUNCTION_CHAIN="make_customize_airootfs"
OFFLINE_MIRROR_PATH='${script_path}/${work_dir}/x86_64/airootfs/srv/http/arch_offline'

prepare() {
    mkdir -p "$srcdir/usr/share/archiso/configs/offline_releng"
    cp -r /usr/share/archiso/configs/releng/* "$srcdir/usr/share/archiso/configs/offline_releng/"
}

build() {
    ## Instead of a patch file, which, requires more maintanance between upgrades..
	## We'll use these stringified functions and prepend these before a known function
	## in the standard build.sh script. That way it doesn't matter if functions get patched
	## and line numbers/content changes. As long as the overall work-flow of build.sh
	## stays intact, we'll have a greater success of injecting the offline functions.

	BUILD_FUNCTIONS=$(<offline_functions.sh)

	read -r -d '' CHAIN_INJECT <<-"EOT"
run_once make_aur_packages
run_once make_offline_mirror
run_once patch_in_local_mirror
run_once install_aur
run_once finalize_offline

EOT

	# Patch in the functions right before $TARGET_FUNCTION.
	sed -i "s/${TARGET_FUNCTION}/${BUILD_FUNCTIONS}&/" "$srcdir/usr/share/archiso/configs/offline_releng/build.sh"

	# Patch in the function calls before $TARGET_FUNCTION_CHAIN
	sed -i "s/${TARGET_FUNCTION_CHAIN}/${CHAIN_INJECT}&/" "$srcdir/usr/share/archiso/configs/offline_releng/build.sh"
}

package() {
    cd ${srcdir}

    # Install the offline-modified releng
    install -dm 755 "$pkgdir/usr/share/archiso/configs"
    cp -r "$srcdir/usr/share/archiso/configs/offline_releng" "$pkgdir/usr/share/archiso/configs/"
}

