# Maintainer: Simao Gomes Viana <xdevs23@outlook.com>

pkgname=linux-nitrous
pkgver=5.3.9
pkgrel=5
_tar_pkgrel=5
pkgdesc="Modified Linux kernel optimized for Haswell (and newer) compiled using clang"
arch=('x86_64')
url="https://gitlab.com/xdevs23/linux-nitrous"
license=('GPL2')
groups=()
depends=()
provides=('linux')
conflicts=('linux-nitrous-git-headers' 'linux-nitrous-git')
makedepends=('tar')
optdepends=(
    'linux-nitrous-headers: to build DKMS modules against this kernel'
    )
source=("https://github.com/xdevs23/linux-nitrous/releases/download/v$pkgver-$_tar_pkgrel/linux-nitrous-git-$pkgver-$_tar_pkgrel-x86_64.pkg.tar.xz")
sha256sums=('707b44946126b97b0436148d68cff686328a33266a3f9119913d7a1f6061ddec')

build() {
    echo "No need to build anything"
}

package() {
    cd "$srcdir"
    cp -R "$srcdir/." "$pkgdir/."
    mv "$srcdir/.INSTALL" "${startdir}/linux-nitrous.install"
    install="linux-nitrous.install"
    for f in .BUILDINFO .MTREE .INSTALL .PKGINFO; do
      rm -f "$pkgdir/$f"
    done
    rm -f "$pkgdir/*.tar.*"
}
