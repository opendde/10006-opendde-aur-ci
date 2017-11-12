# Maintainer: Dan Johansen <strit83 at gmail dot com>

pkgname=gpu-viewer
_pkgname=GPU-Viewer
pkgver=1.1a
pkgrel=1
pkgdesc="A frontend to glxinfo and vulkaninfo."
arch=('i686' 'x86_64')
url="https://github.com/supertriodo/Arena-Tracker/"
license=('GPL3')
depends=('gtk3' 'python' 'python-gobject')
optdepends=('nvidia: Vulkan nvidia driver'
            'mesa'
            'vulkan-utils: Vulkan utilities for vulkan support'
            'vulkan-radeon: Vulkan AMD drivers')
provides=(gpu-viewer)
source=("https://github.com/arunsivaramanneo/$_pkgname/archive/$pkgver.tar.gz")

package() {
    install -dm755 $pkgdir/usr/share/$pkgname
	install -dm755 $pkgdir/usr/share/applications
	install -d $pkgdir/usr/bin/
	cp -rf $srcdir/$_pkgname-$pkgver/Files $pkgdir/usr/share/$pkgname
    cp -rf $srcdir/$_pkgname-$pkgver/Images $pkgdir/usr/share/$pkgname
	cp -rf $srcdir/$_pkgname-$pkgver/"About GPU Viewer" $pkgdir/usr/share/$pkgname
	cp -rf $srcdir/$_pkgname-$pkgver/GPUViewer $pkgdir/usr/share/$pkgname
	cp -rf $srcdir/$_pkgname-$pkgver/"Change Log" $pkgdir/usr/share/$pkgname
	cp -rf $srcdir/$_pkgname-$pkgver/LICENSE $pkgdir/usr/share/$pkgname
	cp -rf $srcdir/$_pkgname-$pkgver/README.md $pkgdir/usr/share/$pkgname
	cp -rf $srcdir/$_pkgname-$pkgver/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	ln -s "$pkgdir/usr/share/$pkgname/GPUViewer" "$pkgdir/usr/bin/$pkgname"
}

md5sums=('041d063770334e16074dfaf27c2a5aa9')
