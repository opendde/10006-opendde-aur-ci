# Maintainer: MrSoup678 <slawekwaga@gmail.com>

pkgname=nodejs-crontab-ui-server
pkgver=0.3.4
pkgrel=1
pkgdesc="Easy management of crontab file - server component"
url="https://github.com/alseambusher/crontab-ui"
arch=("any")
license=("MIT")
depends=("nodejs")
makedepends=("npm")
pkgver() {
  cd "$pkgname"
 git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
md5sums=()


package() {
    npm install -g --user root --prefix "$pkgdir"/usr crontab-ui

}
