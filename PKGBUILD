# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-keeweb
pkgver=0.6.2
pkgrel=1
pkgdesc="Open Keepass stores inside Nextcloud"
arch=('any')
url="https://github.com/jhass/nextcloud-keeweb"
license=('AGPL')
depends=('nextcloud')
makedepends=()
options=('!strip')
source=("https://github.com/jhass/nextcloud-keeweb/releases/download/v${pkgver}/keeweb-${pkgver}.tar.gz")
sha512sums=('e7cec84c3bab6472e7f6df4b72928d9f66a1f2241d753bfc4d57d306bf738142cb8e10bc35ac8a7668887b4c740038340a9452fadfa8005e02b12bd8ce4a0e00')

package() {
  install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
  cp -a "${srcdir}/keeweb" "${pkgdir}/usr/share/webapps/nextcloud/apps/keeweb"
}
