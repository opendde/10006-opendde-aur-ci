# Maintainer: robertfoster

pkgname=liquidsoap
pkgver=1.3.3
pkgrel=2
pkgdesc="A swiss-army knife for multimedia streaming, notably used for netradios and webtvs"
arch=('i686' 'x86_64')
url="http://savonet.sourceforge.net/"
license=('GPL')
depends=('faad2' 'ffmpeg' 'fluidsynth' 'gavl' 'gd' 'giflib' 'gst-plugins-bad'  'gst-plugins-base'  'gst-plugins-good'  'gst-plugins-ugly' 'libao' 'libfdk-aac' 'liblo' 'libmad' 
'libxpm' 'ocaml-ffmpeg' 'ocaml-ogg' 'openssl' 'portaudio' 'sdl_image' 'sdl_ttf' 'soundtouch' 'taglib')
makedepends=('dssi' 'frei0r-plugins' 'git' 'ladspa' 'libxml-perl' 'ocaml-gd4o' 'ocaml-ocamlsdl' 'ocaml-pcre' 'ocaml-ssl' 'ocaml-xmlm' 'ocaml-yojson' 'perl-xml-dom')
source=("$pkgname-$pkgver-full::git+https://github.com/savonet/liquidsoap-full"
	PACKAGES
	$pkgname.service
	$pkgname.tmpfilesd
)

install=$pkgname.install
options=(!makeflags)
conflicts=('liquidsoap-git' 'liquidsoap-full')

prepare() {
	cd $srcdir/$pkgname-$pkgver-full
	./bootstrap
	git submodule update --remote --merge
	cp $srcdir/PACKAGES PACKAGES
}

build() {
	cd $srcdir/$pkgname-$pkgver-full

	./configure --prefix=/usr  --localstatedir=/var --sysconfdir=/etc --without-user --without-group --disable-camomile --disable-oss
	make all && make doc
}

package() {
	cd $srcdir/$pkgname-$pkgver-full
	make DESTDIR="$pkgdir/" datadir="$pkgdir/usr/share/" mandir="$pkgdir/usr/share/man/"  localstatedir="$pkgdir/var"  bindir="$pkgdir/usr/bin/"  libdir="$pkgdir/usr/lib/" sysconfdir="$pkgdir/etc/" install

	# Install systemd unit
	install -Dm0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/liquidsoap@.service"
	# Install the tmpfilesd file
	install -Dm0644 $srcdir/$pkgname.tmpfilesd $pkgdir/usr/lib/tmpfiles.d/liquidsoap.conf
}

md5sums=('SKIP'
	'a69d72938d424cdeb88f73a32d6a78cb'
	'762d6607ff0889e34b8c874970b38bc9'
'f9106e5c42cabc21c4c8464d9b1ad63e')
