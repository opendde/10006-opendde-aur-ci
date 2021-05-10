# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>
# Contributor: particle-iot (https://github.com/particle-iot)

pkgname=prtcl-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="The new Particle CLI"
arch=('x86_64')
url="https://github.com/particle-iot/particle-cli"
license=('Apache')
options=('!strip')
source=("prtcl.deb::http://prtcl.s3-website-us-east-1.amazonaws.com/apt/prtcl_$pkgver-1_amd64.deb")
noextract=("prtcl.deb")
sha256sums=('68d35a3a2c9260f7838f9aa9dca2a33d1f042951d1df3d7cd8b31905851febdf')

depends=()
optdepends=("bash-completion")

package() {
    # Extract .deb    
    bsdtar -O -xf "prtcl.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # Create bash completion
    HOME="$srcdir" "$pkgdir/usr/bin/prtcl" autocomplete &> /dev/null
    install -D "$srcdir/.cache/@particle/cli/autocomplete/functions/bash/prtcl.bash" \
        "$pkgdir/usr/share/bash-completion/completions/prtcl"
}
