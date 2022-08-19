# Maintainer: Maroš Grego <maros@grego.site>
pkgname=caretaker-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="A simple, configurable filesystem watcher"
url="https://github.com/grego/caretaker"
license=("MIT")
arch=("x86_64")
provides=("caretaker")
options=("strip")
source=("https://github.com/grego/caretaker/releases/download/v$pkgver/caretaker-$pkgver-x86_64.tar.gz")
sha256sums=("95a84b77f60c12e89ea95d8e36e90b32313d86e207adfc2de6d92f8ae115bf7a")

package() {
    install -Dm755 caretaker -t "$pkgdir/usr/bin/"
}
