# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Johannes Löthberg < johannes at kyriasis dot com >
# Contributor: Alexander F Rødseth < xyproto at archlinux dot org >
# Contributor: Daniel Micay < danielmicay at gmail dot com >
# Contributor: userwithuid < userwithuid at gmail dot com >

_pkgname=rust
_date=2020-10-08
_rustc=1.47.0
_cargo=0.48.0

pkgname=mingw-w64-rust
_prefix=opt/rust
pkgver=1.48.0
pkgrel=1
pkgdesc="Systems programming language focused on safety, speed and concurrency (mingw-w64)"
arch=('x86_64')
url="https://www.rust-lang.org"
license=('MIT' 'Apache' 'custom')
depends=('gcc-libs'
         'curl'
         'libgit2'
         'mingw-w64-gcc>=10.1.0')
optdepends=('mingw-w64-wine: for cargo test support')
makedepends=('gdb'
             'ninja'
             'libffi'
             'perl'
             'python'
             'nodejs'
             'procps-ng'
             'cmake')
options=('!strip' 'staticlibs' '!buildflags')
source=("https://static.rust-lang.org/dist/rustc-${pkgver}-src.tar.xz"{,.asc}
        "https://static.rust-lang.org/dist/${_date}/rust-std-${_rustc}-x86_64-unknown-linux-gnu.tar.xz"{,.asc}
        "https://static.rust-lang.org/dist/${_date}/rustc-${_rustc}-x86_64-unknown-linux-gnu.tar.xz"{,.asc}
        "https://static.rust-lang.org/dist/${_date}/cargo-${_cargo}-x86_64-unknown-linux-gnu.tar.xz"{,.asc}
        "mingw-config.toml")
noextract=("rust-std-${_rustc}-x86_64-unknown-linux-gnu.tar.xz"
           "rustc-${_rustc}-x86_64-unknown-linux-gnu.tar.xz"
           "cargo-${_cargo}-x86_64-unknown-linux-gnu.tar.xz")
sha256sums=('ff0a242392a1865d7b2d08eb5ca6c1b3fd0820741d4c13a51a4b2d5d2bb53908'
            'SKIP'
            'a469db59f7df3a5e4003421d853b274e828b537d2d56fd5ce6bba8ba73266f02'
            'SKIP'
            '6effe67c3461335eabba2334f4747260bd479c938e635899a60ed094beec7481'
            'SKIP'
            '6958f9797b7acacb708423c61f5e8b23c63d9e96fdc7c07fdb0a3feafeaf27e9'
            'SKIP'
            '4d59d264afca077ff6a77564ad9027ada0f48975f8801d1024749f47b5efb906')
validpgpkeys=('108F66205EAEB0AAA8DD5E1C85AB96E6FA1BE5FE') # Rust Language (Tag and Release Signing Key) <rust-key@rust-lang.org>

backup=("opt/rust/cargo/config")

prepare() {
  cd "rustc-${pkgver}-src"

  cp "${srcdir}"/mingw-config.toml config.toml
  sed -i "s|\@PREFIX\@|/${_prefix}|" config.toml
  # use level 0 to speed up xz packaging
  sed -i 's|.preset(6)|.preset(0)|' "src/tools/rust-installer/src/tarballer.rs"

  cd "${srcdir}"
  mkdir -p "${srcdir}/rustc-${pkgver}-src/build/cache/${_date}"
  cp rust-std-${_rustc}-x86_64-unknown-linux-gnu.tar.xz "rustc-${pkgver}-src/build/cache/${_date}"
  cp rustc-${_rustc}-x86_64-unknown-linux-gnu.tar.xz "rustc-${pkgver}-src/build/cache/${_date}"
  cp cargo-${_cargo}-x86_64-unknown-linux-gnu.tar.xz "rustc-${pkgver}-src/build/cache/${_date}"
}

build() {
  cd "rustc-${pkgver}-src"

  export CFLAGS="-O2 -pipe -fno-plt -Wall -D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  export CXXFLAGS="-O2 -pipe -fno-plt -Wall -D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  python ./x.py build
}

