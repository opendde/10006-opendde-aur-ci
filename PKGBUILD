# PKGBUILD generated by pipman
# Python package author: Adam Greig <adam@adamgreig.com>
pkgname=python-svdtools
pkgver=0.1.12
pkgrel=1
pkgdesc="svdpatch.py"
arch=(any)
url="https://github.com/stm32-rs/svdtools"
license=(UNKNOWN)
makedepends=("python" "python-pip")
build() {
  pip install --no-deps --target="svdtools" svdtools==0.1.12
}
package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r $srcdir/svdtools/* $pkgdir/"$sitepackages"
}