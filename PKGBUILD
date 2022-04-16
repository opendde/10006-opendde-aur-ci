# Copyright (C) 2020  Matthew "strager" Glazar
# See end of file for extended copyright information.

# Maintainer: Matthew "strager" Glazar <strager.nds@gmail.com>
# Contributor: Shivam Mehta <sm.cse at gmail dot com>

pkgname=quick-lint-js
pkgver=2.4.0
pkgrel=1
pkgdesc="Find bugs in JavaScript programs"
arch=(aarch64 arm armv6h armv7h i686 pentium4 x86_64)
url="https://quick-lint-js.com/"
license=(Apache Boost GPL3)
depends=(gcc-libs hicolor-icon-theme)
makedepends=(cmake gcc ninja)
checkdepends=(icu)
provides=()
conflicts=(quick-lint-js)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://c.quick-lint-js.com/releases/${pkgver}/source/quick-lint-js-${pkgver}.tar.gz"
  "${pkgname}-${pkgver}.tar.gz.asc::https://c.quick-lint-js.com/releases/${pkgver}/source/quick-lint-js-${pkgver}.tar.gz.asc"
)
sha512sums=('91132a316604ce981fb3d81b235917762044a782be2c8382e7de62539b2a42c1c1aef198edb09a5969fc7c41e46163f71706a2d30d79533030220e2c2dd97ef0'
            'SKIP')
# Matthew "strager" Glazar (quick-lint-js signing key) <strager.nds@gmail.com>
validpgpkeys=(0327DE8F9CEF499851D19F6ED20BA9DCCF0E9D20)
options=(lto)

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
