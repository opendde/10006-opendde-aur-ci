# Maintainer: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Heavily based on extra/texlive-bin

_pkgname=texlive-bin
pkgname=${_pkgname}-svn
pkgver=2016.37788
pkgrel=1
_biber_ver=1.9 # for biblatex 2.9 only.
pkgdesc="TeX Live binaries (development version)"
arch=('i686' 'x86_64')
url='https://www.tug.org/texlive/'
license=('GPL')
depends=('cairo' 'pixman' 'graphite' 't1lib' 'gd' 'poppler'
         'libsigsegv' 'zziplib' 'libpng' 'libjpeg' 'freetype2'
         'icu' 'harfbuzz' 'harfbuzz-icu')
makedepends=('perl' 'clisp' 'ffcall')
optdepends=('ed: for texconfig')
provides=('lcdf-typetools' 'kpathsea' 'xindy' 'pdfjam')
conflicts=('pdfjam')
options=('!strip')
makedepends+=('subversion')
provides+=("${_pkgname}=$pkgver")
conflicts+=("${_pkgname}")
install=texlive.install
source=("${_pkgname}::svn://tug.org/texlive/trunk/Build/source"
        'fix-fontforge-encoding.patch')
source_x86_64=("http://downloads.sourceforge.net/project/biblatex-biber/biblatex-biber/${_biber_ver}/binaries/Linux/biber-linux_x86_64.tar.gz")
source_i686=("http://downloads.sourceforge.net/project/biblatex-biber/biblatex-biber/${_biber_ver}/binaries/Linux/biber-linux_x86_32.tar.gz")
md5sums=('SKIP'
         'bfb9716aa00c86c08cd31e5b32edeb98')
md5sums_x86_64=('137839688478710ded88909088dee970')
md5sums_i686=('e1af258c7b7fa95d8299696aa3552eb3')

pkgver() {
  cd "$srcdir/${_pkgname}"
  local y="$(cat version.ac | sed -nr 's/m4_define\(\[tex_live_version\], \[([0-9]{4})\/dev\]\)/\1/p')"
  echo "$y.$(svn info|grep Revision|cut -d ' ' -f2)"
}

build() {
  cd "$srcdir/${_pkgname}"

   if [ "${CARCH}" = "x86_64" ]; then
     export CFLAGS="${CFLAGS} -fPIC"
     export CXXFLAGS="${CXXFLAGS} -fPIC"
   fi

   # this patch removes spurious error message with locale "xx_YY.utf8"
   #patch -Np0 -i fix-fontforge-encoding.patch
   # t4ht expects to be un /usr/share/texmf/bin/t4ht (FS#27251)
   sed -i s/SELFAUTOPARENT/TEXMFROOT/ texk/tex4htk/t4ht.c
   #############################################################
   ### configure
   ## prevent compiling Xdvi with libXp
   sed -i~ 's|-lXp ||' texk/xdvik/configure
   test ! -d Work && mkdir Work
   cd Work
   echo "--> Initial configuration..."
   # we use temporary prefix to avoid messing the existing
   # $pkgdir/usr/share/texmf tree
   # system zlib is disabled due to issues with zlib 1.2.6 (FS#28221)
   ../configure --prefix=/usr -C \
     --sysconfdir=/etc \
     --datarootdir=/usr/share \
     --datadir=/usr/share \
     --mandir=/usr/share/man \
     --disable-native-texlive-build \
     --with-banner-add="/Arch Linux" \
     --disable-multiplatform \
     --disable-dialog \
     --disable-psutils \
     --disable-t1utils \
     --disable-bibtexu \
     --disable-xz \
     --enable-shared \
     --disable-static \
     --with-system-zlib \
     --with-system-zziplib \
     --with-system-pnglib \
     --with-system-ncurses \
     --with-system-t1lib \
     --with-system-gd \
     --with-system-poppler \
     --with-system-xpdf \
     --with-system-freetype2 \
     --with-system-pixman \
     --with-system-cairo \
     --with-system-harfbuzz \
     --with-system-graphite \
     --with-system-icu \
     --with-freetype2-libdir=/usr/lib \
     --with-freetype2-include=/usr/include/freetype2 \
     --with-xdvi-x-toolkit=xaw \
     --disable-dump-share \
     --disable-aleph \
     --enable-luatex \
     --with-clisp-runtime=default \
     --enable-xindy --disable-xindy-rules --disable-xindy-docs
   #############################################################
   ### make
   echo "-------------------------------------------------------"
   echo "--> Building the whole beast ..."
   echo "-------------------------------------------------------"
   make
}

#check() {
#  cd "$srcdir/${_pkgname}/Work"
#  make check
#}

