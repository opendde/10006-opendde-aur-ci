# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=pacpush
pkgver=2.9
pkgrel=1
pkgdesc="Utility to push an Arch hosts package and AUR caches to other hosts"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python>=3.6" "rsync" "sudo" "openssh" "python-requests" "python-ruamel-yaml")
makedepends=("python-pip" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
replaces=("pacsync")
conflicts=("pacsync")
sha1sums=('f666dc533037d85869c287154ddd83fbe90fb97a')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  PIP_CONFIG_FILE=/dev/null pip install \
    --root="$pkgdir" \
    --isolated \
    --ignore-installed \
    --no-deps \
    --disable-pip-version-check \
    --no-python-version-warning \
    --no-warn-script-location \
    --no-cache-dir \
    --no-compile \
    --progress-bar=off \
    .

  local pdir=$(python -c "import site; print(site.getsitepackages()[0])")
  local _pkgname="${pkgname//-/_}"
  cd "$pkgdir/$pdir"
  rm -f $_pkgname-*.dist-info/direct_url.json
  sed -i "/\/direct_url.json,/d" $_pkgname-*.dist-info/RECORD
  python -O -m compileall -q .
}

# vim:set ts=2 sw=2 et:
