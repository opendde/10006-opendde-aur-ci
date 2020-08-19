# Maintainer: Daniel Bertalan <dani@danielbertalan.dev>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Florian Walch <florian+aur@fwalch.com>
# Contributor: Florian Hahn <flo@fhahn.com>


pkgname=neovim-nightly-git
# Upstream uses the upcoming version number; TODO: automate
_base_version=0.5.0
pkgver=0.5.0.r634.g161cdba1e
pkgrel=1
pkgdesc='Fork of Vim aiming to improve user experience, plugins, and GUIs (pre-release build)'
arch=('x86_64')
url='https://neovim.io'
backup=('etc/xdg/nvim/sysinit.vim')
license=('custom:neovim')
depends=('libtermkey' 'libuv' 'msgpack-c' 'unibilium' 'libvterm' 'luajit' 'libluv')
makedepends=('cmake' 'ninja' 'lua51-mpack' 'lua51-lpeg' 'gperf')
optdepends=('python-neovim: for Python 3 plugin support (see :help python)'
            'xclip: for clipboard support on X11 (or xsel) (see :help clipboard)'
            'xsel: for clipboard support on X11 (or xclip) (see :help clipboard)'
            'wl-clipboard: for clipboard support on wayland (see :help clipboard)')
source=("${pkgname}::git+https://github.com/neovim/neovim.git#tag=nightly")
sha256sums=('SKIP')
provides=("neovim=${_base_version}", "vim-plugin-runtime")
conflicts=('neovim')
options=(!strip)

pkgver() {
  cd "${pkgname}"
  _git_version_stamp=$(git describe --long --first-parent nightly | sed 's/[^-]*-//;s/\([^-]*-g\)/r\1/;s/-/./g')
  echo "${_base_version}.${_git_version_stamp}"
}

build() {
  cmake -S"${pkgname}" -Bbuild -GNinja \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

check() {
  cd "${srcdir}/build"
  ./bin/nvim --version
  ./bin/nvim --headless -u NONE -i NONE -c ':quit'
}

package() {
  cd "${srcdir}/build"
  DESTDIR="${pkgdir}" cmake --build . --target install

  cd "${srcdir}/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 runtime/nvim.desktop "${pkgdir}/usr/share/applications/nvim.desktop"
  install -Dm644 runtime/nvim.png "${pkgdir}/usr/share/pixmaps/nvim.png"

  # Make Arch vim packages work
  mkdir -p "${pkgdir}"/etc/xdg/nvim
  echo "\" This line makes pacman-installed global Arch Linux vim packages work." > "${pkgdir}"/etc/xdg/nvim/sysinit.vim
  echo "source /usr/share/nvim/archlinux.vim" >> "${pkgdir}"/etc/xdg/nvim/sysinit.vim

  mkdir -p "${pkgdir}"/usr/share/vim
  echo "set runtimepath+=/usr/share/vim/vimfiles" > "${pkgdir}"/usr/share/nvim/archlinux.vim
}

# vim:set sw=2 sts=2 et:
