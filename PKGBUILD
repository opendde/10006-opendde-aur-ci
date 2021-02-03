# Maintainer: Morgan <morganamilo@archlinux.org>
pkgname=paru-git
_pkgname=paru
pkgver=1.2.2.r0.g19882b7
pkgrel=1
pkgdesc='AUR helper based on yay'
url='https://github.com/morganamilo/paru'
source=("git+https://github.com/morganamilo/paru")
backup=("etc/paru.conf")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('GPL3')
makedepends=('cargo')
depends=('git' 'pacman')
optdepends=('asp: downloading repo pkgbuilds' 'bat: colored pkgbuild printing')
conflicts=('paru')
provides=('paru')
sha256sums=(SKIP)

build () {
  cd "$srcdir/$_pkgname"

  if pacman -T pacman-git > /dev/null || pacman -T 'pacman>6.0.0alpha' > /dev/null; then
    _features+="git,"
  fi

  if [[ $(rustc -V) == *"nightly"* ]]; then
    _features+="backtrace,"
  fi

  PARU_VERSION=$pkgver cargo build --locked --features "${_features:-}" --release --target-dir target
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 target/release/paru "${pkgdir}/usr/bin/paru"
  install -Dm644 paru.conf "${pkgdir}/etc/paru.conf"

  install -Dm644 man/paru.8 "$pkgdir/usr/share/man/man8/paru.8"
  install -Dm644 man/paru.conf.5 "$pkgdir/usr/share/man/man5/paru.conf.5"

  install -Dm644 completions/bash "${pkgdir}/usr/share/bash-completion/completions/paru.bash"
  install -Dm644 completions/fish "${pkgdir}/usr/share/fish/vendor_completions.d/paru.fish"
  install -Dm644 completions/zsh "${pkgdir}/usr/share/zsh/site-functions/_paru"
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
