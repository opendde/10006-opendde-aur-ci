# Maintainer: Wilhelm Schuster <aur [aT] rot13 dot io>
pkgname=mainsail-git
_pkgname="${pkgname%-git}"
pkgver=r1087.61232df
pkgrel=1
pkgdesc="Klipper web frontend"
arch=(any)
url="https://github.com/meteyou/mainsail"
license=('GPLv3')
depends=()
makedepends=('npm')
optdepends=('nginx: serve via HTTP'
            'ustreamer: webcam streaming support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/meteyou/mainsail.git#branch=develop' 'mainsail-klipper.cfg' 'mainsail-nginx.conf')
sha256sums=('SKIP'
            '8cc7f8e97459cc9e529363f63151a205d4a3702a1d20ce864d9f7d7b51a4e1cf'
            '7c86d687ac7b1fb84fc04d1ffcd468a05767a9c9d880ad6d666b2527523495ec')

pkgver() {
  cd "$srcdir/$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  npm install --no-update-notifier --no-audit --cache "${srcdir}/npm-cache"
  ./node_modules/.bin/vue-cli-service build
}

package() {
  cd "$srcdir/$_pkgname"

  install -dm755 "${pkgdir}/usr/share/webapps"
  cp -r dist "$pkgdir/usr/share/webapps/${_pkgname}"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  install -Dm644 "${srcdir}/mainsail-klipper.cfg" "${pkgdir}/usr/share/doc/${_pkgname}/mainsail-klipper.cfg"
  install -Dm644 "${srcdir}/mainsail-nginx.conf" "${pkgdir}/usr/share/doc/${_pkgname}/mainsail-nginx.conf"
}
