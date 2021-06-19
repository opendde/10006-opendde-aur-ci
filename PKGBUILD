pkgname=michaelas-harp
pkgver=1.0.0
pkgrel=1
pkgdesc="Michaelas Harp Sample Library (VST Plugin)"
arch=('x86_64')
url="https://librewave.com/product/michaelas-harp/"
license=('GPL3')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	## Extract Michaelas Harp
	_runscript="`xdg-user-dir DOWNLOAD`/Michaelas Harp 1.0.0.sh"
	ln -srf "${_runscript}" "$srcdir/`basename "${_runscript}"`"
	chmod +x "$srcdir/`basename "${_runscript}"`"
	sh "$srcdir/`basename "${_runscript}"`" --tar xvf
}

package() {
    ## Install VST Plugin
    install -Dm755 "$srcdir/Michaelas Harp.so" "$pkgdir/usr/lib/vst/Michaelas Harp.so"

     ## Install EULA
    install -Dm644 "$srcdir/License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
