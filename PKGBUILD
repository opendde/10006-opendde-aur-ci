# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=nvidia-173xx-utils
pkgver=173.14.39
pkgrel=5
pkgdesc="NVIDIA drivers utilities and libraries, 173xx branch."
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && _arch=x86
[ "$CARCH" = "x86_64" ] && _arch=x86_64
_pkg="NVIDIA-Linux-$_arch-$pkgver-pkg0"
url="http://www.nvidia.com/"
depends=('xorg-server<1.15.99' 'mesa')
optdepends=('gtk2: nvidia-settings'
            'pkgconfig: nvidia-xconfig')
conflicts=('nvidia-utils')
provides=("nvidia-utils=$pkgver")
license=('custom')
options=(!strip)
source_i686=("http://download.nvidia.com/XFree86/Linux-x86/$pkgver/NVIDIA-Linux-x86-$pkgver-pkg0.run")
source_x86_64=("http://download.nvidia.com/XFree86/Linux-x86_64/$pkgver/NVIDIA-Linux-x86_64-$pkgver-pkg0.run")
md5sums_i686=('5b423543428554ef33a200fbbe3cb9fc')
md5sums_x86_64=('0799f194869e40141c7bac8a71762db6')

prepare() {
	sh $_pkg.run --extract-only
}

package() {
	cd $_pkg

	# X driver
	install -D -m755 usr/X11R6/lib/modules/drivers/nvidia_drv.so "$pkgdir/usr/lib/xorg/modules/drivers/nvidia_drv.so"

	# GLX extension module for X
	install -Dm755 usr/X11R6/lib/modules/extensions/libglx.so.$pkgver "$pkgdir/usr/lib/xorg/modules/extensions/libglx.so.$pkgver"
	ln -s libglx.so.$pkgver "$pkgdir/usr/lib/xorg/modules/extensions/libglx.so.1"
	ln -s libglx.so.$pkgver "$pkgdir/usr/lib/xorg/modules/extensions/libglx.so"

	# OpenGL libraries
	install -Dm755 usr/lib/libGL.so.$pkgver "$pkgdir/usr/lib/nvidia/libGL.so.$pkgver"
	ln -s libGL.so.$pkgver "$pkgdir/usr/lib/nvidia/libGL.so.1"
	ln -s libGL.so.$pkgver "$pkgdir/usr/lib/nvidia/libGL.so"

	# OpenGL core library
	install -Dm755 usr/lib/libGLcore.so.$pkgver "$pkgdir/usr/lib/nvidia/libGLcore.so.$pkgver"
	ln -s libGLcore.so.$pkgver "$pkgdir/usr/lib/nvidia/libGLcore.so.1"
	ln -s libGLcore.so.$pkgver "$pkgdir/usr/lib/nvidia/libGLcore.so"

	# XvMC
	install -Dm755 usr/X11R6/lib/libXvMCNVIDIA.so.$pkgver "$pkgdir/usr/lib/nvidia/libXvMCNVIDIA.so.$pkgver"
	ln -s libXvMCNVIDIA.so.$pkgver "$pkgdir/usr/lib/nvidia/libXvMCNVIDIA_dynamic.so.1"
	ln -s libXvMCNVIDIA.so.$pkgver "$pkgdir/usr/lib/nvidia/libXvMCNVIDIA_dynamic.so"

	# nvidia-tls library
	install -Dm755 usr/lib/tls/libnvidia-tls.so.$pkgver "$pkgdir/usr/lib/nvidia/libnvidia-tls.so.$pkgver"
	ln -s libnvidia-tls.so.$pkgver "$pkgdir/usr/lib/nvidia/libnvidia-tls.so.1"
	ln -s libnvidia-tls.so.$pkgver "$pkgdir/usr/lib/nvidia/libnvidia-tls.so"

	# nvidia-cfg library
	install -Dm755 usr/lib/libnvidia-cfg.so.$pkgver "$pkgdir/usr/lib/nvidia/libnvidia-cfg.so.$pkgver"
	ln -s libnvidia-cfg.so.$pkgver "$pkgdir/usr/lib/nvidia/libnvidia-cfg.so.1"
	ln -s libnvidia-cfg.so.$pkgver "$pkgdir/usr/lib/nvidia/libnvidia-cfg.so"

	# CUDA
	install -D -m755 usr/lib/libcuda.so.$pkgver "$pkgdir/usr/lib/nvidia/libcuda.so.$pkgver"
	ln -s libcuda.so.$pkgver "$pkgdir/usr/lib/nvidia/libcuda.so.1"
	ln -s libcuda.so.$pkgver "$pkgdir/usr/lib/nvidia/libcuda.so"

	# nvidia-xconfig
	install -Dm755 usr/bin/nvidia-xconfig "$pkgdir/usr/bin/nvidia-xconfig"
	install -Dm644 usr/share/man/man1/nvidia-xconfig.1.gz "$pkgdir/usr/share/man/man1/nvidia-xconfig.1.gz"

	# nvidia-settings
	install -Dm755 usr/bin/nvidia-settings "$pkgdir/usr/bin/nvidia-settings"
 	install -Dm644 usr/share/man/man1/nvidia-settings.1.gz "$pkgdir/usr/share/man/man1/nvidia-settings.1.gz"
	install -Dm644 usr/share/applications/nvidia-settings.desktop "$pkgdir/usr/share/applications/nvidia-settings.desktop"
	install -Dm644 usr/share/pixmaps/nvidia-settings.png "$pkgdir/usr/share/pixmaps/nvidia-settings.png"
	sed -e 's:__UTILS_PATH__:/usr/bin:' -e 's:__PIXMAP_PATH__:/usr/share/pixmaps:' -i "$pkgdir/usr/share/applications/nvidia-settings.desktop"

	# nvidia-bug-report
	install -Dm755 usr/bin/nvidia-bug-report.sh "$pkgdir/usr/bin/nvidia-bug-report.sh"

	# nvidia-smi
	install -Dm755 usr/bin/nvidia-smi "$pkgdir/usr/bin/nvidia-smi"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/nvidia-173xx/LICENSE"
	ln -s nvidia-173xx "$pkgdir/usr/share/licenses/nvidia-173xx-utils"

	install -D -m644 usr/share/doc/README.txt "$pkgdir/usr/share/doc/nvidia-173xx/README"
	install -D -m644 usr/share/doc/NVIDIA_Changelog "$pkgdir/usr/share/doc/nvidia-173xx/NVIDIA_Changelog"
	ln -s nvidia-173xx "$pkgdir/usr/share/doc/nvidia-173xx-utils"

	install -dm 755 "$pkgdir"/etc/ld.so.conf.d
	echo -e '/usr/lib/nvidia/' > "$pkgdir"/etc/ld.so.conf.d/00-nvidia.conf
}
