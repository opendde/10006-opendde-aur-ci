# Maintainer: Prasad Kumar
pkgname=stremio-beta
pkgver=4.4.10
pkgrel=1
pkgdesc="Watch videos, movies, TV series and TV channels instantly. (Beta Version)"
arch=('x86_64')
url="https://stremio.com"
license=('custom')
provides=('stremio-beta')
makedepends=('sed')
options=('!strip')
source=("${pkgname}.appimage::https://dl.strem.io/linux/v${pkgver}/Stremio+${pkgver}.appimage")
sha512sums=('b48f3bdc7b849fee63cf826f8e6b767286897bc8b60b7ef8af4d24b6395568a1be81e87017e7fe7ccad5b9bdf941662ee3ffb0be94d0dea5a065811722de619c')

prepare() {
  chmod +x ${pkgname}.appimage
  ./${pkgname}.appimage --appimage-extract
  find ${srcdir}/squashfs-root/ -type d -exec chmod 755 {} \;
}

package() {
  cd "${srcdir}/squashfs-root/"
  install -d $pkgdir/{opt/$pkgname,usr/bin}

  cp -r "lib" "${pkgdir}/opt/${pkgname}/"
  cp -r "libexec" "${pkgdir}/opt/${pkgname}/"
  cp -r "plugins" "${pkgdir}/opt/${pkgname}/"
  cp -r "qml" "${pkgdir}/opt/${pkgname}/"
  cp -r "resources" "${pkgdir}/opt/${pkgname}/"
  cp -r "translations" "${pkgdir}/opt/${pkgname}/"
  install -Dm755 node "${pkgdir}/opt/${pkgname}/"
  install -Dm644 qt.conf "${pkgdir}/opt/${pkgname}/"
  install -Dm644 server.js "${pkgdir}/opt/${pkgname}/"
  install -Dm755 stremio "${pkgdir}/opt/${pkgname}/"
  install -Dm755 stremio.asar "${pkgdir}/opt/${pkgname}/"

  ln -s /opt/${pkgname}/stremio "${pkgdir}"/usr/bin/stremio-beta
  install -Dm644 stremio.desktop "$pkgdir/usr/share/applications/stremio-beta.desktop"
  sed -i 's/Name=Stremio/Name=Stremio\ Beta/g; s/Exec=.\/stremio/Exec=env\ LD_PRELOAD="\/usr\/lib\/libnss3.so"\ stremio-beta/g; s/Icon=stremio/Icon=stremio-beta/g' $pkgdir/usr/share/applications/stremio-beta.desktop
  install -Dm644 "stremio.png" "$pkgdir/usr/share/icons/stremio-beta.png"
}
