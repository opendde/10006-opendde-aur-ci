# Maintainer: Joël Krähemann <jkraehemann@gmail.com>
pkgname=gsequencer
pkgver=3.6.7
pkgrel=1
pkgdesc="Advanced Gtk+ Sequencer"
arch=('x86_64')
url="https://nongnu.org/gsequencer"
license=('GPL3')
depends=('cairo' 'gdk-pixbuf2' 'glibc' 'harfbuzz' 'libx11' 'libxml2' 'zlib')
makedepends=('alsa-lib' 'atk' 'dssi' 'fftw' 'glib2' 'gobject-introspection' 'gtk3' 'gtk-doc' 'jack' 'ladspa' 'libinstpatch' 'libpulse' 'libsndfile' 'libsoup' 'libutil-linux' 'lv2' 'pango' 'webkit2gtk' 'gst-plugins-base' 'gst-plugins-good')
checkdepends=('cunit' 'xorg-server-xvfb')
provides=('libgsequencer.so' 'libags_thread.so' 'libags_server.so' 'libags_gui.so' 'libags_audio.so' 'libags.so')
source=("https://download.savannah.gnu.org/releases/gsequencer/3.6.x/$pkgname-$pkgver.tar.gz")
sha512sums=('3b911ba12525593aa352f2cdd1a27d51f2024d3695dd05d1d032a52425aa4e517b54437512f54f18da6f30b30c87a3962ef6867cd7be04ebf19b844c2283f81d')
# validpgpkeys=('ECD34CA97E55AE2AF14FBE9F25B4B3AE3388A17A') # key not available on key servers

prepare() {
	  cd "$pkgname-$pkgver"
	  autoreconf -vfi
}

build() {
	cd "$pkgname-$pkgver"
	export HTMLHELP_XSL=/usr/share/xml/docbook/xsl-stylesheets-1.79.2/htmlhelp/htmlhelp.xsl
	./configure --prefix='/usr' \
	--docdir='/usr/share/doc/gsequencer-doc' \
	--enable-gtk-doc \
	--enable-gtk-doc-html \
	--enable-single-docdir
	make
	make html
}

check() {
	cd "$pkgname-$pkgver"
	xvfb-run make -k check
}

package() {
	  depends+=('libasound.so' 'libatk-1.0.so' 'libfftw3.so' 'libgio-2.0.so' 'libglib-2.0.so' 'libgmodule-2.0.so' 'libgobject-2.0.so' 'libgthread-2.0.so' 'libgtk-3.so' 'libgdk-3.so' 'libinstpatch-1.0.so' 'libjack.so' 'libjavascriptcoregtk-4.0.so' 'libpango-1.0.so' 'libpangocairo-1.0.so' 'libpulse.so' 'libpulse-mainloop-glib.so' 'libsndfile.so' 'libsoup-2.4.so' 'libuuid.so' 'libwebkit2gtk-4.0.so')
	  cd "$pkgname-$pkgver"
	  make -j1 DESTDIR="$pkgdir/" install
	  make -j1 DESTDIR="$pkgdir/" install-html
}
