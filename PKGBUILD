# Maintainer: K_Lar <zan.sprogar@gmail.com>
pkgname=brem
pkgver=1.1
pkgrel=1
pkgdesc="basic notes/reminders management program that's written in POSIX sh"
arch=('any')
url="https://gitlab.com/k_lar/$pkgname"
license=('MIT')
provides=("$pkgname")
conflicts=('brem-git')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('b025ed4c0a75da64928cf2227b7aae436dedd35ed9a0f484c9e04564c7709d8b')

package() {
    cd "$srcdir/$pkgname-v$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm644 "$srcdir/$pkgname-v$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
