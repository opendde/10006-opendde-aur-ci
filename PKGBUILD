# Maintainer: Jannick Hemelhof <mister {dot} jannick {at} gmail {dot} com>
# Contributor: Nicola Squartini <tensor5 {at} gmail {dot} com>
# Contributor: NicoHood <aur {at} nicohood {dot} de>
# Contributor: Dick Choi <fluke8259 {at} gmail {dot} com>
# Contributor: Romain Bazile <gromain {dot} baz {at} gmail {dot} com>
pkgname=boostnote
_pkgname=Boostnote
pkgver=0.16.1
pkgrel=1
pkgdesc="Open source note-taking app for programmers"
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
depends=('electron' 'nodejs')
makedepends=('yarn' 'grunt-cli' 'git')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/BoostIO/"${_pkgname}"/archive/"${pkgver}".tar.gz"
  "${pkgname}.js"
  "${pkgname}.desktop"
  "warning-fix.patch"
  "remove-analytics.patch"
  "electron_5_fix.patch"
  )

sha512sums=('eeb37f835bc74f7022f5f7cdf55513541f1aafd9b0d055ce84072b05d35645d8de544349e52a6243a0ff739de6e565aeec04bd9306584da9aa5f1bbc0a8755f2'
            '1f0ccd2a3632a12c4714d97b9f909ddc94b53d6f86a9e4bdcab31abd55a93071a2c35c6e1e9527b747de6dd74b8a5276414980c11e174085f28b8f2d2721230a'
            '18bcda13580da8ceeaa86793a77ec00a053b8fd51451dad7e2b1a19553fe1a467ac647b44b789212e783f3f6a80968cc9404e884ef7ff6b1f6588473b3229d40'
            'a52e5631867e2c5f18465dee6a3201b9b5c546bda373205c4891c9f7b6114599e0854e2b49defb55ee7bea0778a7fde9c9d9f7271dceeeece743a2d72e2fd0c6'
            'aa25e326f7bddb0855f4d38c3105a6347e69b780ab86e18612c80fe4b004a7adb83aee8daf7f75f4806411164676235b83968037f017ae6def6b7d8183984674'
            'ad745b9643e9a677a2a3840c02c8dad7af33e35007141dbc33ff8f7c084b66bd1a794ef44340925fc9d6d77065f41709be56cc8ac55a978e7dc7d520cf8777bf')

prepare() {
  cd "${_pkgname}-${pkgver}"

  patch -Np1 -i "${srcdir}/warning-fix.patch"
  patch -Np1 -i "${srcdir}/remove-analytics.patch"
  patch -Np1 -i "${srcdir}/electron_5_fix.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"

  yarn install --ignore-optional
  yarn run compile
  rm -r node_modules/
  yarn install --production --ignore-optional
}

package() {
  cd "${_pkgname}-${pkgver}"

  appdir="/usr/lib/${pkgname}"

  install -dm755 "${pkgdir}""${appdir}"
  cp -a * "${pkgdir}""${appdir}"

  install -Dm755 "${srcdir}/${pkgname}.js" "$pkgdir/usr/bin/${pkgname}"

  install -Dm644 resources/app.png "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"

  # Remove stuff we do not need
  find "${pkgdir}"/usr/lib/"${pkgname}"/node_modules \
      -name "*.a" -exec rm '{}' \; \
      -or -name "*.bat" -exec rm '{}' \; \
      -or -name "*.node" -exec chmod a-x '{}' \; \
      -or -name "benchmark" -prune -exec rm -r '{}' \; \
      -or -name "doc" -prune -exec rm -r '{}' \; \
      -or -name "html" -prune -exec rm -r '{}' \; \
      -or -name "man" -prune -exec rm -r '{}' \; \
      -or -path "*/less/gradle" -prune -exec rm -r '{}' \; \
      -or -path "*/task-lists/src" -prune -exec rm -r '{}' \;
}
