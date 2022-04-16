# Maintainer: hacker1024 <joshleivenzon at outlook dot com>

_pkgname=mint-themes
pkgname=${_pkgname}-git
pkgver=1.9.6.r13.g4e19d767
pkgrel=1
pkgdesc="Linux Mint themes"
arch=(any)
url="https://github.com/linuxmint/mint-themes"
license=(GPL3)
makedepends=(git python sassc)
conflicts=("${_pkgname}" 'mint-x-theme' 'mint-y-theme')
provides=("${_pkgname}" 'mint-x-theme' 'mint-y-theme')
options=(!strip)
source=("git+https://github.com/linuxmint/mint-themes.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  make
  find "${srcdir}/${_pkgname}"/usr/share/themes -type f -name "metacity*xml" -exec sed -i 's:normal_dialog_style_set:normal_style_set:' {} \;
}

package() {
  cp -aR --no-preserve=ownership "${srcdir}/${_pkgname}"/usr "${pkgdir}"
}
