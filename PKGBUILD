# Contributor: Peter Severin <peter@wireframesketcher.com>
# Maintainer: Peter Severin <peter@wireframesketcher.com>

pkgname=wireframesketcher
pkgver=4.4.5
pkgrel=1
pkgdesc="WireframeSketcher, wireframing tool for professionals (Trial)"
arch=('i686' 'x86_64')
url="http://wireframesketcher.com"
_watch=('http://wireframesketcher.com/version')
license=('nonfree')
if [ "${CARCH}" = "x86_64" ]; then
    _arch="amd64"
    sha512sums=('e04deff1ffa0bfc6a5b02043b553416ca4cfe602511640336e8f65066612e6d196122f10a5e27cabb9b4a86e2aff175fbd580d3003303c701e0deb657a2ec9d7')
else
    _arch="i386"
    sha512sums=('bdd5da00302028b2881f9210eff7fc78117f62a253e5605f4a7aae5fa392b865a5a804a6bd525fe4888273c5b1b19bce1bc996cdf570d9556bfd3236af97228c')
fi 
source=("http://cdn.wireframesketcher.com/studio/dist/WireframeSketcher-${pkgver}_${_arch}.deb")
depends=('java-runtime' 'gtk2>=2.8.0' 'webkitgtk2' 'libxtst')

package () {
    cd $srcdir
    tar -C $pkgdir/ -xvf data.tar.xz
    rm -rf $pkgdir/etc
    mkdir -p $pkgdir/usr/bin
    ln -sf /opt/WireframeSketcher/WireframeSketcher $pkgdir/usr/bin/${pkgname}
}

# vim:set ts=4 sw=4 et:
