# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Marcin Mielniczuk <marmistrz dot dev at zoho dot eu>
_backend=openmpi
pkgname=ampi-${_backend}
pkgver=6.10.2
pkgrel=1
pkgdesc="Adaptive Message Passing Interface, OpenMPI backend"
arch=('x86_64')
license=('custom:Charm++/Converse License')
url="http://charm.cs.uiuc.edu/research/ampi/"
depends=('openmpi')
makedepends=('gcc-fortran')
source=("http://charm.cs.illinois.edu/distrib/charm-${pkgver}.tar.gz")
sha512sums=('0c452636ca753387c17c077f994194fea93043673d0db5ff12671184fd2a937167bddcd882ad84b4719e295415aabe9040c28dcc4c215e0b3aaeb8101efbb8cb')

build() {
  cd "charm-v${pkgver}"
  ./build AMPI mpi-linux-$CARCH --with-production
}

package() {
  cd "charm-v${pkgver}"
  make -C tmp install DESTDIR="${pkgdir}/opt/ampi-${_backend}"
  # Workaround https://github.com/UIUC-PPL/charm/issues/2275
  for wrapper in ampicc ampiCC ampicxx; do
    f="${pkgdir}/opt/ampi-${_backend}/bin/$wrapper"
    echo "Patching $f"
    sed -i 's|charmarch=$(cat $CHARMBIN/../tmp/.gdir)|charmarch=mpi|g' "$f"
  done
}
