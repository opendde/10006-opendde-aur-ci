pkgname=origin-client
pkgdesc="Openshift client binary"
pkgver=3.11.0
pkgrel=2
arch=('x86_64')
url="https://github.com/openshift/origin"
license=('Apache')
makedepends=('go' 'rsync')
validpgpkeys=('0E2CFB1B72F087ACF089B41E3D16906B4F1C5CB3')  # Clayton Coleman (Red Hat key) <ccoleman@redhat.com>
source=("git+https://github.com/openshift/origin#tag=v${pkgver}?signed")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/origin"

  # Fix zsh completion
  sed -i 's/kubectl/oc/g' contrib/completions/zsh/oc

  make WHAT=cmd/oc
  hack/generate-docs.sh
}

package() {
  cd "${srcdir}/origin"
  install -Dm755 _output/local/bin/linux/amd64/oc -t "$pkgdir/usr/bin"
  install -Dm644 docs/man/man1/* -t "$pkgdir/usr/share/man/man1"

  install -Dm644 contrib/completions/bash/oc "$pkgdir/usr/share/bash-completion/completions/oc"
  install -Dm644 contrib/completions/zsh/oc "$pkgdir/usr/share/zsh/site-functions/_oc"
}
