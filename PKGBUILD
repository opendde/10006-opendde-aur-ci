# See https://wiki.archlinux.org/index.php/Java_package_guidelines
pkgname=sentry-cli-bin
pkgdesc="A command-line utility to work with sentry.io"
pkgver=1.65.0
pkgrel=1
arch=('x86_64')
url='https://github.com/getsentry/sentry-cli'
source=(
  "$pkgname-$pkgver::https://github.com/getsentry/sentry-cli/releases/download/$pkgver/sentry-cli-Linux-x86_64"
)
sha256sums=('95d27ee9e29ad95677bd71dca20c8e3d6369631d0495717b5d2a66be45d6a12d')

package () {
  install -Dm755 "${srcdir}/$pkgname-$pkgver" "$pkgdir/usr/bin/sentry-cli"
}
