# Maintainer: bbbb <mxk1 (at) protonmail (dot) com>
# Maintainer:  Iliya Ivanov <aur@proforge.org>

pkgname=btrustbiss
pkgver=3.15
pkgrel=3
pkgdesc="Browser independent signing service."
arch=('x86_64')
url="https://www.b-trust.org"
license=('GPL')
source=("$url/attachments/BtrustPrivateFile/24/docs/B-TrustBISS.tar")
sha256sums=('ef062e61b0c41d0238ca98c415c1b44122a8f3bf4200bf6f7a94621f17d3929b')
depends=('fakeroot' 'pcsclite' 'glibc' 'gcc-libs' 'xdg-utils' 'zlib')
options=(!strip !emptydirs !makeflags)
install=$pkgname.install

package(){
    # Extract tar package
    tar xvf B-TrustBISS.tar
    # Extract deb package
    ar xv B-TrustBISS.deb

    # Install package
    tar Jxf data.tar.xz -C "$pkgdir"
    
    # Fix for wrong permissions on subdirs
    find "$pkgdir" -type d -exec chmod 755 {} \;
}
