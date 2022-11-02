# Maintainer: fn2006 <usernamefn2006alreadyused@protonmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: txtsd <code@ihavea.quest>

pkgname=pollymc-qt5-bin
pkgver=5.1
pkgrel=1
pkgdesc="Prism Launcher fork that adds Ely.by support and allows you to use offline mode without an account."
arch=('x86_64')
url="https://github.com/fn2006/PollyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt5-base' 'qt5-svg' 'qt5-imageformats' 'zlib' 'hicolor-icon-theme')
provides=('pollymc' 'pollymc-qt5')
conflicts=('pollymc' 'pollymc-qt5')
optdepends=('java-runtime=8: support for Minecraft versions < 1.17'
            'java-runtime=17: support for Minecraft versions >= 1.17')
source=("https://github.com/fn2006/PollyMC/releases/download/${pkgver}/PollyMC-Linux-${pkgver}.tar.gz")
noextract=("PollyMC-Linux-${pkgver}.tar.gz")
sha256sums=('dc19d0509929358f1dd9a3d679fa2bcf013d07c166c83e60f7faa4d5ae5b8a91')

package() {
    install -d "$pkgdir/usr"
    tar -C "$pkgdir/usr" -xvf PollyMC-Linux-${pkgver}.tar.gz
    chown -R root:root "$pkgdir/usr"  # fils in tarball are not owned by root
}