package() {
  cd "rustc-${pkgver}-src"

  # rust will build install tools there
  export CFLAGS="-O2 -pipe -fno-plt -Wall -D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  export CXXFLAGS="-O2 -pipe -fno-plt -Wall -D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
  # TODO: find a way to disable packaging
  DESTDIR="${pkgdir}" python ./x.py install --keep-stage 0 --keep-stage 1

  # license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"{rust,cargo}
  mv "${pkgdir}"/${_prefix}/share/doc/rust/LICENSE-*.old "${pkgdir}/usr/share/licenses/${pkgname}/cargo/"
  rename '.old' '' "${pkgdir}/usr/share/licenses/${pkgname}/cargo/"*
  mv "${pkgdir}"/${_prefix}/share/doc/rust/{LICENSE-*,COPYRIGHT} "${pkgdir}/usr/share/licenses/${pkgname}/rust/"

  # remove unused files
  rm -r "${pkgdir}/etc/"
  rm -r "${pkgdir}/${_prefix}/share"
  rm "${pkgdir}/${_prefix}/lib/rustlib/"{manifest-*,install.log,uninstall.sh,components,rust-installer-version}

  # link shared libraries
  pushd "${pkgdir}/${_prefix}/lib"
  ln -sf "rustlib/x86_64-unknown-linux-gnu/lib/"*.so .
  popd
  install -dm755 "${pkgdir}/usr/i686-w64-mingw32/bin" && pushd "${pkgdir}/usr/i686-w64-mingw32/bin"
  ln -sf "../../../${_prefix}/lib/rustlib/i686-pc-windows-gnu/lib/"*.dll .
  popd
  install -dm755 "${pkgdir}/usr/x86_64-w64-mingw32/bin" && pushd "${pkgdir}/usr/x86_64-w64-mingw32/bin"
  ln -sf "../../../${_prefix}/lib/rustlib/x86_64-pc-windows-gnu/lib/"*.dll .
  popd

  # strip
  strip --strip-all "${pkgdir}/${_prefix}/bin/"{cargo,rustc,rustdoc}
  strip --strip-all "${pkgdir}/${_prefix}/lib/rustlib/x86_64-unknown-linux-gnu/bin/"rust-lld
  strip --strip-unneeded "${pkgdir}/${_prefix}/lib/librustc"*.so
  strip --strip-unneeded "${pkgdir}/${_prefix}/lib/rustlib/x86_64-unknown-linux-gnu/lib/"*.so
  i686-w64-mingw32-strip --strip-unneeded "${pkgdir}/${_prefix}/lib/rustlib/i686-pc-windows-gnu/lib/"*.dll
  x86_64-w64-mingw32-strip --strip-unneeded "${pkgdir}/${_prefix}/lib/rustlib/x86_64-pc-windows-gnu/lib/"*.dll

  # config
  install -dm777 "${pkgdir}/opt/rust/cargo"
  cat << EOF >> "${pkgdir}/opt/rust/cargo/config"
[target.i686-pc-windows-gnu]
linker = "/usr/bin/i686-w64-mingw32-gcc"
ar = "/usr/i686-w64-mingw32/bin/ar"
EOF
  if pacman -T "mingw-w64-wine" ; then
    cat << EOF >> "${pkgdir}/opt/rust/cargo/config"
runner = "/usr/bin/i686-w64-mingw32-wine"
EOF
  fi
  cat << EOF >> "${pkgdir}/opt/rust/cargo/config"
rustflags = [
            ]

EOF

  cat << EOF >> "${pkgdir}/opt/rust/cargo/config"
[target.x86_64-pc-windows-gnu]
linker = "/usr/bin/x86_64-w64-mingw32-gcc"
ar = "/usr/x86_64-w64-mingw32/bin/ar"
EOF
  if pacman -T "mingw-w64-wine" ; then
    cat << EOF >> "${pkgdir}/opt/rust/cargo/config"
runner = "/usr/bin/x86_64-w64-mingw32-wine"
EOF
  fi
  cat << EOF >> "${pkgdir}/opt/rust/cargo/config"
rustflags = [
            ]

EOF
}

# vim:set ts=2 sw=2 et:
