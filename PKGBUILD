# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-podcast
pkgver=0.2.0
pkgrel=1
pkgdesc="Selfhosted podcast manager for your personal cloud"
arch=('any')
url="https://git.project-insanity.org/onny/nextcloud-app-podcast"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("nextcloud-app-podcast-${pkgver}.tar.gz::https://git.project-insanity.org/onny/nextcloud-app-podcast/-/jobs/1169/artifacts/raw/build/artifacts/podcast.tar.gz")
sha512sums=('a308dd744489489c52212fc1ccdf8955d6d191444fee617567da00a36503c32524775e8c7f2eeb6fd5b0dfadd61b4d903d25832bd6dd7980eb53702bff0f2097')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/podcast" "${pkgdir}/usr/share/webapps/nextcloud/apps/podcast"
}
