# $Id$
# Maintainer: Vladimir Still <vl.still@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Sebastian Nowicki <sebnow@gmail.com>
# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>
# Contributor: Tobias Kieslich <tobias@justdreams.de>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Tomas Lindquist Olsen <tomas@famolsen.dk>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=('llvm37-split' 'llvm37-libs-split' 'llvm37-ocaml-split' 'lldb37-split' 'clang37-split' 'clang37-analyzer-split' 'clang37-tools-extra-split')
pkgver=3.7.1
_vers_short=`echo $pkgver | cut -d. -f 1-2`
_prefix=/usr/lib/llvm-${_vers_short}/
pkgrel=1
_ocaml_ver=4.02.3
arch=('i686' 'x86_64')
url="http://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
makedepends=('cmake' 'libffi' 'python2' "ocaml=$_ocaml_ver" 'python-sphinx'
             'ocaml-ctypes' 'ocaml-findlib' 'libedit' 'swig')
# Use gcc-multilib to build 32-bit compiler-rt libraries on x86_64 (FS#41911)
makedepends_x86_64=('gcc-multilib')
options=('staticlibs')
source=(http://llvm.org/releases/$pkgver/llvm-$pkgver.src.tar.xz{,.sig}
        http://llvm.org/releases/$pkgver/cfe-$pkgver.src.tar.xz{,.sig}
        http://llvm.org/releases/$pkgver/clang-tools-extra-$pkgver.src.tar.xz{,.sig}
        http://llvm.org/releases/$pkgver/compiler-rt-$pkgver.src.tar.xz{,.sig}
        http://llvm.org/releases/$pkgver/lldb-$pkgver.src.tar.xz{,.sig}
        llvm-3.7.0-link-tools-against-libLLVM.patch
        llvm-3.7.0-export-more-symbols.patch
        clang-3.7.0-add-gcc-abi-tag-support.patch
        clang-tools-extra-3.7.0-install-clang-query.patch
        lldb-3.7.0-avoid-linking-to-libLLVM.patch
        0001-New-MSan-mapping-layout-llvm-part.patch
        0001-New-MSan-mapping-layout-compiler-rt-part.patch
        llvm-Config-llvm-config.h)
sha256sums=('be7794ed0cec42d6c682ca8e3517535b54555a3defabec83554dbc74db545ad5'
            'SKIP'
            '56e2164c7c2a1772d5ed2a3e57485ff73ff06c97dff12edbeea1acc4412b0674'
            'SKIP'
            '4a91edaccad1ce984c7c49a4a87db186b7f7b21267b2b03bcf4bd7820715bc6b'
            'SKIP'
            '9d4769e4a927d3824bcb7a9c82b01e307c68588e6de4e7f04ab82d82c5af8181'
            'SKIP'
            '9a0bc315ef55f44c98cdf92d064df0847f453ed156dd0ef6a87e04f5fd6a0e01'
            'SKIP'
            'cf9c8b4d70b4547eda162644658c5c203c3139fcea6c75003b6cd7dc11a8cccc'
            'a1c9f36b97c639666ab6a1bd647a08a027e93e3d3cfd6f5af9c36e757599ce81'
            '5ed52d54612829402b63bc500bfefae75b3dc444a1524849c26cadf7e0ae4b7d'
            '3abf85430c275ecb8dbb526ecb82b1c9f4b4f782a8a43b5a06d040ec0baba7e7'
            '2d53b6ed4c7620eeade87e7761b98093a0434801ddd599056daed7881141fb01'
            'c5f4e329143bef36b623ba5daf311b5a73fa99ab05fed4ba506c1c3bc4cf5ee7'
            'f44e8fe3cef9b6f706d651f443922261e1dcf53bcaabdd0ac7edb1758e4bc44d'
            '597dc5968c695bbdbb0eac9e8eb5117fcd2773bc91edf5ec103ecffffab8bc48')
