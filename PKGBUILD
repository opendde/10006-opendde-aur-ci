# Maintainer: eNV25 <env252525@gmail.com>

pkgname=anbox-modules-dkms-git
_pkgname=anbox-modules
pkgver=r38.8148a16
pkgrel=1
pkgdesc="Kernel modules for Anbox or Waydroid (DKMS)"
arch=(x86_64)
url="https://github.com/choff/anbox-modules"
license=('GPL')
depends=('dkms')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$_pkgname::git+$url#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname/"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname/"
	sed -i "s/^PACKAGE_VERSION=\".*\"$/PACKAGE_VERSION=\"$pkgver\"/g" **/dkms.conf
	# this should work with all Arch Linux kernels (including linux-lts)
	# https://github.com/choff/anbox-modules/pull/1#issuecomment-974865917
	sed -i 's/^#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,15,2))$/#if 1/g' binder/binder.c
}

package() {
	cd "$srcdir/$_pkgname/"
	install -Dm644 anbox.conf -t "$pkgdir/usr/lib/modules-load.d/"
	install -Dm644 99-anbox.rules -t "$pkgdir/usr/lib/udev/rules.d/"
	install -dm644 "$pkgdir/usr/src/"
	cp -rT ashmem "$pkgdir/usr/src/anbox-ashmem-$pkgver"
	cp -rT binder "$pkgdir/usr/src/anbox-binder-$pkgver"
}
