# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=dosbox-openglide-svn
pkgver=0.74.2.r4230
pkgrel=1
pkgdesc='DOS emulator for running DOS games (with openglide 3D, svn version)'
arch=('x86_64')
url='https://www.dosbox.com/'
license=('GPL')
depends=(
    # official repositories:
        'sdl_net' 'zlib' 'sdl_sound' 'libgl' 'libpng' 'alsa-lib' 'gcc-libs' 'glu'
    # AUR:
        'openglide-git'
)
makedepends=('subversion' 'mesa-libgl')
provides=('dosbox' 'dosbox-openglide' 'dosbox-svn')
conflicts=('dosbox')
source=('dosbox'::'svn+https://svn.code.sf.net/p/dosbox/code-0/dosbox/trunk'
        'https://raw.githubusercontent.com/voyageur/openglide/c794a6efd48351340a3606f404aaf84d90446f56/platform/dosbox/glide2x.ovl'
        'dosbox.desktop'
        'dosbox.png'
        'dosbox-openglide-svn.patch')
sha256sums=('SKIP'
            'ed391bb9fb0e7b5d33b92882356f02b05913361675712d93b4ef303d5b9f2ac9'
            '680c8543cb0329000a36c188bb95999c6fae159d3704a4496b54cfada360c7e5'
            '491c42d16fc5ef7ee2eca1b736f7801249d4ca8c0b236a001aec0d3e24504f3b'
            'e8571c41ab3ebb29f423d8ddb39ba0237b4ee2995ee4a6a210e51b0008f620d6')

prepare() {
    cd dosbox
    
    # add openglide support
    patch -Np1 -i "${srcdir}/dosbox-openglide-svn.patch"
    
    ./autogen.sh
}

pkgver() {
    cd dosbox
    
    local _version
    local _revision
    
    _version="$(head -n1 VERSION | sed 's/-/./g')"
    _revision="$(svnversion | tr -d 'A-z')"
    
    printf '%s.r%s' "$_version" "$_revision"
}

build() {
    cd dosbox
    
    ./configure --prefix='/usr' --sysconfdir='/etc/dosbox'
    
    make
}

package() {
    cd dosbox
    
    make DESTDIR="$pkgdir" install
    
    # glide2x.ovl
    install -D -m644 "${srcdir}/glide2x.ovl" -t "${pkgdir}/usr/share/dosbox"
    
    # desktop file and icon
    install -D -m644 "${srcdir}/dosbox.desktop" -t "${pkgdir}/usr/share/applications"
    install -D -m644 "${srcdir}/dosbox.png"     -t "${pkgdir}/usr/share/pixmaps"
    
    # docs
    install -D -m644 README            -t "${pkgdir}/usr/share/doc/dosbox"
    install -D -m644 docs/README.video -t "${pkgdir}/usr/share/doc/dosbox"
}
