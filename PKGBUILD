# Maintainer: libertylocked <libertylocked@disroot.org>
# Contributor: Milo Gilad <myl0gcontact@gmail.com>

pkgname=bitwarden
pkgver=1.25.0
pkgrel=2
_jslibcommit='f80e89465ffc004705d2941301c0ffb6bfd71d1a'
_nodeversion='10.24.0'
pkgdesc='Bitwarden Desktop Application'
arch=('x86_64' 'aarch64')
url='https://github.com/bitwarden/desktop'
license=('GPL3')
makedepends=('git' 'npm' 'python' 'nvm' 'jq' 'patch' 'pkgconf' 'make' 'gcc')
depends=('electron' 'libnotify' 'libsecret' 'libxtst')
conflicts=('bitwarden-git' 'bitwarden-bin')
options=('!strip' '!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bitwarden/desktop/archive/v${pkgver}.tar.gz"
        "jslib-${_jslibcommit}.tar.gz::https://github.com/bitwarden/jslib/archive/${_jslibcommit}.tar.gz"
        "package.json.patch"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha512sums=('6e8afb290030c7e23d5050ec88cd37a6600fd51b5452f5ec571ace35b95012ab8c19a3c2c3b76a981d0e37bdee08439d98d1c39bc169374dfec401af974ec6e7'
            'e0a80a2088af56b68494356856101574b9c9aef3cad9ef384cd61ee45eb3cb398346604c72cf8ea6522f6747a08ab25d0590d9d17e4116bcdc6726864f95b506'
            'cbe6dff699de7a274b7c5ab1dd25a348443dd3dc50eb8b2290c8c300b6b3a560271aef773b2cd55d25ccaa1527ed25d5626310f6da342f2893d2f63212bd2814'
            '724b548688e2af1d8d25e6ebe6e35831e891453f2df011e5fa757b57fcbcfef3c171510be4537652891441c65121bd9766f372f82d3edd5971fb77b726409575'
            '05b771e72f1925f61b710fb67e5709dbfd63855425d2ef146ca3770b050e78cb3933cffc7afb1ad43a1d87867b2c2486660c79fdfc95b3891befdff26c8520fd')

prepare() {
  # Link jslib
  rmdir "${srcdir}/desktop-${pkgver}/jslib"
  ln -s "${srcdir}/jslib-${_jslibcommit}" "${srcdir}/desktop-${pkgver}/jslib"
  cd "${srcdir}/desktop-${pkgver}"

  # Patch out postinstall routines
  patch --strip=1 package.json ${srcdir}/package.json.patch

  # Patch build to make it work with system electron
  SYSTEM_ELECTRON_VERSION=$(pacman -Q electron | cut -d' ' -f2 | cut -d'-' -f1)
  jq < package.json --arg ver $SYSTEM_ELECTRON_VERSION\
  '.build["electronVersion"]=$ver | .build["electronDist"]="/usr/lib/electron"'\
  > package.json.patched
  mv package.json.patched package.json
}

build() {
  export npm_config_cache="$srcdir/npm_cache"
  local npm_prefix=$(npm config get prefix)
  npm config delete prefix
  source /usr/share/nvm/init-nvm.sh
  nvm install ${_nodeversion} && nvm use ${_nodeversion}

  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  cd "${srcdir}/desktop-${pkgver}/jslib"
  npm install
  cd "${srcdir}/desktop-${pkgver}"
  npm install
  npm run build
  npm run clean:dist
  npx electron-builder build --dir

  # Restore node config from nvm
  npm config set prefix "${npm_prefix}"
  nvm unalias default
}

package() {
  cd "${srcdir}/desktop-${pkgver}"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"

  if [ $CARCH == "aarch64" ]; then
    cp -r dist/linux-arm64-unpacked/resources "${pkgdir}/usr/lib/${pkgname}/"
  else
    cp -r dist/linux-unpacked/resources "${pkgdir}/usr/lib/${pkgname}/"
  fi
  
  install -dm755 "${pkgdir}/usr/share/icons/hicolor"
  for i in 16 32 48 64 128 256 512; do
    install -Dm644 resources/icons/${i}x${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done
  install -Dm644 resources/icon.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname}.png"

  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/bitwarden-desktop"

  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
}
