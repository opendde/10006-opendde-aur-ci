# Maintainer: Peter Trotman <petertrotman+aur@gmail.com>
# URL: https://github.com/kubernetes/minikube
# Upstream: https://github.com/kubernetes/minikube

pkgname=('minikube-git')
pkgver=v0.25.0.r96.ga000c35e1
pkgrel=1
pkgdesc='Minikube is a tool that makes it easy to run Kubernetes locally.'
arch=('x86_64')
url='https://github.com/kubernetes/minikube'
license=('apache')
depends=('glibc')
optdepends=(
    'kubectl-bin: to manage the cluster'
    'virtualbox'
    'docker-machine-driver-kvm2'
)
makedepends=('git' 'go' 'make')
provides=('minikube')
conflicts=('minikube')
source=("$pkgname::git+https://github.com/kubernetes/minikube.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    rm -rf "$srcdir/src"
    mkdir -p "$srcdir/src/k8s.io"
    cp -r "$srcdir/$pkgname" "$srcdir/src/k8s.io"
    mv "$srcdir/src/k8s.io/$pkgname" "$srcdir/src/k8s.io/minikube"
}

build() {
    export GOPATH="$srcdir"
    cd "$GOPATH/src/k8s.io/minikube"
    make
}

package() {
    install -Dm755 "$srcdir/src/k8s.io/minikube/out/minikube" "$pkgdir/usr/bin/minikube"
    install -Dm644 "$srcdir/src/k8s.io/minikube/LICENSE" "$pkgdir/usr/share/licenses/minikube/LICENSE"
}
