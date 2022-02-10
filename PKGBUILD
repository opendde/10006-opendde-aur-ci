# Copyright (C) 2020  Matthew "strager" Glazar
# See end of file for extended copyright information.

# Maintainer: Matthew "strager" Glazar <strager.nds@gmail.com>
# Contributor: Shivam Mehta <sm.cse at gmail dot com>

pkgname=quick-lint-js
pkgver=2.1.0
pkgrel=1
pkgdesc="Find bugs in JavaScript programs"
arch=(aarch64 arm armv6h armv7h i686 pentium4 x86_64)
url="https://quick-lint-js.com/"
license=(Apache Boost GPL3)
depends=(gcc-libs)
makedepends=(cmake gcc ninja)
checkdepends=(icu)
provides=()
conflicts=(quick-lint-js)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://c.quick-lint-js.com/releases/${pkgver}/source/quick-lint-js-${pkgver}.tar.gz"
  "${pkgname}-${pkgver}.tar.gz.asc::https://c.quick-lint-js.com/releases/${pkgver}/source/quick-lint-js-${pkgver}.tar.gz.asc"
)
sha512sums=('f16a3268b31ffbc04bc06ebd6b56fe73398d5eac6ae295b3f20f03ad804a4153dd05efd893dcbb2be55e3adc6a2e1f33661ed0bbcd603a960cd9204a783122ad'
            'SKIP')
# Matthew "strager" Glazar (quick-lint-js signing key) <strager.nds@gmail.com>
validpgpkeys=(0327DE8F9CEF499851D19F6ED20BA9DCCF0E9D20)

build() {
  cd "${pkgname}-${pkgver}"
  cmake -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_BUILD_WITH_INSTALL_RPATH=YES \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQUICK_LINT_JS_INSTALL_LICENSES_DIR="share/licenses/${pkgname}" \
    -S . -B build
  ninja -C build
}

check() {
  cd "${pkgname}-${pkgver}"
  ninja -C build test
}

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}/" ninja -C build install
}

# quick-lint-js finds bugs in JavaScript programs.
# Copyright (C) 2020  Matthew "strager" Glazar
#
# This file is part of quick-lint-js.
#
# quick-lint-js is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# quick-lint-js is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with quick-lint-js.  If not, see <https://www.gnu.org/licenses/>.