validpgpkeys=('11E521D646982372EB577A1F8F0871F202119294'
              'B6C8F98282B944E3B0D5C2530FC3042E345AD05D')

prepare() {
  cd "$srcdir/llvm-$pkgver.src"

  # At the present, clang must reside inside the LLVM source code tree to build
  # See http://llvm.org/bugs/show_bug.cgi?id=4840
  mv "$srcdir/cfe-$pkgver.src" tools/clang

  mv "$srcdir/clang-tools-extra-$pkgver.src" tools/clang/tools/extra

  mv "$srcdir/compiler-rt-$pkgver.src" projects/compiler-rt

  mv "$srcdir/lldb-$pkgver.src" tools/lldb

  # Backport LLVM_LINK_LLVM_DYLIB option
  # https://bugs.archlinux.org/task/46392
  patch -Np1 -i ../llvm-3.7.0-link-tools-against-libLLVM.patch

  # https://llvm.org/bugs/show_bug.cgi?id=24157
  patch -Np2 -i ../llvm-3.7.0-export-more-symbols.patch

  # https://llvm.org/bugs/show_bug.cgi?id=23529
  # http://reviews.llvm.org/D12834
  patch -d tools/clang -Np0 <../clang-3.7.0-add-gcc-abi-tag-support.patch

  # https://llvm.org/bugs/show_bug.cgi?id=24046
  # Upstreamed - http://reviews.llvm.org/D13206
  patch -d tools/clang/tools/extra -Np1 <../clang-tools-extra-3.7.0-install-clang-query.patch

  # https://llvm.org/bugs/show_bug.cgi?id=24953
  patch -d tools/lldb -Np1 <../lldb-3.7.0-avoid-linking-to-libLLVM.patch

  # https://llvm.org/bugs/show_bug.cgi?id=24155
  patch -Np1 -i ../0001-New-MSan-mapping-layout-llvm-part.patch
  patch -d projects/compiler-rt -Np1 <../0001-New-MSan-mapping-layout-compiler-rt-part.patch

  # Use Python 2
  find tools/lldb -name Makefile -exec sed -i 's/python-config/python2-config/' {} +
  sed -i 's|/usr/bin/env python|&2|' \
    tools/lldb/scripts/Python/{build-swig-Python,finish-swig-Python-LLDB}.sh

  mkdir build
}

build() {
  cd "$srcdir/llvm-$pkgver.src/build"

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=${_prefix} \
    -DLLVM_BUILD_LLVM_DYLIB=ON \
    -DLLVM_DYLIB_EXPORT_ALL=ON \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_ENABLE_RTTI=ON \
    -DLLVM_ENABLE_FFI=ON \
    -DLLVM_BUILD_TESTS=ON \
    -DLLVM_BUILD_DOCS=ON \
    -DLLVM_ENABLE_SPHINX=ON \
    -DLLVM_ENABLE_DOXYGEN=OFF \
    -DSPHINX_WARNINGS_AS_ERRORS=OFF \
    -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
    -DLLVM_BINUTILS_INCDIR=/usr/include \
    ..

  make
  make ocaml_doc

  # Disable automatic installation of components that go into subpackages
  sed -i '/\(clang\|lldb\)\/cmake_install.cmake/d' tools/cmake_install.cmake
  sed -i '/extra\/cmake_install.cmake/d' tools/clang/tools/cmake_install.cmake
  sed -i '/compiler-rt\/cmake_install.cmake/d' projects/cmake_install.cmake
}

check() {
  cd "$srcdir/llvm-$pkgver.src/build"
  make check
  make check-clang || warning \
    'Ignoring Clang test failures caused by name mangling differences'
}