package() {
  cd "$srcdir/${_pkgname}"

   #############################################################
   ### install
   # fixes for xindy
   find utils/xindy -name Makefile -exec sed -i -e "s|^prefix =.\+$|prefix = $pkgdir/usr|" -e "s|^mandir =.\+$|mandir = \${prefix}/share/man|" -e "s|^datadir =.\+$|datadir = \${datarootdir}/texmf|" -e "s|^docdir =.\+$|docdir = \${datadir}/doc/xindy|" '{}' \;

   echo "-------------------------------------------------------"
   echo "--> Proceeding with make install ..."
   echo "-------------------------------------------------------"
   cd Work
   make DESTDIR="${pkgdir}" texmf="$pkgdir"/usr/share/texmf install
   rm -rf "${pkgdir}"/usr/{texmf,share/texmf-dist}

   ## install biber
   install -m755 "${srcdir}/biber" "${pkgdir}/usr/bin/biber"

   ## symlink engines by hand. texlinks has moved to texlive-core...
   mkdir -p "${pkgdir}/usr/bin"
   ln -s eptex "${pkgdir}/usr/bin/platex"
   ln -s euptex "${pkgdir}/usr/bin/uplatex"
   ln -s luatex "${pkgdir}/usr/bin/dvilualatex"
   ln -s luatex "${pkgdir}/usr/bin/dviluatex"
   ln -s luatex "${pkgdir}/usr/bin/lualatex"
   ln -s luatex "${pkgdir}/usr/bin/lualollipop"
   ln -s pdftex "${pkgdir}/usr/bin/amstex"
   ln -s pdftex "${pkgdir}/usr/bin/cslatex"
   ln -s pdftex "${pkgdir}/usr/bin/csplain"
   ln -s pdftex "${pkgdir}/usr/bin/eplain"
   ln -s pdftex "${pkgdir}/usr/bin/etex"
   ln -s pdftex "${pkgdir}/usr/bin/jadetex"
   ln -s pdftex "${pkgdir}/usr/bin/latex"
   ln -s pdftex "${pkgdir}/usr/bin/lollipop"
   ln -s pdftex "${pkgdir}/usr/bin/mex"
   ln -s pdftex "${pkgdir}/usr/bin/mllatex"
   ln -s pdftex "${pkgdir}/usr/bin/mltex"
   ln -s pdftex "${pkgdir}/usr/bin/pdfetex"
   ln -s pdftex "${pkgdir}/usr/bin/pdfcslatex"
   ln -s pdftex "${pkgdir}/usr/bin/pdfcsplain"
   ln -s pdftex "${pkgdir}/usr/bin/pdfjadetex"
   ln -s pdftex "${pkgdir}/usr/bin/pdflatex"
   ln -s pdftex "${pkgdir}/usr/bin/pdfmex"
   ln -s pdftex "${pkgdir}/usr/bin/pdfxmltex"
   ln -s pdftex "${pkgdir}/usr/bin/texsis"
   ln -s pdftex "${pkgdir}/usr/bin/utf8mex"
   ln -s pdftex "${pkgdir}/usr/bin/xmltex"
   ln -s xetex "${pkgdir}/usr/bin/xelatex"
   ln -s xetex "${pkgdir}/usr/bin/xelollipop"

   #############################################################
   # remove dangling symlinks
   _bibtexextra_scripts="
bibexport
listbib
multibibliography
urlbst
"
   _core_scripts="
a2ping
a5toa4
adhocfilelist
afm2afm
allcm
allec
allneeded
arara
arlatex
autoinst
bundledoc
checkcites
chkweb
context
contextjit
ctanify
ctanupload
de-macro
depythontex
deweb
dosepsbin
dtxgen
dvi2fax
dviasm
dvired
e2pall
epstopdf
findhyph
fmtutil
fmtutil-sys
fontinst
fragmaster
installfont-tl
kpsepath
kpsetool
kpsewhere
kpsexpand
latex-git-log
latex2man
latexdiff
latexdiff-vc
latexfileversion
latexindent
latexmk
latexpand
latexrevise
listings-ext.sh
ltxfileinfo
ltximg
lua2dox_filter
luaotfload-tool
luatools
match_parens
mf2pt1
mkjobtexmf
mkt1font
mktexfmt
mptopdf
mtxrun
mtxrunjit
ot2kpx
pdf180
pdf270
pdf90
pdfatfi
pdfbook
pdfcrop
pdfflip
pdfjam
pdfjam-pocketmod
pdfjam-slides3up
pdfjam-slides6up
pdfjoin
pdfnup
pdfpun
pfarrei
pkfix
pkfix-helper
ps2eps
ps2frag
pslatex
purifyeps
pythontex
repstopdf
rpdfcrop
rungs
simpdftex
sty2dtx
texconfig
texconfig-dialog
texconfig-sys
texcount
texdef
texdiff
texdirflatten
texdoc
texdoctk
texexec
texfot
texindy
texlinks
texliveonfly
texloganalyser
texmfstart
thumbpdf
typeoutfileinfo
updmap
updmap-sys
vpl2ovp
vpl2vpl
xindy
"
   _games_scripts="rubikrotation"
   _htmlxml_scripts="ht htcontext htlatex htmex httex httexi htxelatex htxetex mk4ht"
   _langcyrillic_scripts="rubibtex rumakeindex"
   _langextra_scripts="ebong"
   _langgreek_scripts="mkgrkindex"
   _langjapanese_scripts="convbkmk ptex2pdf
kanji-fontmap-creator
kanji-config-updmap
kanji-config-updmap-sys
"
   _langkorean_scripts="jamo-normalize komkindex ttf2kotexfont"
   _latexextra_scripts="
authorindex
exceltex
makeglossaries
pdfannotextractor
perltex
ps4pdf
splitindex
svn-multi
vpe"
   _music_scripts="lily-glyph-commands lily-image-commands lily-rebuild-pdfs
m-tx musixtex musixflx pmx2pdf pmxchords"
   _pictures_scripts="cachepic epspdf epspdftk fig4latex mathspic mkpic"
   _pstricks_scripts="pedigree pst2pdf"
   _science_scripts="ulqda"
   for s in \
        ${_bibtexextra_scripts} \
        ${_core_scripts}       \
        ${_games_scripts}       \
        ${_htmlxml_scripts}    \
        ${_langcyrillic_scripts} \
        ${_langextra_scripts}    \
        ${_langgreek_scripts}    \
        ${_langjapanese_scripts} \
        ${_langkorean_scripts} \
        ${_latexextra_scripts} \
        ${_music_scripts}      \
        ${_pictures_scripts}   \
        ${_pstricks_scripts}   \
        ${_science_scripts}    \
        tlmgr; do
       ! readlink -e "$pkgdir"/usr/bin/$s && rm "$pkgdir"/usr/bin/$s
   done
   ###################################################################
}
