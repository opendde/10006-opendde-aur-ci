# Maintainer: Joël Krähemann <jkraehemann@gmail.com>
pkgname=gsequencer
pkgver=4.0.11
pkgrel=1
pkgdesc="Advanced Gtk+ Sequencer"
arch=('x86_64')
url="https://nongnu.org/gsequencer"
license=('GPL3')
depends=('cairo' 'gdk-pixbuf2' 'glibc' 'harfbuzz' 'libx11' 'libxml2' 'zlib')
makedepends=('alsa-lib' 'atk' 'dssi' 'fftw' 'glib2' 'gobject-introspection' 'gtk4' 'gtk-doc' 'jack' 'ladspa' 'libinstpatch' 'libpulse' 'libsndfile' 'libsoup3' 'libutil-linux' 'lv2' 'pango' 'poppler-glib' 'gst-plugins-base' 'gst-plugins-good')
checkdepends=('cunit' 'xorg-server-xvfb')
provides=('libgsequencer.so' 'libags_thread.so' 'libags_server.so' 'libags_gui.so' 'libags_audio.so' 'libags.so')
source=("https://download.savannah.gnu.org/releases/gsequencer/4.0.x/$pkgname-$pkgver.tar.gz")
sha512sums=('a87feaaa0fb0771cbf829555e72541bb647cf6d285d73a4aaf7d00cb13824b17957c6413722a6fc228239c5b19553b4968e0dd4e5393c86b8fa08ceda63d3c05')
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
	  depends+=('libasound.so' 'libatk-1.0.so' 'libfftw3.so' 'libgio-2.0.so' 'libglib-2.0.so' 'libgmodule-2.0.so' 'libgobject-2.0.so' 'libgthread-2.0.so' 'libgtk-4.so' 'libgdk-4.so' 'libinstpatch-1.0.so' 'libjack.so' 'libpango-1.0.so' 'libpangocairo-1.0.so' 'libpulse.so' 'libpulse-mainloop-glib.so' 'libsndfile.so' 'libsoup-3.0.so' 'libuuid.so' 'libpoppler-glib.so')
	  cd "$pkgname-$pkgver"
	  make -j1 DESTDIR="$pkgdir/" install
	  make -j1 DESTDIR="$pkgdir/" install-html
}