package_llvm37-split() {
  pkgdesc="LLVM (installed in ${_prefix})"
  depends=("llvm37-libs-split=$pkgver-$pkgrel" 'perl')

  cd "$srcdir/llvm-$pkgver.src"

  make -C build DESTDIR="$pkgdir" install

  # Remove documentation sources
  rm -r "$pkgdir"${_prefix}/share/doc/llvm/html/{_sources,.buildinfo}

  # The runtime libraries go into llvm-libs
  mv -f "$pkgdir"${_prefix}/lib/lib{LLVM,LTO}.so* "$srcdir"
  mv -f "$pkgdir"${_prefix}/lib/LLVMgold.so "$srcdir"

  # OCaml bindings go to a separate package
  rm -rf "$srcdir"/ocaml.{lib,doc}
  mv "$pkgdir${_prefix}/lib/ocaml" "$srcdir/ocaml.lib"
  mv "$pkgdir${_prefix}/docs/ocaml/html" "$srcdir/ocaml.doc"
  rm -r "$pkgdir${_prefix}/docs"

  if [[ $CARCH == x86_64 ]]; then
    # Needed for multilib (https://bugs.archlinux.org/task/29951)
    # Header stub is taken from Fedora
    mv "$pkgdir${_prefix}/include/llvm/Config/llvm-config"{,-64}.h
    cp "$srcdir/llvm-Config-llvm-config.h" \
      "$pkgdir${_prefix}/include/llvm/Config/llvm-config.h"
  fi

  install -Dm644 LICENSE.TXT "$pkgdir${_prefix}/share/licenses/llvm/LICENSE"
}

package_llvm37-libs-split() {
  pkgdesc="LLVM (runtime libraries, installed in ${_prefix})"
  depends=('gcc-libs' 'zlib' 'libffi' 'libedit' 'ncurses')

  install -d "$pkgdir${_prefix}/lib"
  cp -P \
    "$srcdir"/lib{LLVM,LTO}.so* \
    "$srcdir"/LLVMgold.so \
    "$pkgdir${_prefix}/lib/"

  # Symlink LLVMgold.so from /usr/lib/bfd-plugins
  # https://bugs.archlinux.org/task/28479
  install -d "$pkgdir${_prefix}/lib/bfd-plugins"
  ln -s ../LLVMgold.so "$pkgdir${_prefix}/lib/bfd-plugins/LLVMgold.so"

  install -Dm644 "$srcdir/llvm-$pkgver.src/LICENSE.TXT" \
    "$pkgdir${_prefix}/share/licenses/llvm-libs/LICENSE"
}

package_llvm37-ocaml-split() {
  pkgdesc="OCaml bindings for LLVM (installed in ${_prefix})"
  depends=("llvm37-split=$pkgver-$pkgrel" "ocaml=$_ocaml_ver" 'ocaml-ctypes')

  cd "$srcdir/llvm-$pkgver.src"

  install -d "$pkgdir${_prefix}"/{lib,share/doc}
  cp -a "$srcdir/ocaml.lib" "$pkgdir${_prefix}/lib/ocaml"
  cp -a "$srcdir/ocaml.doc" "$pkgdir${_prefix}/share/doc/$pkgname"

  install -Dm644 LICENSE.TXT "$pkgdir${_prefix}/share/licenses/llvm-ocaml/LICENSE"
}

package_lldb37-split() {
  pkgdesc="Next generation, high-performance debugger (installed in ${_prefix})"
  url="http://lldb.llvm.org/"
  depends=('libedit' 'libxml2' 'python2')

  cd "$srcdir/llvm-$pkgver.src"

  make -C build/tools/lldb DESTDIR="$pkgdir" install

  # Compile Python scripts
  python2 -m compileall "$pkgdir${_prefix}/lib/python2.7/site-packages/lldb"
  python2 -O -m compileall "$pkgdir${_prefix}/lib/python2.7/site-packages/lldb"

  install -Dm644 tools/lldb/LICENSE.TXT "$pkgdir${_prefix}/share/licenses/lldb/LICENSE"
}

