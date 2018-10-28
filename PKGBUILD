# Contributor: Daniel Miranda (dmiranda)
# Contributor: Fabio ‘Lolix’ Loli <lolix at disroot dot org>
# Contributor: Jonathon <jonathonf>
# Maintainer: Gustavo Costa (gusbemacbe)

pkgname=suru-plus-git
pkgver=20.3.2             
pkgrel=1
pkgdesc="Suru++ 20 — A cyberpunk, elegant, futuristic and modern third-party icons theme!"
arch=('any')
url="https://github.com/gusbemacbe/${pkgname/-git/}"
license=('GPL3')
changelog=CHANGELOG
makedepends=('git')
conflicts=(${pkgname/-git/})
provides=(${pkgname/-git/})
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() 
{
    git -C ${pkgname/-git/} describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() 
{
    make -C ${pkgname/-git/} PREFIX="$pkgdir"/usr install
}
