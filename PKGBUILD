# Maintainer: Adrià Cereto i Massagué <ssorgatem@gmail.com>
# Co-Maintainer: Jonas Van der Aa <ketsukonn@gmail.com>

pkgbase=dxvk-bin
pkgname=('dxvk-bin')
pkgver=1.9.4
pkgrel=2
pkgdesc="A Vulkan-based compatibility layer for Direct3D 9/10/11 which allows running 3D applications on Linux using Wine (Windows DLL binary files)"
url="https://github.com/doitsujin/dxvk"
license=('zlib/libpng')
arch=('x86_64')
provides=("dxvk" "d9vk" "dxvk=$pkgver")
conflicts=("dxvk" "d9vk")
options=(!strip)
source=("https://github.com/doitsujin/dxvk/releases/download/v$pkgver/dxvk-$pkgver.tar.gz"
)
sha256sums=('854f564c3b58a4cdf7b16eb9a4b6bc6ddc0f83d68c4f979a529fc23f7a770502')

package_dxvk-bin () {
        depends=('vulkan-icd-loader')
        optdepends=('lib32-vulkan-icd-loader: 32-bit Windows application support')
        install -D "dxvk-$pkgver"/x32/* -t "$pkgdir/usr/share/dxvk/x32"
        install -D "dxvk-$pkgver"/x64/* -t "$pkgdir/usr/share/dxvk/x64"
        install "dxvk-$pkgver"/setup_dxvk.sh -t "$pkgdir/usr/share/dxvk/"
        install -d "$pkgdir/usr/bin"
        ln -s /usr/share/dxvk/setup_dxvk.sh "$pkgdir/usr/bin/setup_dxvk"
}
