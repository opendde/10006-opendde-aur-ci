# Maintainer: bluebugs < cedric dot bail at free dot fr >
pkgname=ganache-cli
pkgver=6.8.1
pkgrel=1
pkgdesc='Personal blockchain for Ethereum development.'
url='https://github.com/trufflesuite/ganache-cli'
arch=('any')
license=('MIT')
source=("https://registry.npmjs.org/ganache-cli/-/ganache-cli-${pkgver}.tgz")
noextract=("ganache-cli-${pkgver}.tgz")
makedepends=('npm')
depends=('nodejs')
conflicts=('ganache-cli-git')
sha1sums=('SKIP')
provides=('ganache-cli')
optdepends=('mocha: testing support'
            'testrpc: testing support'
            'geth: contract deployment'
            'parity: contract deployment')

package() {
  npm install -g --production --prefix "$pkgdir/usr" "ganache-cli-${pkgver}.tgz"
  tar -xf "ganache-cli-${pkgver}.tgz" package/LICENSE
  install -D -m644 package/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
