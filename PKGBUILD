# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>
# Contributor: staletic
# Contributor: James Brink <brink.james@gmail.com>
# Contributor: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: p <parimal@beyond8labs.com>
# Contributor: Victor <victor@xirion.net>
# Contributor: Jan-Tarek Butt <tarek AT ring0 DOT de>
# Contributor: Erik Beran <eberan AT gmail DOT com>
# Contributor: Thor K. H. <thor at roht dot no>
# Contributor: Babken Vardanyan <483ken 4tgma1l
# Contributor: mikezackles
# Contributor: z33ky
# Contributor: stykr
# Contributor: Svenstaro
# Contributor: KaiSforza
# Contributor: Simon Gomizelj <simongmzlj@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: shmilee
# Contributor: foobster
# Contributor: archdria
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: edacval
# Contributor: MarcelPa
# Contributor: Trent
# Contributor: urxvtcd-256

_gocode="y"
_typescript="y" # If you enable both typescript and tern it will defaul to typescript.
_tern="n"       # Tern seems abandoned - consider moving to TSserver above (see project page)
_java="y"

_use_system_clang="ON"
_neovim="$NEOVIM_YOUCOMPLETEME"

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgname=vim-youcompleteme-git
pkgver=r2774.4496153a
pkgrel=1
pkgdesc='A code-completion engine for Vim'
arch=('x86_64')
url='https://ycm-core.github.io/YouCompleteMe/'
license=('GPL3')
groups=('vim-plugins')
depends=('vim' 'python>=3.6' 'python-watchdog' 'python-requests' 'python-requests-futures'
  'python-bottle' 'python-waitress' 'clang>=11.0')
makedepends=('git' 'cmake' 'pybind11')
optdepends=(
  'gopls: Go semantic completion'
  'nodejs-tern: JavaScript semantic completion'
  'rust-analyzer: Rust semantic completion'
  'typescript: Typescript semantic completion'
  'python-jedi: Python semantic completion'
  'python-numpydoc: Python semantic completion'
  'python-regex: Better Unicode support'
  'omnisharp-roslyn: C# semantic completion'
  'java-environment>=11: Java semantic completion'
  'jdtls: Java semantic completion')
source=(git+https://github.com/ycm-core/YouCompleteMe.git
        git+https://github.com/ycm-core/ycmd.git)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}"/YouCompleteMe || exit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"/YouCompleteMe || exit
  git submodule init third_party/ycmd
  git config submodule.third_party/ycmd.url "${srcdir}/ycmd"
  git submodule update

  # NOTE: Arch package for pybind11 2.6.0 doesn't ship headers
  # Force system headers/libs
  rm -rf "${srcdir}"/ycmd/cpp/llvm || exit

  if [[ "$_gocode" == "y" ]]; then
    sed -e "s/\(gopls_binary_path\":\).*\$/\1 \"\/usr\/bin\/gopls\",/" \
        -i "${srcdir}"/ycmd/ycmd/default_settings.json
  fi

  if [[ "$_typescript" == "y" ]]; then
    rm -rf "${srcdir}/YouCompleteMe/third_party/ycmd/third_party/tern_runtime" || exit
    sed -e "s/\(tsserver_binary_path\":\).*\$/\1 \"\/usr\/bin\/tsserver\",/" \
        -i "${srcdir}"/ycmd/ycmd/default_settings.json
  fi
  if [[ "$_java" == "y" ]]; then
    sed -e "s/\(java_jdtls_workspace_root_path\":\).*\$/\1 \"\/tmp\",/" \
        -e "s/\(java_binary_path\":\).*\$/\1 \"\/usr\/bin\/java\"/" \
        -i "${srcdir}"/ycmd/ycmd/default_settings.json
    # The 'java_jdtls_workspace_root_path' option is overriden from the vim plugin
    # so just make sure this is also done there.
    sed -e "s/\(ycm_java_jdtls_workspace_root_path',\).*\$/\1 '\/tmp' )/" \
        -i "${srcdir}"/YouCompleteMe/plugin/youcompleteme.vim
  fi

  sed -e "s/\(clangd_binary_path\":\).*\$/\1 \"\/usr\/bin\/clangd\",/" \
      -e "s/\(rust_toolchain_root\":\).*\$/\1 \"\/usr\",/" \
      -e "s/\(roslyn_binary_path\":\).*\$/\1 \"\/opt\/omnisharp-roslyn\/OmniSharp.exe\",/" \
      -e "s/\(mono_binary_path\":\).*\$/\1 \"\/usr\/bin\/mono\",/" \
      -i "${srcdir}"/ycmd/ycmd/default_settings.json
}

build() {
  mkdir -p "${srcdir}"/ycmd_build
  cd "${srcdir}"/ycmd_build || exit

  cmake \
    -DUSE_CLANG_COMPLETER=${_use_system_clang} \
    -DUSE_SYSTEM_LIBCLANG=${_use_system_clang} \
    ../YouCompleteMe/third_party/ycmd/cpp

  make ycm_core
}

package() {
  pkg_ycmd_dir="${pkgdir}/usr/share/vim/vimfiles/third_party/ycmd"

  cd "${srcdir}"/YouCompleteMe || exit
  install -Ddm755 "${pkg_ycmd_dir}"

  cp -dr --no-preserve=ownership autoload doc plugin python "${pkgdir}/usr/share/vim/vimfiles"
  cp -dr --no-preserve=ownership third_party/ycmd/{ycmd,ycm_core.so,CORE_VERSION} "${pkg_ycmd_dir}"

  if [[ ${_use_system_clang} == "ON" ]]; then
    install -Ddm755 "${pkg_ycmd_dir}/third_party/clang/lib/"
    ln -s /usr/lib/libclang.so "${pkg_ycmd_dir}/third_party/clang/lib/libclang.so"
    ln -s /usr/lib/clang "${pkg_ycmd_dir}/third_party/clang/lib/clang"
  fi

  if [[ "$_java" == "y" ]]; then
    install -Ddm755 "${pkg_ycmd_dir}/third_party/eclipse.jdt.ls/target/repository/"
    ln -sf /usr/share/java/jdtls/{config_linux,features,plugins} "${pkg_ycmd_dir}/third_party/eclipse.jdt.ls/target/repository/"
  fi

  if [[ ${_tern} == "ON" ]]; then
    install -Ddm755 "${pkg_ycmd_dir}/third_party/tern_runtime/node_modules/"
    ln -s /usr/lib/node_modules/tern "${pkg_ycmd_dir}/third_party/tern_runtime/node_modules/"
  fi

  find "${pkgdir}" \( -name .git -or -name 'test*' -or -name 'run_tests.py' \) -exec rm -fr {} +

  python -m compileall -d /usr/share/vim/vimfiles "${pkgdir}/usr/share/vim/vimfiles"
  python -O -m compileall -d /usr/share/vim/vimfiles "${pkgdir}/usr/share/vim/vimfiles"
}
