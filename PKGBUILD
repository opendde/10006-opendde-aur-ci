# Maintainer: blacktemplar (blacktemplar@a1.net)
pkgname=augur-git
_gitname=augur-app
_pkgname=augur
pkgver=v1.7.1
pkgrel=1
pkgdesc="Augur Desktop Application"
arch=('any')
url="https://github.com/AugurProject/augur-app"
license=('MIT')
depends=('gconf' 'electron')
conflicts=('augur')
provides=('augur')
makedepends=('git' 'npm' 'nvm')
source=("${_gitname}::git+https://github.com/AugurProject/$_gitname.git"
        "${_pkgname}.desktop")
sha512sums=('SKIP'
            'fe0999dbfebc57849177d7a376bf827b8f4280114907a4b5a95f7fb9b8ac15c006dd8c8ac137768d0d05a6e47e8bda8ed21a02bd1d7dca3c1fb932bc9d455447')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"

  _npm_prefix=$(npm config get prefix)
  npm config delete prefix

  # Switch to required node version see https://github.com/AugurProject/augur-app/issues/72
  source /usr/share/nvm/init-nvm.sh --install
  nvm install 9 && nvm use 9
 
  npm install
  npm run make-linux dir --dir

  # Restore config
  npm config set prefix ${_npm_prefix}
  nvm unalias default
}

package(){
  cd "$srcdir/$_gitname"

  install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
  cp -dr --no-preserve=ownership dist/linux-unpacked/* "${pkgdir}/usr/lib/${_pkgname}/"

  install -dm755 "${pkgdir}/usr/share/icons/hicolor"
  install -Dm644 build/icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${_pkgname}/augur" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
