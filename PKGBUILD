# Maintainer: Alec Mev <alec@mev.earth>

pkgname=asdf-vm
pkgver=0.8.0
pkgrel=1
pkgdesc='Extendable version manager with support for Ruby, Node.js, Elixir, Erlang & more'
arch=('any')
url='https://asdf-vm.com'
license=('MIT')
depends=(
  'autoconf'
  'automake'
  'libffi'
  'libtool'
  'libxslt'
  'libyaml'
  'ncurses'
  'openssl'
  'readline'
  'unixodbc'
)
optdepends=(
  'bash-completion: For completions to work in Bash'
  'unzip: Needed by some plugins, like Elixir'
)
install=asdf-vm.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/asdf-vm/asdf/archive/v${pkgver}.tar.gz")
sha256sums=('9b667ca135c194f38d823c62cc0dc3dbe00d7a9f60caa0c06ecb3047944eadfa')

package() {
  cd "asdf-${pkgver}"

  local dst="${pkgdir}/opt/${pkgname}"
  mkdir -p "${dst}"

  cp -r bin       "${dst}"
  cp -r lib       "${dst}"
  cp    asdf.fish "${dst}"
  cp    asdf.sh   "${dst}"
  cp    defaults  "${dst}"
  cp    help.txt  "${dst}"
  cp    LICENSE   "${dst}"
  cp    VERSION   "${dst}"

  local usrshare="${pkgdir}/usr/share"
  local docdir="${usrshare}/doc/${pkgname}"
  mkdir -p "${docdir}"

  cp docs/[^_]*.md "${docdir}"
  cp help.txt      "${docdir}"
  cp README.md     "${docdir}"

  install -Dm644 -t "${usrshare}/licenses/${pkgname}/" LICENSE

  cd completions

  install -Dm644 asdf.bash "${usrshare}/bash-completion/completions/asdf"
  install -Dm644 asdf.fish "${usrshare}/fish/vendor_completions.d/asdf.fish"
  install -Dm644 _asdf     "${usrshare}/zsh/site-functions/_asdf"
}
