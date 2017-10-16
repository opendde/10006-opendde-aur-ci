# Maintainer: Adam Isaac <aci747@engineer.com>
pkgname=tldr-bash-git
pkgver=r74.fa141b6
pkgrel=1
pkgdesc="Bash client for tldr: community driven man-by-example."
arch=('any')
url="https://github.com/pepa65/tldr-bash-client"
source=("git+https://github.com/pepa65/tldr-bash-client.git")
license=('GPL')
sha256sums=('SKIP')
depends=('bash' 'unzip' 'curl')
makedepends=('git')

pkgver() {
  cd tldr-bash-client
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd tldr-bash-client
  install -Dm755 tldr "$pkgdir/usr/bin/tldr"

} 
