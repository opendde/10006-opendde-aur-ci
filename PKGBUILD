# Maintainer: Philip May <eniak.info@gmail.com>
pkgname=pycharm-community-jre
_appname=pycharm-community
pkgver=2021.1.2
pkgrel=1
pkgdesc="PyCharm Community Edition IDE for Python with bundled JRE"
arch=(x86_64)
url="https://www.jetbrains.com/pycharm/"
license=('APACHE')
conflicts=(
  "pycharm-community-eap"
  "pycharm-community-edition"
)
source=(
  "https://download.jetbrains.com/python/pycharm-community-${pkgver}.tar.gz"
  pycharm.desktop
  pycharm.sh
)
noextract=()
sha256sums=(
  'e1f6abeb2db73f375c52c1a9d5e4c9de802941737822105533c3039a7be0e76a'
  'f727119ec7c8b96820e80712b1ee342de6a94ff72402e8f2d390cbff702f9b21'
  'b6f0518e59c4744ded38de63efba91205bcba406fa74944a1f3a8937566d8acc'
)

package() {
  cd "${_appname}-${pkgver}"

  # workaround FS#40934
  # see https://bugs.archlinux.org/task/40934
  sed -i 's/lcd/on/' bin/*.vmoptions

  rm -rf bin/fsnotifier{,-arm}

  install -dm 755 "${pkgdir}"/usr/share/{licenses,pixmaps,pycharm}
  cp -dr --no-preserve='ownership' bin jbr lib plugins "${pkgdir}"/usr/share/pycharm/
  cp -dr --no-preserve='ownership' license "${pkgdir}"/usr/share/licenses/pycharm/
  ln -s /usr/share/pycharm/bin/pycharm.png "${pkgdir}"/usr/share/pixmaps/
  install -Dm 644 ../pycharm.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm 755 ../pycharm.sh "${pkgdir}"/usr/bin/pycharm
}
