# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=python-rtoml
pkgver=0.9
pkgrel=2
pkgdesc="A better TOML library for python implemented in rust."
arch=('x86_64')
url="https://pypi.org/project/rtoml"
license=('MIT')
depends=(python)
makedepends=(cargo maturin python-installer)
source=("$pkgname-$pkgver.tar.gz::https://github.com/samuelcolvin/rtoml/archive/v$pkgver.tar.gz")
sha256sums=('cd144132022e8847e16242a8d4f81abeef793dd236b993e0adaa07700b1b593c')
b2sums=('473479dbff92e6d5545183e443d422fa9fb5b6722d6e5912d5dd65cb2c0f53b16cbe12639f8cf3e3a581c71bbaeb71622d1e8aa8028de40d656f66ebd8a7778f')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "rtoml-$pkgver"

  cargo fetch --locked
}

build() {
  cd "rtoml-$pkgver"

  CFLAGS="$CFLAGS -fPIC" \
    maturin build --frozen --release
}

package() {
  cd "rtoml-$pkgver"

  python -m installer --destdir="$pkgdir" target/wheels/*.whl
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