package_clang37-split() {
  pkgdesc="C language family frontend for LLVM (installed in ${_prefix})"
  url="http://clang.llvm.org/"
  depends=("llvm37-libs-split=$pkgver-$pkgrel" 'gcc')
  optdepends=('python2: for git-clang-format')

  cd "$srcdir/llvm-$pkgver.src"

  make -C build/tools/clang DESTDIR="$pkgdir" install
  make -C build/projects/compiler-rt DESTDIR="$pkgdir" install

  # Remove documentation sources
  rm -r "$pkgdir"${_prefix}/share/doc/clang/html/{_sources,.buildinfo}

  # Install Python bindings
  install -d "$pkgdir${_prefix}/lib/python2.7/site-packages"
  cp -a tools/clang/bindings/python/clang "$pkgdir${_prefix}/lib/python2.7/site-packages/"
  python2 -m compileall "$pkgdir${_prefix}/lib/python2.7/site-packages/clang"
  python2 -O -m compileall "$pkgdir${_prefix}/lib/python2.7/site-packages/clang"

  # Use Python 2
  sed -i 's|/usr/bin/env python|&2|' \
    "$pkgdir${_prefix}/bin/git-clang-format" \
    "$pkgdir${_prefix}/share/clang/clang-format-diff.py"

  install -Dm644 tools/clang/LICENSE.TXT \
    "$pkgdir${_prefix}/share/licenses/clang/LICENSE"
}

package_clang37-analyzer-split() {
  pkgdesc="A source code analysis framework (installed in ${_prefix})"
  url="http://clang-analyzer.llvm.org/"
  depends=("clang37-split=$pkgver-$pkgrel" 'python2')

  cd "$srcdir/llvm-$pkgver.src/tools/clang"

  install -d "$pkgdir"${_prefix}/{bin,lib/clang-analyzer}
  for _tool in scan-{build,view}; do
    cp -a tools/$_tool "$pkgdir${_prefix}/lib/clang-analyzer/"
    ln -s ${_prefix}/lib/clang-analyzer/$_tool/$_tool "$pkgdir${_prefix}/bin/"
  done

  # scan-build looks for clang within the same directory
  ln -s ${_prefix}/bin/clang "$pkgdir${_prefix}/lib/clang-analyzer/scan-build/"

  # Relocate man page
  install -d "$pkgdir${_prefix}/share/man/man1"
  mv "$pkgdir${_prefix}/lib/clang-analyzer/scan-build/scan-build.1" \
    "$pkgdir${_prefix}/share/man/man1/"

  # Use Python 2
  sed -i \
    -e 's|env python$|&2|' \
    -e 's|/usr/bin/python$|&2|' \
    "$pkgdir${_prefix}/lib/clang-analyzer/scan-view/scan-view" \
    "$pkgdir${_prefix}/lib/clang-analyzer/scan-build/set-xcode-analyzer"

  # Compile Python scripts
  python2 -m compileall "$pkgdir${_prefix}/lib/clang-analyzer"
  python2 -O -m compileall "$pkgdir${_prefix}/lib/clang-analyzer"

  install -Dm644 LICENSE.TXT "$pkgdir${_prefix}/share/licenses/clang-analyzer/LICENSE"
}

package_clang37-tools-extra-split() {
  pkgdesc="Extra tools built using Clang's tooling APIs (installed in ${_prefix})"
  url="http://clang.llvm.org/"
  depends=("clang37-split=$pkgver-$pkgrel")

  cd "$srcdir/llvm-$pkgver.src"

  make -C build/tools/clang/tools/extra DESTDIR="$pkgdir" install

  # Use Python 2
  sed -i \
    -e 's|env python$|&2|' \
    -e 's|/usr/bin/python$|&2|' \
    "$pkgdir"${_prefix}/share/clang/{clang-tidy-diff,run-clang-tidy}.py

  install -Dm644 tools/clang/tools/extra/LICENSE.TXT \
    "$pkgdir${_prefix}/share/licenses/clang-tools-extra/LICENSE"
}

# vim:set ts=2 sw=2 et:
