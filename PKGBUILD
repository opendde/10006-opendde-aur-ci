# Maintainer: Tom Wadley <tom@tomwadley.net>

pkgname=nvm-git
pkgver=0.33.2.r0.g0a95e77
pkgrel=1
pkgdesc="Node Version Manager - Simple bash script to manage multiple active node.js versions (git sources)"
url="https://github.com/creationix/nvm"
arch=('any')
license=('MIT')
optdepends=('bash: bash completion')
makedepends=('git')
conflicts=('nvm')
provides=('nvm')
install="${pkgname}.install"
source=("$pkgname::git+https://github.com/creationix/nvm.git"
        "init-nvm.sh"
        "install-nvm-exec")
md5sums=('SKIP'
         'b75a15a2cbe04e6203ebaf6103e90926'
         '8f3c5b82f09636e9cf82d45d68c39cc6')

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "${srcdir}"

  # convenience script
  install -Dm644 init-nvm.sh "$pkgdir/usr/share/nvm/init-nvm.sh"

  # companion script which installs nvm-exec in NVM_DIR where upstream expects it
  install -Dm644 install-nvm-exec "$pkgdir/usr/share/nvm/install-nvm-exec"

  cd "${pkgname}"

  # nvm itself
  install -Dm644 nvm.sh "$pkgdir/usr/share/nvm/nvm.sh"

  # nvm-exec script for 'nvm exec' command
  install -Dm755 nvm-exec "$pkgdir/usr/share/nvm/nvm-exec"

  # bash completion
  install -Dm644 bash_completion "$pkgdir/usr/share/nvm/bash_completion"

  # license
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/nvm/LICENSE.md"
}

# vim:set ts=2 sw=2 et:
