# Maintainer: Alex J. Malozemoff <amaloz@galois.com>
pkgname=matterhorn-git
_pkgname=matterhorn
pkgver=50200.1.0
pkgver() {
  cd ${_pkgname}
  git describe --long --tags | cut -d- -f1
}
pkgrel=1
pkgdesc='A terminal-based chat client for MatterMost'
arch=('x86_64')
url="https://github.com/matterhorn-chat/matterhorn"
license=('BSD')
depends=('gmp' 'zlib')
makedepends=('git' 'cabal-install' 'ghc8.2')
source=("git+https://github.com/matterhorn-chat/matterhorn.git")
sha1sums=('SKIP')
provides=('matterhorn-git')
conflicts=('matterhorn' 'matterhorn-bin')

build() {
  cd ${srcdir}/${_pkgname}
  git submodule update --init
  cabal new-update
  cabal new-build -w /usr/bin/ghc-8.2
}

package() {
  cd ${srcdir}/${_pkgname}
  install -m755 -D $(find . -name ${_pkgname} -type f | head -1) ${pkgdir}/usr/bin/matterhorn
  install -m644 -D LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
