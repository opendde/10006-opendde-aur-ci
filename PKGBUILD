# Maintainer: Paramjit Singh <contact at paramjit dot org>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

pkgname=playwright
pkgver=1.27.0
pkgrel=1
pkgdesc="Node.js library to automate Chromium, Firefox and WebKit with a single API"
arch=('any')
url="https://playwright.dev"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tar.gz")
sha512sums=('17ed3ed110f4dcb4be29d34030ca7adce073bbe3706182dde76a4a2dccee4a54ec5796ff48b914a0d8527f30c59e01053ae44bda09342e57c65b798a894064eb')

package() {
  local NPM_FLAGS=(--no-audit --no-fund --no-update-notifier)
  npm install \
    --global \
     --prefix "$pkgdir/usr" \
     "${NPM_FLAGS[@]}" \
    "$pkgname-$pkgver.tar.gz"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
