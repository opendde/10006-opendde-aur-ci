# Maintainer: luxcem <a@luxcem.fr>
# Contributor: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributor: vscncls <lucaslou4@protonmail.com>

pkgname=insomnia
pkgver=2020.4.2
pkgrel=6
_nodeversion=12.18.3
pkgdesc="Cross-platform HTTP and GraphQL Client"
url="https://github.com/Kong/insomnia"
arch=('any')
license=('MIT')
depends=('electron')
makedepends=('npm' 'nvm')
source=(
  "https://github.com/Kong/insomnia/archive/core@${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "insomnia.desktop"
  "insomnia.sh"
)
b2sums=('2527045680d99d0321ce9a29f8d3e9302bd07c79d059d0a2e9c3f963d2adb45c9566668faca817a0f4913ee22728ebb8f553463ae6cdc731793520a3371d0953'
        'd2ceeb224fa3a35551b0929648d5e066da93a451a66b73373c13ed0dd89575a2482c2dc8e7499b214d0d62cca2532189dac9a681537751a5a86b592cae5686c7'
        '7ea4aff2779267bfc5f7be5533d70b07a3da1c8bfed424c9f6cc9806fe6567a4cd40144264a8827b016e51f31c6dbb395c90aac4d333f297070213c77a0b2c9c')

prepare() {
  # Use local electron version
  # See https://wiki.archlinux.org/index.php/Electron_package_guidelines

  cd ${pkgname}-core-${pkgver}
  electron_version=$(electron --version | sed s/v//)
  sed -i 's/"electron": ".\+"/"electron": "'"$electron_version"'"/g' packages/insomnia-app/package.json
  source /usr/share/nvm/init-nvm.sh || [ -n "$NVM_BIN" ]

  # Do not use ~/.nvm
  export NVM_DIR=$(pwd)/.nvm
  nvm install ${_nodeversion}
}

build() {
  cd ${pkgname}-core-${pkgver}
  npm run bootstrap
  GIT_TAG="core@${pkgver}" npm run app-package
}

package() {
  # Install start script
  install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/insomnia"
  install -Dm644 ${pkgname}.desktop -t "${pkgdir}/usr/share/applications"

  cd ${pkgname}-core-${pkgver}
  install -Dm644 packages/insomnia-app/dist/com.insomnia.app/linux-unpacked/resources/app.asar -t "${pkgdir}/usr/share/insomnia"

  for size in 16 32 48 128 256 512; do
    install -Dm644 packages/insomnia-app/build/com.insomnia.app/static/icon.png "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/insomnia.png"
  done

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

