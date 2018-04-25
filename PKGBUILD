# Contributor: holos
# Contributor: Michael Witten <mfwitten>
# Contributor: Vladimir Gorbunov <zaza>
# Contributor: Earnest
# Contributor: Attila Toth <menta>
# Contributor: Flu
# Contributor: menta <attila dot toth at ch dot bme dot hu>
# Contributor: hero <erdetb at web dot de>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=llpp-git
pkgver=27.r61.gba24cbd
pkgrel=1
pkgdesc='A graphical PDF viewer which aims to superficially resemble less(1).'
arch=('i686' 'x86_64')
url="http://repo.or.cz/w/llpp.git"
license=('custom')
provides=('llpp')
conflicts=('llpp')
depends=('mupdf' 'freetype2' 'jbig2dec' 'openjpeg2'
         'libgl' 'libjpeg-turbo' 'glu' 'desktop-file-utils')
makedepends=('git' 'libmupdf' 'mupdf>=1.7' 'ocaml>=4.04' 'asciidoc' 'xmlto')
source=("$pkgname::git+git://repo.or.cz/llpp.git")
sha256sums=('SKIP')
# Dictionary lookup: http://repo.or.cz/llpp.git/commit/29916e0cadcdf0ee3136fc3b4655b3c8b0d01a7b
optdepends=(
  'xsel: text selection'
  'xclip: text selection'
  'sdcv: dictionary lookup'
  'rofi: dictionary lookup'
  'adobe-source-code-pro-fonts: recommended font for dictionary lookup presentation (any font can be used)'
  'wget: llppac fetch remote urls (preferred)'
  'curl: llppac fetch remote urls (alternative)'
  'file: llppac automatic file type recognition'
  'xz: llppac xz archives'
  'gzip: llppac gzip archives'
  'bzip2: llppac bzip2 archives'
  'zip: llppac png and jpeg conversion'
  'djvulibre: llppac djvu conversion'
  'ghostscript: llppac postscript, dvi, and djvu conversion'
  'princexml: llppac html conversion'
  'unoconv: llppac office document conversion'
  'antiword: llppac .doc conversion (alternative)'
  'inkscape: llppac svg conversion (preferred)'
  'librsvg: llppac svg conversion (alternative)'
  'imagemagick: llppac image conversion'
  'pango: llppac font conversion'
  'pandoc: llppac text conversion'
  'texlive-core: llppac dvi conversion'
)
options=('!strip')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i -e 's@-I \$mudir/include -I \$mudir/thirdparty/freetype/include@-I /usr/include/freetype2@' build.bash
  sed -i -e 's@-lmupdfthird@-lmupdfthird -lz -lfreetype -ljpeg -ljbig2dec -lopenjp2@' build.bash
  sed -i -e 's@-L\$mudir/build/native @@' build.bash

  # /usr/lib/libharfbuzz.so.0: error adding symbols: DSO missing from command line
  sed -i -e 's@-lmupdf@-lmupdf -lharfbuzz@' build.bash
}

build() {
  cd "$srcdir/$pkgname"
  ./build.bash build
  cd misc/completions/
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 build/llpp $pkgdir/usr/bin/llpp
  install -Dm644 misc/llpp.desktop $pkgdir/usr/share/applications/llpp.desktop
  install -Dm644 README $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE

  # man pages
  for f in llpp.man llppac.man llpphtml.man; do
    install -Dm644 man/$f "$pkgdir/usr/share/man/man1/${f%.man}.1"
  done

  # helper scripts
  cd misc/
  for i in dicx dllpp llpp.inotify llppac llpphtml; do
    install -Dm755 $i $pkgdir/usr/bin/$i
  done

  # custom key bindings: https://wiki.archlinux.org/index.php/Llpp#Custom_key_bindings
  install -Dm644 keys.txt "$pkgdir/usr/share/${pkgname%-*}/keys.txt"

  # CSS styles
  for i in epub.css prince.css; do
    install -Dm644 $i "$pkgdir/usr/share/${pkgname%-*}/$i"
  done

  # Wikipedia
  install -Dm755 wikipedia/wpget "$pkgdir/usr/share/${pkgname%-*}/wpget"
  install -Dm644 wikipedia/wiki2.css "$pkgdir/usr/share/${pkgname%-*}/wiki2.css"

  # shell completion
  cd completions/
  install -Dm644 bash/llpp "$pkgdir/usr/share/bash-completion/completions/llpp"
  install -Dm644 bash/llppac "$pkgdir/usr/share/bash-completion/completions/llppac"
  install -Dm644 zsh/llpp "$pkgdir/usr/share/zsh/site-functions/_llpp"
  install -Dm644 zsh/llppac "$pkgdir/usr/share/zsh/site-functions/_llppac"
}

